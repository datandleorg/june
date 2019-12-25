
<?php
include('../../database/db_conection.php');
include('../getters/functions.php');

try{

    $dbcon->begin_transaction();
    
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
         
            
            if ($return['status']){

                $entryData = json_decode($array,true);
                $entryData['payment_mode'] = $entryData['v_credits_paymentmode'];
                $entryData['amount'] = $entryData['v_credits_amount'];
                $entryData['trans_bank'] = $entryData['payment_mode']!=="Cash" ? $entryData['v_credits_bank'] : "";
                $entryData['payment_status'] = $entryData['v_credits_paymentmode']==="Cheque"?$entryData['v_credits_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
                $rowId = $v_credits_id;
                $entity = $table;
                if($entryData['payment_status']==="Completed"){
                    $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");

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
            throw new Exception();
        }
    }else{
        $return = update_query($dbcon,$array,$v_credits_id,$table,"v_credits_id");

        if ($return['status']){

            $entryData = json_decode($array,true);

            $entryDataNew = json_decode($array,true);
            $entryData = json_decode($array,true);
            $entryData['payment_mode'] = $entryData['v_credits_paymentmode'];
            $entryData['amount'] = $entryData['v_credits_amount'];
            $entryData['trans_bank'] = $entryData['payment_mode']!=="Cash" ?  $entryData['v_credits_bank']:"";
            $entryData['payment_status'] = $entryData['v_credits_paymentmode']==="Cheque"?$entryData['v_credits_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
            $rowId = $v_credits_id;
            $entity = $table;

            if($entryData['payment_mode'] === "Cheque" && $entryData['payment_status']==="Completed"){
                $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");
           
            }else if($entryData['payment_status']==="Completed"){
                $pastTran = findLastTrans($dbcon,$v_credits_id,'transactions','trans_row_id');
                $pastData = $pastTran['values'][0];
                $entryData['amount'] = $pastData['trans_amt'];
                $entryData['trans_bank'] = $entryData['payment_mode']!=="Cash" ? $entryData['v_credits_bank']:"";
                $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"reverse");
                if($return['status']){
                    $entryData['amount'] = $entryDataNew['v_credits_amount'];

                    $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");

                    if(!$return['status']){
                        throw new Exception();
                    }
                }else{
                    throw new Exception();

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
    }

}


// Commit transaction
$dbcon->commit();


}catch(Exception $e){
// Rollback transaction
 $dbcon->rollback();

}finally{
// Close connection
 $dbcon->close();
 echo json_encode($return);
}


?>
