
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

try{

   $dbcon->begin_transaction();

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

                $entryData = json_decode($array,true);
                $entryData['payment_mode'] = $entryData['paymethod'];
                $entryData['trans_bank'] = $entryData['bankname'];
                $entryData['payment_status'] = $entryData['paymethod']==="Cheque"?$entryData['pay_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
                $rowId = $transid;
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
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
            throw new Exception();
        }
    }else{
        $return = update_query($dbcon,$array,$transid,$table,"transid");
       // print_r($return);
        if ($return['status']){

            $entryData = json_decode($array,true);
            $pastTran = findLastTrans($dbcon,$transid,'transactions','trans_row_id');
            $pastData = $pastTran['values'][0];


            $entryDataNew = json_decode($array,true);
            $entryData = json_decode($array,true);
            $entryData['payment_mode'] = $entryData['paymethod'];
            $entryData['trans_bank'] = $entryData['bankname'];
            $entryData['payment_status'] = $entryData['paymethod']==="Cheque"?$entryData['pay_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
            $rowId = $transid;
            $entity = $table;

            if($entryData['payment_mode'] === "Cheque" && $entryData['payment_status']==="Completed"){
                $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");
           
            }else if($entryData['payment_status']==="Completed"){
                $entryData['amount'] = $pastData['trans_amt'];
                $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"reverse");
                if($return['status']){
                    $entryData['amount'] = $entryDataNew['amount'];

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


        if(!$return['status']){
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
