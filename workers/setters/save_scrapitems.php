
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $scrap_itemcode=$_POST['scrap_itemcode'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $scrap_orgid=$_POST['scrap_orgid'];
    $compname=$_POST['compname'];

    $return=array();
    

    $prefix = $compname!='' ?  strtoupper(substr($compname, 0, 3)):'';

    if ($scrap_itemcode=="") {
      $scrap_itemcode = get_id($dbcon,$table,$prefix."SCRAP-00");
    }
    

    if($action=="add"){
        $sql2 = "INSERT INTO scrapinventory (scrap_itemcode) VALUES ('$scrap_itemcode')";
        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$scrap_itemcode,$table,"scrap_itemcode");

        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{

        $return = update_query($dbcon,$array,$scrap_itemcode,$table,"scrap_itemcode");
    }

}
echo json_encode($return);


?>
