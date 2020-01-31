
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

try{

    $dbcon->begin_transaction();

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $payment_id=$_POST['payment_id'];
    $payment_grn_id=$_POST['payment_grn_id'];
    $payment_amount=$_POST['payment_amount'];
    $page_payment_v_credits_id=$_POST['page_payment_v_credits_id'];
    $handler=$_POST['handler'];
    $compId=$_POST['compId'];

    $action=$_POST['action'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $return=array();

    if ($payment_id=="") {

        $payment_id = get_id($dbcon,$table,"VP00");
    }


    if($action=="add"){
     $sql2 = "INSERT INTO payments (payment_id) VALUES ('$payment_id')";
        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$payment_id,$table,"payment_id");
            if($return['status']){
                $grn_val_arr = findbyand($dbcon,$payment_grn_id,"grn_notes","grn_id");
                $balance = $grn_val_arr['values'][0]['grn_balance']-$payment_amount;
                $return = updatebyand($dbcon,$balance,"grn_notes","grn_balance","grn_id",$payment_grn_id);

                // if($return['status']){
                //     $return = update_open_balance($dbcon,'payables');

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

                        
                        if($page_payment_v_credits_id!=""){
                            $now = findbyand($dbcon,$payment_id,"payments","payment_id");
                            $now_refund_amount = $now['values'][0]['payment_credits_used'];
                            $sql90 = " UPDATE vendorcredits SET v_credits_availcredits =  v_credits_availcredits - ".$now_refund_amount."  WHERE v_credits_id='".$page_payment_v_credits_id."' ;";

                            if (mysqli_query($dbcon,$sql90)) {
                                $return['status']=true;
                            }else{
                                $return['status']=false;
                                $return['error']=mysqli_error($dbcon);
                                throw new Exception();
                            }
                        }

                        if($return['status']){
                            $entryData = json_decode($array,true);
                            $entryData['amount'] = $page_payment_v_credits_id!="" ? $entryData['payment_amount']-$entryData['payment_credits_used'] :$entryData['payment_amount'];
                            $entryData['trans_bank'] = $entryData['payment_mode']!=="Cash" ? $entryData['payment_bank'] : "";
                            $entryData['payment_status'] = $entryData['payment_mode']==="Cheque"?$entryData['payment_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
                            $rowId = $payment_id;
                            $entity = $table;
                            if($entryData['payment_status']==="Completed"){
                                $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");
             
                                if(!$return['status']){
                                    throw new Exception();
                                }
                            }
                        }
                        
                    }else{
                        throw new Exception();
                    }
                // }else{
                //     throw new Exception();
                // }

            }else{
                throw new Exception();
            }




        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
            throw new Exception();
        }
    }else{
        $return = update_query($dbcon,$array,$payment_id,$table,"payment_id");
    }

}

// Commit transaction
$dbcon->commit();


}catch(Exception $e){
// Rollback transaction
 "rollback";
 $dbcon->rollback();

}finally{
// Close connection
 $dbcon->close();
 echo json_encode($return);
}

?>
