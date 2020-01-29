
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');


try{

    $dbcon->begin_transaction();

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

if (isset($_POST['expense_items'])) {
    $array=$_POST;
    $expense_no=$_POST['expense_no'];
    $compId=$_POST['expense_compId'];
    $action=$_POST['action'];
    $table=$_POST['table'];


    $bill =  isset($_FILES['expense_file_src']) ? $_FILES['expense_file_src'] : "";
    
    $return=array();
    $new_array=array();
    $array = $_POST;

    $keys = array_keys($array);

    foreach($keys as $value){
        if($value=="expense_no" || $value=="action" || $value=="table" || $value=="expense_compId"){
        }else{
            $new_array[$value] = $array[$value];
        }
    }

    $new_array = json_encode($new_array);

    
    if ($expense_no=="") {
        $expense_no = get_id($dbcon,$table,"EXP0");
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


            if($return['status']){


                $entryData = json_decode($new_array,true);
               // print_r($entryData);
                $entryData['payment_mode'] = $entryData['expense_paid_thru'];
                $entryData['amount'] = $entryData['expense_total_amount'];
                $entryData['trans_bank'] = $entryData['expense_paid_thru']!=="Cash" ? $entryData['expense_bank'] : "";
                $entryData['payment_status'] = $entryData['expense_paid_thru']==="Cheque"?$entryData['expense_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
                $rowId = $expense_no;
                $entity = $table;
                $handler = $entryData['expense_handler'];
                if($entryData['payment_status']==="Completed"){
                    $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");

                    if(!$return['status']){
                        throw new Exception();
                    }
                }

          
            }else{
                $return['status']=false;
                $return['error']=mysqli_error($dbcon);
                throw new Exception();

            }
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
            throw new Exception();
        }
    }else{

        if($bill!=""){
            $file = findbyand($dbcon,$expense_no,"expenses","expense_no")['values'][0]['expense_file_src'];
            if($file!==""){
                if (!unlink("../../".$file)) {
                    echo ("Error deleting $file");
                  } else {
                    $file_status = uploadBill($bill,$expense_no);
                    if($file_status['status']){
                        $new_array = json_decode($new_array);
                        $new_array->expense_file_src = $file_status['src'];
                        $new_array = json_encode($new_array);
                    }
                  }
            }
  
           
         }

        $return = update_query($dbcon,$new_array,$expense_no,$table,"expense_no");
        $return["code"] = $expense_no;

        if($return['status']){


            $entryDataNew = json_decode($new_array,true);
            $entryData = json_decode($new_array,true);
            $entryData['payment_mode'] = $entryData['expense_paid_thru'];
            $entryData['amount'] = $entryData['expense_total_amount'];
            $entryData['trans_bank'] = $entryData['expense_paid_thru']!=="Cash" ?  $entryData['expense_bank']:"";
            $entryData['payment_status'] = $entryData['expense_paid_thru']==="Cheque"?$entryData['expense_cheque_status']==="Cleared" ? "Completed": "Uncleared" : "Completed" ;
            $rowId = $expense_no;
            $entity = $table;
            $handler = $entryData['expense_handler'];

            if($entryData['payment_mode'] === "Cheque" && $entryData['payment_status']==="Completed"){
                $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");
           
            }else if($entryData['payment_status']==="Completed"){
                $pastTran = findLastTrans($dbcon,$expense_no,'transactions','trans_row_id');
                $pastData = $pastTran['values'][0];
                $entryData['amount'] = $pastData['trans_amt'];
                $entryData['trans_bank'] = $entryData['expense_paid_thru']!=="Cash" ? $entryData['expense_bank']:"";
                $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"reverse");
                if($return['status']){
                    $entryData['amount'] = $entryDataNew['expense_total_amount'];
                    $return =  handleTransactionNew($dbcon,$entryData,$entity,$rowId,$compId,$handler,"normal");

                    if(!$return['status']){
                        throw new Exception();
                    }
                }else{
                    throw new Exception();

                }
            
            }else{
                $return['status']=false;
                $return['error']=mysqli_error($dbcon);
                throw new Exception();
            }
          


        }else{
            $return['status']=false;
            throw new Exception();
        }
    }

}


// Commit transaction
$dbcon->commit();


}catch(Exception $e){
// Rollback transaction
 $dbcon->rollback();

}finally{
// Close connection
 $dbcon->close();
 echo json_encode($return);
}


?>
