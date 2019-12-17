<?php
include("database/db_conection.php");//make connection here
include('workers/getters/functions.php');

               $v_credits_id = $_GET['id'];
               // reversing transactions
               $entry = findbyand($dbcon,$v_credits_id,'vendorcredits','v_credits_id')['values'][0];
          
               $pastTran = findLastTrans($dbcon,$v_credits_id,'transactions','trans_row_id');
               $pastData = $pastTran['values'][0];
               $transid = $pastData['trans_id'];

               $transData['trans_row_id'] = $v_credits_id;
               $transData['trans_type'] = $pastData['trans_type'] === "debit" ? "credit": "debit";
               $transData['trans_entry_type'] = "reverted";
               $transData['trans_entry_ref'] = $transid;
               $transData['trans_amt'] = $pastData['trans_amt'];
               $transData['trans_bank'] = $pastData['trans_mode']!=="Cash" ? $pastData['trans_bank'] : "";
               $transData['trans_entry'] = json_encode($pastData['trans_entry']);
               $transData['trans_status'] =  "Completed" ;
               $transData['trans_handler'] = $handler;
               $transData['trans_mode'] = $pastData['trans_mode'];

               $return = handleTransaction($dbcon,$entry['v_credits_compId'],$entry,'',$transData);      
               
               if($return['status']){
                    $sql = "DELETE FROM vendorcredits WHERE v_credits_id='".$_GET['id']."' ";

                    if ($dbcon->query($sql) === TRUE) {
                    header("Location: listVendorCredits.php");
                    } else {
                        echo "Error deleting record: " . $dbcon->error;
                    }
               }else{
                echo "Error deleting record";

               }


    $dbcon->close();
?>