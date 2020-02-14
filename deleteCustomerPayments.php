<?php
include("database/db_conection.php");//make connection here
include('workers/getters/functions.php');
// sql to delete a record
$bdid = $_GET['cust_payment_id'];
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
    $entryData = findbyand($dbcon,$bdid,'customer_payments','cust_payment_id')['values'][0];
    $payamt = $entryData['cust_payment_amount']+$entryData['cust_payment_credits_used'];
    // add new payment
    $return = updateNumericbyand($dbcon,"+$payamt","invoices","inv_balance_amt","inv_code",$entryData['cust_payment_invoice_no']);
    $cust_payment_invoice_no = $entryData['cust_payment_invoice_no'];

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
        print_r($return);
        
        if($entryData['cust_payment_credits_used']!=""){
            $credAmt = $entryData['cust_payment_credits_used'];
            $custid = $entryData['cust_payment_customer'];

            $customerprofile = findbyand($dbcon,$custid,"customerprofile","custid")['values'][0];

            if($customerprofile['cust_credit_bal']>=$entryData['cust_payment_credits_used']){
                $sql90 = " UPDATE customerprofile SET cust_credit_bal =  cust_credit_bal + ".$credAmt."  WHERE custid='".$custid."' ;";

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
        print_r($return);

        if($return['status']){

            $pastTran = findLastTrans($dbcon,$bdid,'transactions','trans_row_id');
            $pastData = $pastTran['values'][0];
            $entryData['payment_mode'] = $entryData['cust_payment_mode'];
            $entryData['trans_bank'] = $entryData['cust_payment_mode']!=="Cash" ?  $entryData['cust_payment_bank'] : "";
    
            $entryData['payment_status'] = $entryData['cust_payment_mode']==="Cheque"?$entryData['cust_payment_cheque_status ']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
            $rowId = $bdid;
            $entity = 'customer_payments';
    
            $entryData['amount'] = $pastData['trans_amt'];
            $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$session_org,$session_user,"reverse");
    
            if(!$return['status']){
                throw new Exception();
            }else{
            
                    $sql = "DELETE FROM customer_payments WHERE cust_payment_id='".$_GET['cust_payment_id']."' ";
    
                    if ($dbcon->query($sql) === TRUE) {
                        header("Location: listCustomerPayments.php");
                    } else {
                        echo "Error deleting record: " . $dbcon->error;
                        throw new Exception();
                    }
            
            }
        }else{
            $return['status']=false;
            throw new Exception();
        }
        
    }else{
        $return['status']=false;
        throw new Exception();
    }


    $dbcon->commit();

}catch(Exception $e){
    $dbcon->rollback();
}finally{
    $dbcon->close();

}


?>