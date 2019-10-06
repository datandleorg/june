<?php
include("database/db_conection.php");//make connection here
    // sql to delete a record
	
    $sql = "DELETE FROM rawitemaster WHERE rw_code='".$_GET['id']."' ";

    if ($dbcon->query($sql) === TRUE) {
       header("Location: listProductRawItems.php");
    } else {
        echo "Error deleting record: " . $dbcon->error;
    }
    $dbcon->close();
?>