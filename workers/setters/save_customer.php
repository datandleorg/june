
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $custid=$_POST['custid'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $return=array();
    
    if ($custid=="") {
  
        $custid = get_id($dbcon,$table,"CUST00");
    }
    

    if($action=="add"){
        $sql2 = "INSERT INTO customerprofile (custid) VALUES ('$custid')";

        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$custid,$table,"custid");
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{
        $return = update_query($dbcon,$array,$custid,$table,"custid");
    }

}

echo json_encode($return);


?>
