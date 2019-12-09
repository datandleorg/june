
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $customer_credits_id=$_POST['customer_credits_id'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $return=array();
    
    if ($customer_credits_id=="") {
        $customer_credits_id = get_id($dbcon,$table,"CUSTCR00");
    }

    if($action=="add"){
        $sql2 = "INSERT INTO customercredits (customer_credits_id) VALUES ('$customer_credits_id')";

        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$customer_credits_id,$table,"customer_credits_id");
            if($return['status']){
                
            }else{
                $return['status']=false;
            }
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{
        $return = update_query($dbcon,$array,$customer_credits_id,$table,"customer_credits_id");
    }


echo json_encode($return);

}
?>
