
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


            if($return['status']){
                print_r($array);
                $entryData = $array;
                if($entryData['expense_paid_thru']  === "Petty Cash"){

                      $comprofile = findbyand($dbcon,$entryData['expense_compId'],'comprofile','orgid')['values'][0];
                      if($comprofile['petty_cash_bal']>$entryData['expense_total_amount']){
                           // move to transaction

                           $entry['data'] = $entryData;
                           $entry['rowId'] = $expense_no;
                           $entry['colName'] = "expense_no";
                           $entry['entity'] = "expenses";

                           $transData = array();
                           $transData['trans_row_id'] = $expense_no;
                           $transData['trans_type'] = "debit";
                           $transData['trans_entry_type'] = "normal";
                           $transData['trans_entry_ref'] = "";
                           $transData['trans_amt'] = $entry['data']['expense_total_amount'];
                           $transData['trans_bank'] = $entry['data']['expense_paid_thru']!=="Cash" ? $entry['data']['expense_bank'] : "";
                           $transData['trans_entry'] = json_encode($entry);
                           $transData['trans_status'] = $entry['data']['expense_paid_thru']!=="Cheque" ? "Completed" : $entry['data']['expense_cheque_status'];
                           $transData['trans_handler'] = $entry['data']['expense_handler'];
                           $transData['trans_mode'] = $entry['data']['expense_paid_thru'] === "Petty Cash" ? "Cash" : $entry['data']['expense_paid_thru'];
                           
                           if($transData['trans_status']==="Completed" || $transData['trans_status']==="Cleared"){
                               $transData['trans_status']="Completed";
                               $return = handleTransaction($dbcon,$compId,$entry,'',$transData,'normal');
                           }


                      }else{
                      // convert undeposited amount to petty cash 
                      $conv = array();

                      $conv['conv_amt'] = $entryData['expense_total_amount'] - $comprofile['petty_cash_bal'];
                      $conv['conv_row'] = $expense_no;
                      $conv['conv_handler'] = $entryData['expense_handler'];

                      $conv_no = get_id($dbcon,'petty_cash_conversion',"CONV0");
                    
                      $sql22 = "INSERT INTO petty_cash_conversion (conv_no) VALUES ('$conv_no')";

                      if (mysqli_query($dbcon,$sql22)) {
                        $return = update_query($dbcon,json_encode($conv),$conv_no,'petty_cash_conversion',"conv_no");

                        if($return['status']){
                            $comp['cash_on_hand'] = $comprofile['cash_on_hand'] - $conv['conv_amt'];
                            $comp['petty_cash_bal'] = $comprofile['petty_cash_bal'] + $conv['conv_amt'];
                            $return = update_query($dbcon,json_encode($comp),$comprofile['orgid'],'comprofile',"orgid");

                                if($return['status']){
                                    // conversion transaction
                                    $entry['data'] = $conv;
                                    $entry['rowId'] = $conv_no;
                                    $entry['colName'] = "conv_no";
                                    $entry['entity'] = "petty_cash_conversion";
              
                                    $transData = array();
                                    $transData['trans_row_id'] = $conv_no;
                                    $transData['trans_type'] = "convert";
                                    $transData['trans_entry_type'] = "normal";
                                    $transData['trans_entry_ref'] = "";
                                    $transData['trans_amt'] = $conv['conv_amt'];
                                    $transData['trans_bank'] = "";
                                    $transData['trans_entry'] = json_encode($conv);
                                    $transData['trans_status'] = "";
                                    $transData['trans_handler'] = $conv['conv_handler'];
                                    $transData['trans_mode'] = "";
                                    $transData['total_cash_on_hand'] = $comp['cash_on_hand'];
                                    $transData['total_petty_cash'] = $comp['petty_cash_bal'];
                                    
                                        $transData['trans_status']="Completed";
                                        $return = handleTransaction($dbcon,$compId,$entry,'',$transData,'normal');
                                        print_r($return);
                                        // final expense transaction

                                        if($return['status']){
                                            // $entry['data'] = $entryData;
                                            // $entry['rowId'] = $expense_no;
                                            // $entry['colName'] = "expense_no";
                                            // $entry['entity'] = "expenses";
                      
                                            // $transData = array();
                                            // $transData['trans_row_id'] = $expense_no;
                                            // $transData['trans_type'] = "debit";
                                            // $transData['trans_entry_type'] = "normal";
                                            // $transData['trans_entry_ref'] = "";
                                            // $transData['trans_amt'] = $entry['data']['expense_total_amount'];
                                            // $transData['trans_bank'] = $entry['data']['expense_paid_thru']!=="Cash" ? $entry['data']['expense_bank'] : "";
                                            // $transData['trans_entry'] = json_encode($entry);
                                            // $transData['trans_status'] = $entry['data']['expense_paid_thru']!=="Cheque" ? "Completed" : $entry['data']['expense_cheque_status'];
                                            // $transData['trans_handler'] = $entry['data']['expense_handler'];
                                            // $transData['trans_mode'] = $entry['data']['expense_paid_thru'] === "Petty Cash" ? "Cash" : $entry['data']['expense_paid_thru'];
                                            
                                            // if($transData['trans_status']==="Completed" || $transData['trans_status']==="Cleared"){
                                            //     $transData['trans_status']="Completed";
                                            //     $return = handleTransaction($dbcon,$compId,$entry,'',$transData,'normal');
                                            // }
                                        }
                                    
                                }
                        


                        }
                      }

                  
                    }
                }else{
                    $entry['data'] = $entryData;
                    $entry['rowId'] = $expense_no;
                    $entry['colName'] = "expense_no";
                    $entry['entity'] = "expenses";

                    $transData = array();
                    $transData['trans_row_id'] = $expense_no;
                    $transData['trans_type'] = "debit";
                    $transData['trans_entry_type'] = "normal";
                    $transData['trans_entry_ref'] = "";
                    $transData['trans_amt'] = $entry['data']['expense_total_amount'];
                    $transData['trans_bank'] = $entry['data']['expense_paid_thru']!=="Cash" ? $entry['data']['expense_bank'] : "";
                    $transData['trans_entry'] = json_encode($entry);
                    $transData['trans_status'] = $entry['data']['expense_paid_thru']!=="Cheque" ? "Completed" : $entry['data']['expense_cheque_status'];
                    $transData['trans_handler'] = $entry['data']['expense_handler'];
                    $transData['trans_mode'] = $entry['data']['expense_paid_thru'] === "Petty Cash" ? "Cash" : $entry['data']['expense_paid_thru'];
                    
                    if($transData['trans_status']==="Completed" || $transData['trans_status']==="Cleared"){
                        $transData['trans_status']="Completed";
                        $return = handleTransaction($dbcon,$compId,$entry,'',$transData,'normal');
                    }

                }
            }else{
                $return['status']=false;
                $return['error']=mysqli_error($dbcon);
            }
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
