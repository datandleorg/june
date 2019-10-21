
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $pe_code=$_POST['pe_code'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $pe_orgid=$_POST['orgid'];
    $compname=$_POST['compname'];

    $return=array();
    

    $prefix = $compname!='' ?  strtoupper(substr($compname, 0, 3)):'';

    if ($pe_code=="") {
  
      $pe_code = get_id($dbcon,$table,$prefix."PE-00");
    }
    

    if($action=="add"){
        $sql2 = "INSERT INTO partnerentries (pe_code) VALUES ('$pe_code')";

        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$pe_code,$table,"pe_code");

            if($return['status']){
                $obj = json_decode($array, true);
                $items = json_decode($obj['pe_items'], true); 
    
                for($i=0;$i<count($items);$i++){
                    $sql4 = " UPDATE purchaseitemaster SET stockinqty =  stockinqty + ".$items[$i]['qty']."  WHERE itemcode='".$items[$i]['item']."' AND orgid='".$pe_orgid."' ;";
                    if (mysqli_query($dbcon,$sql4)) {
                        $return['status']=true;
            
                    }else{
                        $return['status']=false;
                        $return['error']=mysqli_error($dbcon);            
                        break;
                    }
                }
            }
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{

        $past = findbyand($dbcon,$pe_code,$table,"pe_code");

        $val_arr = $past['values'];
        $obj2 = json_decode($val_arr[0]['pe_items'], true);
        for($i=0;$i<count($obj2);$i++){
            
            $sql = " UPDATE purchaseitemaster SET stockinqty =  stockinqty - ".$obj2[$i]['qty']." WHERE itemcode='".$obj2[$i]['item']."' AND orgid='".$pe_orgid."' ;";
            if (mysqli_query($dbcon,$sql)) {
                continue;
            }else{
                break;
            }
        }

        $return = update_query($dbcon,$array,$pe_code,$table,"pe_code");

                    if($return['status']){
                        $obj = json_decode($array, true);
                        $items = json_decode($obj['pe_items'], true); 

                        for($i=0;$i<count($items);$i++){
                            $sql4 = " UPDATE purchaseitemaster SET stockinqty =  stockinqty + ".$items[$i]['qty']."  WHERE itemcode='".$items[$i]['item']."' AND orgid='".$pe_orgid."' ;";
                            if (mysqli_query($dbcon,$sql4)) {
                                $return['status']=true;
                    
                            }else{
                                $return['status']=false;
                                $return['error']=mysqli_error($dbcon);            
                                break;
                            }
                        }
                    }

    }

}
echo json_encode($return);


?>
