<?php
/**
 * Created by PhpStorm.
 * User: Ehtesham Mehmood
 * Date: 11/21/2014
 * Time: 1:13 AM
 */

$dbcon=mysqli_connect("localhost","root","");

mysqli_select_db($dbcon,"lentochanges");

//$dbcon=mysqli_connect("localhost","daplDev","daplDev");
//mysqli_select_db($dbcon,"daplDev");
mysqli_autocommit($dbcon,FALSE);



?>