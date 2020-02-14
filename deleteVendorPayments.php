<?php
include("database/db_conection.php");//make connection here
include('workers/getters/functions.php');
// sql to delete a record
$bdid = $_GET['payment_id'];
// reversing transactions
session_start();



if(isset($_SESSION['login_email'])){
    $userid = $_SESSION['userid'];
    $sq = "select * from userprofile where id='$userid'";
    $result = mysqli_query($dbcon, $sq) or die(mysqli_error($dbcon));
    //$count = mysqli_num_rows($result);
    $rs = mysqli_fetch_assoc($result);
    $session_user = $rs['username'];
    $session_org = $rs['compcode'];
}


try{
    $dbcon->begin_transaction();

    $entryData = findbyand($dbcon,$bdid,'payments','payment_id')['values'][0];


        $entryData = findbyand($dbcon,$bdid,'payments','payment_id')['values'][0];
        $payamt = $entryData['payment_amount']+$entryData['payment_credits_used'];
        // add new paymen
        $return = updateNumericbyand($dbcon,"+$payamt","grn_notes","grn_balance","grn_id",$entryData['payment_grn_id']);
        $payment_grn_id = $entryData['payment_grn_id'];

        if($return['status']){
            
            if($return['status']){
                $grn_val_arr = findbyand($dbcon,$payment_grn_id,"grn_notes","grn_id");

                if($grn_val_arr['values'][0]['grn_balance']==0){
                    $return = updatebyand($dbcon,"Paid","grn_notes","grn_payment_status","grn_id",$payment_grn_id);

                    if($return['status']){      
                        if($grn_val_arr['values'][0]['grn_po_code']){
                            $return = updatebyand($dbcon,"Closed","purchaseorders","po_status","po_code",$grn_val_arr['values'][0]['grn_po_code']);
                            if(!$return['status']){      
                                throw new Exception();
                            }
                        }      
                    }else{
                        throw new Exception();
                    }
    
                }else if($grn_val_arr['values'][0]['grn_balance']>0&&$grn_val_arr['values'][0]['grn_balance']<$grn_val_arr['values'][0]['grn_po_value']){
                    $return = updatebyand($dbcon,"Partially Paid","grn_notes","grn_payment_status","grn_id",$payment_grn_id);
                    if(!$return['status']){      
                        throw new Exception();
                    }
                }else if($grn_val_arr['values'][0]['grn_balance']==$grn_val_arr['values'][0]['grn_po_value']){
                    $return = updatebyand($dbcon,"UnPaid","grn_notes","grn_payment_status","grn_id",$payment_grn_id);
                    if(!$return['status']){      
                        throw new Exception();
                    }
                }

             
                if($entryData['payment_credits_used']!=""){
                    $credAmt = $entryData['payment_credits_used'];
                    $vendorid = $entryData['payment_vendor'];
                    $vendorprofile = findbyand($dbcon,$vendorid,"vendorprofile","vendorid")['values'][0];

                    $sql90 = " UPDATE vendorprofile SET vendor_credit_bal =  vendor_credit_bal + ".$credAmt."  WHERE vendorid='".$vendorid."' ;";

                        if (mysqli_query($dbcon,$sql90)) {
                            $return['status']=true;
                        }else{
                            $return['status']=false;
                            $return['error']=mysqli_error($dbcon);
                            throw new Exception();
                        }
                  
                }

                if($return['status']){
                    $pastTran = findLastTrans($dbcon,$bdid,'transactions','trans_row_id');
                    $pastData = $pastTran['values'][0];
                    $entryData['payment_mode'] = $entryData['payment_mode'];
                    $entryData['trans_bank'] = $entryData['payment_mode']!=="Cash" ?  $entryData['payment_bank'] : "";
            
                    $entryData['payment_status'] = $entryData['payment_mode']==="Cheque"?$entryData['payment_cheque_status ']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
                    $rowId = $bdid;
                    $entity = 'payments';
            
                    $entryData['amount'] = $pastData['trans_amt'];
                    $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$session_org,$session_user,"reverse");

                    if(!$return['status']){
                        throw new Exception();
                    }else{
                 
                        if($return['status']){
            
                            $sql = "DELETE FROM payments WHERE payment_id='".$_GET['payment_id']."' ";
            
                            if ($dbcon->query($sql) === TRUE) {
                                header("Location: listPaymentsMade.php");
                            } else {
                                echo "Error deleting record: " . $dbcon->error;
                                throw new Exception();
                            }
                        }else{
                            throw new Exception();
                        }
                    
                    }
            
                }else{
                    throw new Exception();
                }
        }else{
            throw new Exception();
        }
    }else{
        throw new Exception();
    }




    $dbcon->commit();

}catch(Exception $e){
    $dbcon->rollback();
}finally{
    $dbcon->close();

}


?>