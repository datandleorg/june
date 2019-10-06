<?php
include("database/db_conection.php");//make connection here

if(isset($_POST['itemname']))
//if(!empty($_POST))
{
	//$prefix = "DAPL/";
	//$postfix = "/";
	
    $itemname=$_POST['itemname'];//same
    $description=$_POST['description'];//same
	
	
	$check_itemname_query="select itemname from itemaster WHERE itemname='$itemname'";
    $run_query=mysqli_query($dbcon,$check_itemname_query);
	if(mysqli_num_rows($run_query)>0)
    {
		echo '0';
        echo "<script>alert('$itemname is already exist in our database, Please try another one!')</script>";
        //$fmsg= "Email already exists";
        exit();
    }
    else{	
	$insert_itemname="INSERT INTO itemaster(`itemname`,`description`) 
	VALUES ('$itemname','$description')";													    

	
	//echo "$insert_hsncodes";
	
	
//	if(mysqli_query($dbcon,$insert_hsncodes))
 //{
    // header("location:listPurchaseItemMaster.php");
	//	echo "$insert_hsncodes";
 //}   //else {
   //  die('Error: ' . mysqli_error($dbcon));
     //echo "<script>alert('HSN CODE creation unsuccessful ')</script>";
// }
//}
	
	
if(mysqli_query($dbcon,$insert_itemname))
	{
		echo 	$itemname;
		//echo "<script>alert('User Group creation Successful ')</script>";
		//header("location:addUsers.php");
   } else {
		echo '0';
		exit; //echo "<script>alert('User creation unsuccessful ')</script>";
	}
	
}
}
?>