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

    
    $entryData = findbyand($dbcon,$bdid,'expenses','expense_no')['values'][0];
    $pastTran = findLastTrans($dbcon,$bdid,'transactions','trans_row_id');
    if(!$pastTran['status']){
        throw new Exception();  
    }else{
        $pastData = $pastTran['values'][0];
        $entryData['payment_mode'] = $entryData['expense_paid_thru'];
        $entryData['trans_bank'] = $entryData['expense_paid_thru']!=="Cash" ?  $entryData['expense_bank'] : "";
    
        $entryData['payment_status'] = $entryData['expense_paid_thru']==="Cheque"?$entryData['expense_cheque_status ']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
        $rowId = $bdid;
        $entity = 'expenses';
    
        $entryData['amount'] = $pastData['trans_amt'];
        $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$session_org,$session_user,"reverse");
    
        if(!$return['status']){
            throw new Exception();
        }else{
    
            echo $entryData['expense_file_src']."--";
            if($entryData['expense_file_src']!=""){
                if (!unlink($entryData['expense_file_src'])) {
           
                    $sql = "DELETE FROM recordexpense WHERE id='".$_GET['id']."' ";
        
                    if ($dbcon->query($sql) === TRUE) {
                    header("Location: listExpenses.php");
                    } else {
                        echo "Error deleting record: " . $dbcon->error;
                    }
                }else{
                    throw new Exception();
    
                }
            }else{
                $sql = "DELETE FROM recordexpense WHERE id='".$_GET['id']."' ";
        
                if ($dbcon->query($sql) === TRUE) {
                header("Location: listExpenses.php");
                } else {
                    echo "Error deleting record: " . $dbcon->error;
                }
            }
     
               
        }
    }



    $dbcon->commit();

}catch(Exception $e){
    $dbcon->rollback();
    echo "Error deleting record <a href='listExpenses.php'>Back</a>";


}finally{
    $dbcon->close();

}

?>

