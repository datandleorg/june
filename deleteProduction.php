<?php
include("database/db_conection.php");//make connection here
include('workers/getters/functions.php');
  
// sql to delete a record
$prod_code = $_GET['id'];
$past = findbyand($dbcon,$prod_code,"productionlist","prod_code");
$val_arr = $past['values'];
$obj2 = json_decode($val_arr[0]['prod_raw_items'], true);
for($i=0;$i<count($obj2);$i++){
    $sql = " UPDATE purchaseitemaster  SET stockinqty =  stockinqty + ".$obj2[$i]['qty']."  WHERE itemcode='".$obj2[$i]['item']."' ";
    if (mysqli_query($dbcon,$sql)) {
        continue;
    }else{
        break;
    }
}

    $sql = "DELETE FROM productionlist WHERE prod_code='".$prod_code."' ";

    if ($dbcon->query($sql) === TRUE) {
       header("Location: listProductions.php");
    } else {
        echo "Error deleting record: " . $dbcon->error;
    }
    $dbcon->close();
?>