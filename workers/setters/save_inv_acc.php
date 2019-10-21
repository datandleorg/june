
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $inv_code=$_POST['inv_code'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $prefix=$_POST['prefix'];
    $return=array();

    if ($inv_code=="") {
        $inv_code = get_id($dbcon,$table,"INVAC-0000");
        $inv_code .="-".$prefix;
    }


    if($action=="add"){
        $sql2 = "INSERT INTO $table (inv_code) VALUES ('$inv_code')";
        if (mysqli_query($dbcon,$sql2)) {
            $return = update_query($dbcon,$array,$inv_code,$table,"inv_code");
            if($return['status']==true){

                $inv_val_arr = findbyand($dbcon,$inv_code,$table,"inv_code");

                $obj = json_decode($array, true);
                $items = json_decode($obj['inv_items'], true);               

                for($i=0;$i<count($items);$i++){
    
                    $sql4 = " UPDATE scrapinventory SET scrap_inventory_qty  =  scrap_inventory_qty  - ".$items[$i]['rwqty']."  WHERE scrap_itemcode='".$items[$i]['itemcode']."' ;";
                            
                    if (mysqli_query($dbcon,$sql4)) {
                        $return['status']=true;

                    }else{
                        $return['status']=false;
                        $return['error']=mysqli_error($dbcon);
                        break;
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
        $past = findbyand($dbcon,$inv_code,$table,"inv_code");
        $val_arr = $past['values'];
        $obj2 = json_decode($val_arr[0]['inv_items'], true);

        for($i=0;$i<count($obj2);$i++){
            
            $sql = " UPDATE scrapinventory SET scrap_inventory_qty =  scrap_inventory_qty + ".$obj2[$i]['rwqty']."  WHERE scrap_itemcode='".$obj2[$i]['itemcode']."' ;";
            if (mysqli_query($dbcon,$sql)) {
                continue;
            }else{
                break;
            }
        }
        $return = update_query($dbcon,$array,$inv_code,$table,"inv_code");
      
        if($return['status']===true){

            $obj = json_decode($array, true);
            $items = json_decode($obj['inv_items'], true);

            for($i=0;$i<count($items);$i++){
                $sql0 = " UPDATE scrapinventory SET scrap_inventory_qty =  scrap_inventory_qty - ".$items[$i]['rwqty']."  WHERE scrap_itemcode='".$items[$i]['itemcode']."' ;";
                if (mysqli_query($dbcon,$sql0)) {
                    $return['status']=true;
                    continue;
                }else{
                    $return['status']=false;
                    $return['error']=mysqli_error($dbcon);        
                    break;
                }
            }

        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }

    }

}
echo json_encode($return);


?>
