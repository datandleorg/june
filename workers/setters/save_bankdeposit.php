
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $transid=$_POST['transid'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $handler=$_POST['handler'];
    $compId=$_POST['compId'];
    $return=array();
    
    if ($transid=="") {
        $transid = get_id($dbcon,$table,"TRANSC-0");
    }

    if($action=="add"){
        $sql2 = "INSERT INTO bankdeposit (transid) VALUES ('$transid')";

        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$transid,$table,"transid");

            if ($return['status']){
               $entry['data'] = json_decode($array,true);
               $entry['rowId'] = $transid;
               $entry['colName'] = "transid";
               $entry['entity'] = "Bank Deposit";

                $transData = array();
                $transData['trans_type'] = "credit";
                $transData['trans_amt'] = $entry['data']['amount'];
                $transData['trans_bank'] = $entry['data']['bankname'];
                $transData['trans_entry'] = json_encode($entry);
                $transData['trans_status'] = "Completed";
                $transData['trans_handler'] = $handler;
                $transData['trans_mode'] = $entry['data']['payment_mode'];
                
                $return = handleTransaction($dbcon,$compId,$entry,'',$transData);
                
            }else{
                $return['status']=false;
                $return['error']=mysqli_error($dbcon);
            }
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{
        $return = update_query($dbcon,$array,$transid,$table,"transid");
    }

}
echo json_encode($return);


?>
