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
            $pastCredAmt = $entryData['payment_credits_used'];
            $vendorid = $entryData['payment_vendor'];
            $return = updateNumericbyand($dbcon,"+$pastCredAmt","vendorprofile","vendor_credit_bal","vendorid",$vendorid);

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

    $dbcon->commit();

}catch(Exception $e){
    $dbcon->rollback();
}finally{
    $dbcon->close();

}


?>