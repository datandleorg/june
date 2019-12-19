
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

try{

    mysqli_autocommit($dbcon,FALSE);

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
                    $transData['trans_row_id'] = $transid;
                    $transData['trans_type'] = "credit";
                    $transData['trans_entry_type'] = "normal";
                    $transData['trans_entry_ref'] = "";
                    $transData['trans_amt'] = $entry['data']['amount'];
                    $transData['trans_bank'] = $entry['data']['bankname'];
                    $transData['trans_entry'] = json_encode($entry);
                    $transData['trans_status'] = $entry['data']['paymethod']!=="Cheque" ? "Completed" : $entry['data']['pay_status'];
                    $transData['trans_handler'] = $handler;
                    $transData['trans_mode'] = $entry['data']['paymethod'];
                    $transData['trans_entity'] = "Bank Deposit";
                    $effectOn = "Bank Transfer";
                    
                    if($transData['trans_status']==="Completed" || $transData['trans_status']==="Cleared"){
                        $transData['trans_status']="Completed";
                        $return = handleTransaction($dbcon,$compId,$entry,'',$transData,$effectOn);
                        if(!$return['status']){
                            throw new Exception();
                        }
                    }
                
            }else{
                $return['status']=false;
                $return['error']=mysqli_error($dbcon);
                throw new Exception();
            }
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
            throw new Exception();
        }
    }else{
        $return = update_query($dbcon,$array,$transid,$table,"transid");

        if ($return['status']){
            $entry['data'] = json_decode($array,true);
            $entry['rowId'] = $transid;
            $entry['colName'] = "transid";
            $entry['entity'] = "Bank Deposit";

            // if($entry['data']['pay_status'] == "Cheque" && ){

            // }
                $transData = array();
                $transData['trans_row_id'] = $transid;
                $transData['trans_type'] = "credit";
                $transData['trans_entry_type'] = "normal";
                $transData['trans_entry_ref'] = "";
                $transData['trans_amt'] = $entry['data']['amount'];
                $transData['trans_bank'] = $entry['data']['bankname'];
                $transData['trans_entry'] = json_encode($entry);
                $transData['trans_status'] = $entry['data']['paymethod']!=="Cheque" ? "Completed" : $entry['data']['pay_status'];
                $transData['trans_handler'] = $handler;
                $transData['trans_mode'] = $entry['data']['paymethod'];
                $transData['trans_entity'] = "Bank Deposit";
                $effectOn = "Bank Transfer";
                
                if($transData['trans_status']==="Completed" || $transData['trans_status']==="Cleared"){
                    $transData['trans_status']="Completed";
                    $return = handleTransaction($dbcon,$compId,$entry,'',$transData,$effectOn);
                    if(!$return['status']){
                        throw new Exception();
                    }
                }
            
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
            throw new Exception();
        }

    }

}


// Commit transaction
mysqli_commit($dbcon);

}catch(Throwable $e){
// Rollback transaction
mysqli_rollback($dbcon);
}finally{
// Close connection
mysqli_close($dbcon);
echo json_encode($return);
}

?>
