<?php
include("database/db_conection.php");//make connection here
    // sql to delete a record
	
    $sql = "DELETE FROM scrapinventory WHERE scrap_itemcode='".$_GET['id']."' ";

    if ($dbcon->query($sql) === TRUE) {
       header("Location: listScrapItemMaster.php");
    } else {
        echo "Error deleting record: " . $dbcon->error;
    }
    $dbcon->close();
?>