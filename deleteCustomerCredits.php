<?php
include("database/db_conection.php");//make connection here
include('workers/getters/functions.php');

    $customer_credits_id = $_GET['id'];
    // reversing transactions
    $entry = findbyand($dbcon,$customer_credits_id,'customercredits','customer_credits_id')['values'][0];

    $pastTran = findLastTrans($dbcon,$customer_credits_id,'transactions','trans_row_id');
    $pastData = $pastTran['values'][0];
    $transid = $pastData['trans_id'];

    $transData['trans_row_id'] = $customer_credits_id;
    $transData['trans_type'] = $pastData['trans_type'] === "debit" ? "credit": "debit";
    $transData['trans_entry_type'] = "reverted";
    $transData['trans_entry_ref'] = $transid;
    $transData['trans_amt'] = $pastData['trans_amt'];
    $transData['trans_bank'] = $pastData['trans_mode']!=="Cash" ? $pastData['trans_bank'] : "";
    $transData['trans_entry'] = json_encode($pastData['trans_entry']);
    $transData['trans_status'] =  "Completed" ;
    $transData['trans_handler'] = $handler;
    $transData['trans_mode'] = $pastData['trans_mode'];

    $return = handleTransaction($dbcon,$entry['customer_credits_compId'],$entry,'',$transData);     

    if($return['status']){
        $sql = "DELETE FROM customercredits WHERE customer_credits_id='".$_GET['id']."' ";

        if ($dbcon->query($sql) === TRUE) {
        header("Location: listCustomerCredits.php");
        } else {
            echo "Error deleting record: " . $dbcon->error;
        }
   }else{
    echo "Error deleting record";

   }

    $dbcon->close();
?>