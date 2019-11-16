
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $transid=$_POST['transid'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $return=array();
    
    if ($transid=="") {
  
        $transid = get_id($dbcon,$table,"TRANSC-0");
    }

    if($action=="add"){
        $sql2 = "INSERT INTO bankdeposit (transid) VALUES ('$transid')";

        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$transid,$table,"transid");
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
