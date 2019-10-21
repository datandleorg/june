<?php

if(isset($_POST['expense_no'])){
   $expense_no = $_POST['expense_no'];
}
$return = array();

$target_dir = "C:/xampp/htdocs/git/june/upload/";
$uploadOk = 1;
$status= "";
$imageFileType = strtolower(pathinfo($_FILES["expense_file_src"]["name"],PATHINFO_EXTENSION));
$target_file = $target_dir.$expense_no.".".$imageFileType;

// Check if image file is a actual image or fake image
    $check = getimagesize($_FILES["expense_file_src"]["tmp_name"]);
    
    if($check !== false) {
        $status= "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        $return['error'] = "File is not an image.";
        $return['status'] = false;
        $uploadOk = 0;
    }

    if (file_exists($target_file)) {
        $return['error'] = "Sorry, file already exists.";
        $return['status'] = false;

        $uploadOk = 0;
    }

        // Check file size
    if ($_FILES["expense_file_src"]["size"] > 500000) {
        $return['error'] =  "Sorry, your file is too large.";
        $return['status'] = false;
        $uploadOk = 0;
    }

    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
        $return['status'] = false;
        $return['error'] = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

        // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $status =  "Sorry, your file was not uploaded.";
    // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["expense_file_src"]["tmp_name"], $target_file)) {
            $return['status'] = true;
            $status =  "The file ". basename( $_FILES["expense_file_src"]["name"]). " has been uploaded.";
        } else {
            $return['status'] = false;
            $return['error'] = "Sorry, there was an error uploading your file.";
        }
    }
    



    echo json_encode($return);
?>