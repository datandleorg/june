<?php
include("database/db_conection.php");//make connection here
include('workers/getters/functions.php');
// sql to delete a record
$bdid = $_GET['id'];
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

        $entryData = findbyand($dbcon,$bdid,'vendorcredits','v_credits_id')['values'][0];
        $pastTran = findLastTrans($dbcon,$bdid,'transactions','trans_row_id');
        $pastData = $pastTran['values'][0];
        $entryData['payment_mode'] = $entryData['v_credits_paymentmode'];
        $entryData['trans_bank'] = $entryData['payment_mode']!=="Cash" ?  $entryData['v_credits_bank'] : "";

        $entryData['payment_status'] = $entryData['v_credits_paymentmode']==="Cheque"?$entryData['v_credits_cheque_status ']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
        $rowId = $bdid;
        $entity = 'vendorcredits';

        $entryData['amount'] = $pastData['trans_amt'];
        $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$session_org,$session_user,"reverse");


        if(!$return['status']){
            throw new Exception();
        }else{

            //updating vendorprofile
            $pastCredAmt = $entryData['v_credits_amount'];
            $return = updateNumericbyand($dbcon,"-$pastCredAmt","vendorprofile","vendor_credit_bal","vendorid",$entryData['v_credits_vendorid']);
            if($return['status']){
                $sql = "DELETE FROM vendorcredits WHERE v_credits_id='".$_GET['id']."' ";

                if ($dbcon->query($sql) === TRUE) {
                    header("Location: listVendorCredits.php");
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