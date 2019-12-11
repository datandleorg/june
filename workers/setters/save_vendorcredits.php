
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $v_credits_id=$_POST['v_credits_id'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $handler=$_POST['handler'];
    $compId=$_POST['compId'];
    $return=array();
    
    if ($v_credits_id=="") {
        $v_credits_id = get_id($dbcon,$table,"CN00");
    }

    if($action=="add"){
        $sql2 = "INSERT INTO vendorcredits (v_credits_id) VALUES ('$v_credits_id')";

        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$v_credits_id,$table,"v_credits_id");
         
            
            // correct verson
            if ($return['status']){
                $entry['data'] = json_decode($array,true);
                $entry['rowId'] = $v_credits_id;
                $entry['colName'] = "v_credits_id";
                $entry['entity'] = "Vendor Credits";
    
                    $transData = array();
                    $transData['trans_type'] = "debit";
                    $transData['trans_amt'] = $entry['data']['v_credits_amount'];
                    $transData['trans_bank'] = $entry['data']['v_credits_paymentmode']!=="Cash" ? $entry['data']['v_credits_bank'] : "";
                    $transData['trans_entry'] = json_encode($entry);
                    $transData['trans_status'] = $entry['data']['v_credits_paymentmode']!=="Cheque" ? "Completed" : $entry['data']['v_credits_cheque_status'];
                    $transData['trans_handler'] = $handler;
                    $transData['trans_mode'] = $entry['data']['v_credits_paymentmode'];
                    
                    if($transData['trans_status']==="Completed" || $transData['trans_status']==="Cleared"){
                        $return = handleTransaction($dbcon,$compId,$entry,'',$transData);
                    }
                
            }else{
                $return['status']=false;
                $return['error']=mysqli_error($dbcon);
            }

                
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{
        $return = update_query($dbcon,$array,$v_credits_id,$table,"v_credits_id");

        // correct verson
        if ($return['status']){
            $entry['data'] = json_decode($array,true);
            $entry['rowId'] = $v_credits_id;
            $entry['colName'] = "v_credits_id";
            $entry['entity'] = "Vendor Credits";

                $transData = array();
                $transData['trans_type'] = "debit";
                $transData['trans_amt'] = $entry['data']['v_credits_amount'];
                $transData['trans_bank'] = $entry['data']['v_credits_paymentmode']!=="Cash" ? $entry['data']['v_credits_bank'] : "";
                $transData['trans_entry'] = json_encode($entry);
                $transData['trans_status'] = $entry['data']['v_credits_paymentmode']!=="Cheque" ? "Completed" : $entry['data']['v_credits_cheque_status'];
                $transData['trans_handler'] = $handler;
                $transData['trans_mode'] = $entry['data']['v_credits_paymentmode'];

                if($transData['trans_status']==="Completed" || $transData['trans_status']==="Cleared"){
                    $return = handleTransaction($dbcon,$compId,$entry,'',$transData);
                }
            
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }


echo json_encode($return);

}
?>
