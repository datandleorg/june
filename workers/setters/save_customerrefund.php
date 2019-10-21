
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $customer_refund_id=$_POST['customer_refund_id'];
    $customer_credits_id=$_POST['customer_credits_id'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $return=array();

    if ($customer_refund_id=="") {
        $customer_refund_id = get_id($dbcon,$table,"CUSTCNREF00");
    }



    if($action=="add"){
        $sql2 = "INSERT INTO customer_refund (customer_refund_id) VALUES ('$customer_refund_id')";

        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$customer_refund_id,$table,"customer_refund_id");
            $now = findbyand($dbcon,$customer_refund_id,"customer_refund","customer_refund_id");
            $now_refund_amount = $now['values'][0]['customer_refund_amount'];
            $sql4 = " UPDATE customercredits SET customer_credits_availcredits =  customer_credits_availcredits - ".$now_refund_amount."  WHERE customer_credits_id='".$customer_credits_id."' ;";

            if (mysqli_query($dbcon,$sql4)) {
                $return['status']=true;
            }else{
                $return['status']=false;
                $return['error']=mysqli_error($dbcon);
            }
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{
        $return = update_query($dbcon,$array,$customer_refund_id,$table,"customer_refund_id");
    }


    echo json_encode($return);

}
?>
