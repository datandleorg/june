<?php
include("database/db_conection.php");//make connection here
include("workers/getters/functions.php");//make connection here
   
$pe_code = $_GET['id'];
$past = findbyand($dbcon,$pe_code,"partnerentries","pe_code");
$val_arr = $past['values'][0];
$obj2 = json_decode($val_arr['pe_items'], true);
for($i=0;$i<count($obj2);$i++){
   echo $sql = " UPDATE purchaseitemaster  SET stockinqty =  stockinqty - ".$obj2[$i]['qty']."  WHERE itemcode='".$obj2[$i]['item']."' ";
    if (mysqli_query($dbcon,$sql)) {
        continue;
    }else{
        break;
    }
}	

    $sql = "DELETE FROM partnerentries WHERE pe_code='".$pe_code."' ";

    if ($dbcon->query($sql) === TRUE) {
      header("Location: listPartnerPurchaseEntries.php");
    } else {
       echo "Error deleting record: " . $dbcon->error;
    }
    $dbcon->close();
?>