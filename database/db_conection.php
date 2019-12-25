<?php
/**
 * Created by PhpStorm.
 * User: Ehtesham Mehmood
 * Date: 11/21/2014
 * Time: 1:13 AM
 */

// $dbcon=mysqli_connect("localhost","root","");

// mysqli_select_db($dbcon,"lentochanges");

//$dbcon=mysqli_connect("localhost","daplDev","daplDev");
//mysqli_select_db($dbcon,"daplDev");


$dbcon = mysqli_connect("localhost", "root", "", "lentochanges");
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

?>