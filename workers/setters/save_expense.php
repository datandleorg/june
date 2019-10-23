
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

function uploadBill($file,$expense_no){



    $file_return=array();
    $dir = "C:/xampp/htdocs/git/june/";
    $folder = "upload/";
    $target_dir = $dir.$folder;
    $uploadOk = 1;
    $status= "";
    $imageFileType = strtolower(pathinfo($file["name"],PATHINFO_EXTENSION));
    $target_file = $target_dir.$expense_no.".".$imageFileType;
    $loc_of_file = $folder.$expense_no.".".$imageFileType;


    // Check if image file is a actual image or fake image
    $check = getimagesize($file["tmp_name"]);
    
    if($check !== false) {
        $status= "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        $file_return['error'] = "File is not an image.";
        $file_return['status'] = false;
        $uploadOk = 0;
    }

    if (file_exists($target_file)) {

       $path = $_SERVER['DOCUMENT_ROOT'].'upload/';
        //unlink($path);
    }

    // Check file size
    // if ($file["size"] > 500000) {
    //     $file_return['error'] =  "Sorry, your file is too large.";
    //     $file_return['status'] = false;
    //     $uploadOk = 0;
    // }

    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
        $file_return['status'] = false;
        $file_return['error'] = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $file_return['status'] = false;
        $status =  "Sorry, your file was not uploaded.";
    // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($file["tmp_name"], $target_file)) {
            $file_return['status'] = true;
            $file_return['src'] = $loc_of_file;
            $status =  "The file ". basename( $file["name"]). " has been uploaded.";
        } else {
            $file_return['status'] = false;
            $file_return['error'] = "Sorry, there was an error uploading your file.";
        }
    }

    return $file_return;

}

if (isset($_POST['expense_payee'])) {
    $array=$_POST;
    $expense_no=$_POST['expense_no'];
    $action=$_POST['action'];
    $table=$_POST['table'];


    $bill =  $_FILES['expense_file_src'];
    
    $return=array();
    $new_array=array();
    $array = $_POST;

    $keys = array_keys($array);

    foreach($keys as $value){
        if($value=="expense_no" || $value=="action" || $value=="table"){
        }else{
            $new_array[$value] = $array[$value];
        }
    }

    $new_array = json_encode($new_array);

    
    if ($expense_no=="") {
        $expense_no = get_id($dbcon,$table,"0");
    }
    

    if($action=="add"){
        $sql2 = "INSERT INTO expenses (expense_no) VALUES ('$expense_no')";

        if (mysqli_query($dbcon,$sql2)) {

            if($bill!=""){
               $file_status = uploadBill($bill,$expense_no);
               if($file_status['status']){
                  $new_array = json_decode($new_array);
                  $new_array->expense_file_src = $file_status['src'];
                  $new_array = json_encode($new_array);
               }
            }

            $return = update_query($dbcon,$new_array,$expense_no,$table,"expense_no");
            $return["code"] = $expense_no;
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{

        if($bill!=""){
            $file_status = uploadBill($bill,$expense_no);
            if($file_status['status']){
               $new_array = json_decode($new_array);
               $new_array->expense_file_src = $file_status['src'];
               $new_array = json_encode($new_array);
            }
         }

        $return = update_query($dbcon,$new_array,$expense_no,$table,"expense_no");
        $return["code"] = $expense_no;
    }

}
echo json_encode($return);


?>
