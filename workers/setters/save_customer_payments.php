
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

try{

    $dbcon->begin_transaction();

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $cust_payment_id=$_POST['cust_payment_id'];
    $cust_payment_invoice_no=$_POST['cust_payment_invoice_no'];
    $total_amount=$_POST['total_amount'];
    //$page_cust_payment_v_credits_id=$_POST['page_cust_payment_v_credits_id'];
    $handler=$_POST['handler'];
    $compId=$_POST['compId'];

    $action=$_POST['action'];
    $table=$_POST['table'];
    $return=array();

    if ($cust_payment_id=="") {
        $cust_payment_id = get_id($dbcon,$table,"CUSTPAY-000");
    }


    if($action=="add"){
        $sql2 = "INSERT INTO customer_payments (cust_payment_id) VALUES ('$cust_payment_id')";
        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$cust_payment_id,$table,"cust_payment_id");
            $entryData = json_decode($array,true);
             $entryData['payment_status'] = $entryData['cust_payment_mode']==="Cheque"?$entryData['cust_payment_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;

            if($return['status']){
                if($entryData['payment_status']==="Completed"){
                $inv_val_arr = findbyand($dbcon,$cust_payment_invoice_no,"invoices","inv_code");
                // print_r($grn_val_arr);
                $balance = $inv_val_arr['values'][0]['inv_balance_amt']-$total_amount;
                $return = updatebyand($dbcon,$balance,"invoices","inv_balance_amt","inv_code",$cust_payment_invoice_no);
                //update_open_balance($dbcon,'recievables');

                if($return['status']){
                    $inv_val_arr = findbyand($dbcon,$cust_payment_invoice_no,"invoices","inv_code");

                    if($inv_val_arr['values'][0]['inv_balance_amt']==0){
                        $return = updatebyand($dbcon,"Paid","invoices","inv_payment_status","inv_code",$cust_payment_invoice_no);
                        $return = updatebyand($dbcon,"Closed","invoices","inv_status","inv_code",$inv_val_arr['values'][0]['inv_code']);
                        if($inv_val_arr['values'][0]['inv_so_code']!=null||$inv_val_arr['values'][0]['inv_so_code']!=""){
                            $return = updatebyand($dbcon,"Closed","salesorders","so_status","so_code",$inv_val_arr['values'][0]['inv_so_code']);    
                        }
    
    
                    }else if($inv_val_arr['values'][0]['inv_balance_amt']>0&&$inv_val_arr['values'][0]['inv_balance_amt']<$inv_val_arr['values'][0]['inv_value']){
                        $return = updatebyand($dbcon,"Partially Paid","invoices","inv_payment_status","inv_code",$cust_payment_invoice_no);
                    }else if($inv_val_arr['values'][0]['inv_balance_amt']==$inv_val_arr['values'][0]['inv_value']){
                        $return = updatebyand($dbcon,"UnPaid","invoices","inv_payment_status","inv_code",$cust_payment_invoice_no);
                    }
    
                    
                    if($entryData['cust_payment_credits_used']!=""){
                        $credAmt = $entryData['cust_payment_credits_used'];
                        $custid = $entryData['cust_payment_customer'];
                        $customerprofile = findbyand($dbcon,$custid,"customerprofile","custid")['values'][0];
                        
                        if($customerprofile['cust_credit_bal']>=$entryData['cust_payment_credits_used']){
                            $sql90 = " UPDATE customerprofile SET cust_credit_bal =  cust_credit_bal - ".$credAmt."  WHERE custid='".$custid."' ;";

                            if (mysqli_query($dbcon,$sql90)) {
                                $return['status']=true;
                            }else{
                                $return['status']=false;
                                $return['error']=mysqli_error($dbcon);
                                throw new Exception();
                            }
                        }else{
                            $return['status']=false;
                            $return['message']="Insuffucient Funds";
                            throw new Exception();
                        }
                      
                    }
    
                    // correct verson
                    if($return['status']){
                        $transData = json_decode($array,true);
                    // $entryData['amount'] = $entryData['cust_payment_amount'];
                        $entryData['amount'] = $entryData['cust_payment_amount'];
                        $entryData['payment_mode'] = $entryData['cust_payment_mode'];
                        $entryData['trans_bank'] = $entryData['cust_payment_mode']!=="Cash" ? $entryData['cust_payment_bank'] : "";
                        $entryData['payment_status'] = $entryData['cust_payment_mode']==="Cheque"?$entryData['cust_payment_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
                        $rowId = $cust_payment_id;
                        $entity = $table;
                        if($entryData['payment_status']==="Completed"){
                            $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");
        
                            if(!$return['status']){
                                throw new Exception();
                            }
                        }
                    }
                }else{
                    throw new Exception();
                }
                }else{

                    }
        
        }else{
            throw new Exception();
        }

        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
            throw new Exception();
        }
    }else{
        $pastPayment = findbyand($dbcon,$cust_payment_id,"customer_payments","cust_payment_id")['values'][0];

        $return = update_query($dbcon,$array,$cust_payment_id,$table,"cust_payment_id");
        $entryData = json_decode($array,true);
        $entryDataNew = json_decode($array,true);
        $entryData['payment_status'] = $entryData['cust_payment_mode']==="Cheque"?$entryData['cust_payment_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;

        if($return['status']){
            if($entryData['payment_status'] ==="Completed"){
                if($entryData['cust_payment_mode'] !== "Cheque" && $entryData['payment_status']==="Completed"){
                    $pastpayamt = $pastPayment['cust_payment_amount']+$pastPayment['cust_payment_credits_used'];
                    // deduct past payment
                    $return = updateNumericbyand($dbcon,"+$pastpayamt","invoices","inv_balance_amt","inv_code",$pastPayment['cust_payment_invoice_no']);
                }
            if($return['status']){
                    $payamt = $entryData['cust_payment_amount']+$entryData['cust_payment_credits_used'];
                    // add new payment
                    $return = updateNumericbyand($dbcon,"-$payamt","invoices","inv_balance_amt","inv_code",$entryData['cust_payment_invoice_no']);
                   
                if($return['status']){

                    $inv_val_arr = findbyand($dbcon,$cust_payment_invoice_no,"invoices","inv_code");

                    if($inv_val_arr['values'][0]['inv_balance_amt']==0){
                        $return = updatebyand($dbcon,"Paid","invoices","inv_payment_status","inv_code",$cust_payment_invoice_no);
                        $return = updatebyand($dbcon,"Closed","invoices","inv_status","inv_code",$inv_val_arr['values'][0]['inv_code']);
                        if($inv_val_arr['values'][0]['inv_so_code']!=null||$inv_val_arr['values'][0]['inv_so_code']!=""){
                            $return = updatebyand($dbcon,"Closed","salesorders","so_status","so_code",$inv_val_arr['values'][0]['inv_so_code']);    
                        }
    
    
                    }else if($inv_val_arr['values'][0]['inv_balance_amt']>0&&$inv_val_arr['values'][0]['inv_balance_amt']<$inv_val_arr['values'][0]['inv_value']){
                        $return = updatebyand($dbcon,"Partially Paid","invoices","inv_payment_status","inv_code",$cust_payment_invoice_no);
                    }else if($inv_val_arr['values'][0]['inv_balance_amt']==$inv_val_arr['values'][0]['inv_value']){
                        $return = updatebyand($dbcon,"UnPaid","invoices","inv_payment_status","inv_code",$cust_payment_invoice_no);
                    }

                    
                    if($entryData['cust_payment_credits_used']!=""){
                        $pastCredAmt = $pastPayment['cust_payment_credits_used'];
                        $credAmt = $entryData['cust_payment_credits_used'];
                        $custid = $entryData['cust_payment_customer'];

                        $return = updateNumericbyand($dbcon,"+$pastCredAmt","customerprofile","cust_credit_bal","custid",$custid);
                          if($return['status']){
                            $customerprofile = findbyand($dbcon,$custid,"customerprofile","custid")['values'][0];

                            if($customerprofile['cust_credit_bal']>=$entryData['cust_payment_credits_used']){
                                $sql90 = " UPDATE customerprofile SET cust_credit_bal =  cust_credit_bal - ".$credAmt."  WHERE custid='".$custid."' ;";

                                if (mysqli_query($dbcon,$sql90)) {
                                    $return['status']=true;
                                }else{
                                    $return['status']=false;
                                    $return['error']=mysqli_error($dbcon);
                                    throw new Exception();
                                }
                            }else{
                                $return['status']=false;
                                $return['message']="Insuffucient Funds";
                                throw new Exception();
                            }
                          }else{
                            $return['status']=false;
                            $return['error']=mysqli_error($dbcon);
                            throw new Exception();
                          }
       
                    }


                    if($return['status']){
                        $entryData['amount'] = $entryData['cust_payment_amount'];
                        $entryData['payment_mode'] = $entryData['cust_payment_mode'];
                        $entryData['trans_bank'] = $entryData['cust_payment_mode']!=="Cash" ? $entryData['cust_payment_bank'] : "";
                        $entryData['payment_status'] = $entryData['cust_payment_mode']==="Cheque"?$entryData['cust_payment_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
                        $rowId = $cust_payment_id;
                        $entity = $table;
                      
                        if($entryData['payment_mode'] === "Cheque" && $entryData['payment_status']==="Completed"){
                            $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");
                       
                        }else if($entryData['payment_status']==="Completed"){
                            $pastTran = findLastTrans($dbcon,$cust_payment_id,'transactions','trans_row_id');
                            $pastData = $pastTran['values'][0];
                            $entryData['amount'] = $pastData['trans_amt'];
                            $entryData['trans_bank'] = $entryData['cust_payment_mode']!=="Cash" ? $entryData['cust_payment_bank']:"";
                            // reverse
                            $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"reverse");
                            if($return['status']){
                                $entryData['amount'] = $entryDataNew['cust_payment_amount'];
                                //new entry
                                $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");
            
                                if(!$return['status']){
                                    $return['status']=false;
                                    throw new Exception();
                                }
                            }else{
                                $return['status']=false;
                                throw new Exception();
                            }
                        
                        }else{
                            $return['status']=false;
                            $return['error']=mysqli_error($dbcon);
                            throw new Exception();
                        }

                    }else{
                      throw new Exception();
                    }

                    
                }else{
                    $return['status']=false;
                    throw new Exception();
                }


            }else{
                $return['status']=false;
                throw new Exception();
            }
        }else{

        }
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
            throw new Exception();
        }
    }

}
// Commit transaction
$dbcon->commit();


}catch(Exception $e){
// Rollback transaction
 "rollback";
 $dbcon->rollback();

}finally{
// Close connection
 $dbcon->close();
 echo json_encode($return);
}

?>
