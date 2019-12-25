
<?php
include('../../database/db_conection.php');
mysqli_autocommit($dbcon,FALSE);

include('../getters/functions.php');

try{

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
                    $transData['trans_row_id'] = $v_credits_id;
                    $transData['trans_type'] = "debit";
                    $transData['trans_entry_type'] = "normal";
                    $transData['trans_entry_ref'] = "";
                    $transData['trans_amt'] = $entry['data']['v_credits_amount'];
                    $transData['trans_bank'] = $entry['data']['v_credits_paymentmode']!=="Cash" ? $entry['data']['v_credits_bank'] : "";
                    $transData['trans_entry'] = json_encode($entry);
                    $transData['trans_status'] = $entry['data']['v_credits_paymentmode']!=="Cheque" ? "Completed" : $entry['data']['v_credits_cheque_status'];
                    $transData['trans_handler'] = $handler;
                    $transData['trans_mode'] = $entry['data']['v_credits_paymentmode'];
                    
                    if($transData['trans_status']==="Completed" || $transData['trans_status']==="Cleared"){
                        $transData['trans_status']="Completed";
                        $return = handleTransaction($dbcon,$compId,$entry,'',$transData,'normal');
                        if(!$return['status']){
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
        $return = update_query($dbcon,$array,$v_credits_id,$table,"v_credits_id");

        // correct verson
        if ($return['status']){
            $entry['data'] = json_decode($array,true);
            $entry['entity'] = "Vendor Credits";

            $entry['data']['v_credits_paymentmode'];
            if( $entry['data']['v_credits_paymentmode']==="Cheque" && $entry['data']['v_credits_cheque_status']=="Cleared"){

                $transData = array();
                $transData['trans_row_id'] = $v_credits_id;
                $transData['trans_type'] = "debit";
                $transData['trans_entry_type'] = "normal";
                $transData['trans_entry_ref'] = "";
                $transData['trans_amt'] = $entry['data']['v_credits_amount'];
                $transData['trans_bank'] = $entry['data']['v_credits_paymentmode']!=="Cash" ? $entry['data']['v_credits_bank'] : "";
                $transData['trans_entry'] = json_encode($entry);
                $transData['trans_status'] = "Completed";
                $transData['trans_handler'] = $handler;
                $transData['trans_mode'] = $entry['data']['v_credits_paymentmode'];
                
                $return = handleTransaction($dbcon,$compId,$entry,'',$transData);

                if(!$return['status']){
                    throw new Exception();
                }

            }else{ 
                // reversing transactions
                $pastTran = findLastTrans($dbcon,$v_credits_id,'transactions','trans_row_id');
                $pastData = $pastTran['values'][0];
                $transid = $pastData['trans_id'];

                $transData['trans_row_id'] = $v_credits_id;
                $transData['trans_type'] = $pastData['trans_type'] === "debit" ? "credit": "debit";
                $transData['trans_entry_type'] = "reverted";
                $transData['trans_entry_ref'] = $transid;
                $transData['trans_amt'] = $pastData['trans_amt'];
                $transData['trans_bank'] = $pastData['trans_mode']!=="Cash" ? $pastData['trans_bank'] : "";
                $transData['trans_entry'] = json_encode($pastData['trans_entry']);
                $transData['trans_status'] =  "Completed" ;
                $transData['trans_handler'] = $handler;
                $transData['trans_mode'] = $pastData['trans_mode'];

                $return = handleTransaction($dbcon,$compId,$entry,'',$transData);      
                
                if($return['status']){
                    $transData = array();
                    $transData['trans_row_id'] = $v_credits_id;
                    $transData['trans_type'] = "debit";
                    $transData['trans_entry_type'] = "normal";
                    $transData['trans_entry_ref'] = "";
                    $transData['trans_amt'] = $entry['data']['v_credits_amount'];
                    $transData['trans_bank'] = $entry['data']['v_credits_paymentmode']!=="Cash" ? $entry['data']['v_credits_bank'] : "";
                    $transData['trans_entry'] = json_encode($entry);
                    $transData['trans_status'] = $entry['data']['v_credits_paymentmode']!=="Cheque" ? "Completed" : $entry['data']['v_credits_cheque_status'];
                    $transData['trans_handler'] = $handler;
                    $transData['trans_mode'] = $entry['data']['v_credits_paymentmode'];
                    
                    $return = handleTransaction($dbcon,$compId,$entry,'',$transData);

                    if(!$return['status']){
                        throw new Exception();
                    }

                }else{
                    throw new Exception();                
                }
            }
            
        }else{
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
