
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

try{
    $return=array();

    $dbcon->begin_transaction();

if (isset($_POST['conv_amt'])) {

    $conv_amt=$_POST['conv_amt'];
    $conv_remarks=$_POST['conv_remarks'];
    $handler=$_POST['handler'];
    $compId=$_POST['compId'];
    $action=$_POST['action'];
    $table=$_POST['table'];

    if ($action ===  'add') {
        $conv_id = get_id($dbcon,$table,"CONV00");

        if($action=="add"){
            $sql2 = "INSERT INTO petty_cas_conv (conv_id) VALUES ('$conv_id')";
            if (mysqli_query($dbcon,$sql2)) {
                $array['conv_amt'] = $conv_amt;
                $array['conv_remarks'] = $conv_remarks;
                $array['handler'] = $handler;
                $array['conv_orgid'] = $compId;

                $return = update_query($dbcon,json_encode($array),$conv_id,$table,"conv_id");
                if($return['status']){
                     //update cash_on_hand

                     $return = updateNumericbyand($dbcon,"-$conv_amt","comprofile","cash_on_hand","orgid",$compId);
                     if($return['status']){
                        //update petty cash
                        $return = updateNumericbyand($dbcon,"+$conv_amt","comprofile","petty_cash_bal","orgid",$compId);
                        $return['data'] =  findbyand($dbcon,$compId,"comprofile","orgid")['values'][0];

                        if(!$return['status']){
                          throw new Exception();
                        }
                   }else{
                       throw new Exception();
                   }

                }else{
                    throw new Exception();
                }
            }else{
                throw new Exception();
            }
        }
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
