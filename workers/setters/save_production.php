
<?php
include('../../database/db_conection.php');

include('../getters/functions.php');

if (isset($_POST['array'])) {
    $array=$_POST['array'];
    $pro_code=$_POST['pro_code'];
    $action=$_POST['action'];
    $table=$_POST['table'];
    $prod_status=$_POST['pro_status'];
    $prod_orgid=$_POST['prod_orgid'];
    $compname=$_POST['compname'];
    $return=array();
    
    $prefix = $compname!='' ?  strtoupper(substr($compname, 0, 3)):'';

    if ($pro_code=="") {
  
        $pro_code = get_id($dbcon,$table,$prefix."PRD-0");
    }

    if($action=="add"){
        $sql2 = "INSERT INTO productionlist (prod_code) VALUES ('$pro_code')";

        if (mysqli_query($dbcon,$sql2)) {

            $return = update_query($dbcon,$array,$pro_code,$table,"prod_code");
            $return['code']= $pro_code;
            // if($return['status']==true){
            //     $obj = json_decode($array, true);
            //     $items = json_decode($obj['prod_raw_items'], true); 
                
            //     for($i=0;$i<count($items);$i++){
               
            //         $sql4 = " UPDATE purchaseitemaster SET stockinqty =  stockinqty - ".$items[$i]['qty']."  WHERE itemcode='".$items[$i]['item']."' ;";

            //         if (mysqli_query($dbcon,$sql4)) {
            //             $return['status']=true;

            //         }else{
            //             $return['status']=false;
            //             $return['error']=mysqli_error($dbcon);
            //         }

            //     }
            // }
        }else{
            $return['status']=false;
            $return['error']=mysqli_error($dbcon);
        }
    }else{

        // if($prod_status!=="Created"){
        //     $past = findbyand($dbcon,$pro_code,$table,"prod_code");
        
        //     $val_arr = $past['values'];
        //     $obj2 = json_decode($val_arr[0]['prod_raw_items'], true);
        //     for($i=0;$i<count($obj2);$i++){
                
        //         $sql = " UPDATE purchaseitemaster SET stockinqty =  stockinqty + ".$obj2[$i]['qty']."  WHERE itemcode='".$obj2[$i]['item']."' AND orgid='".$prod_orgid."' ;";
        //         if (mysqli_query($dbcon,$sql)) {
        //             continue;
        //         }else{
        //             break;
        //         }
        //     }
        // }


        $return = update_query($dbcon,$array,$pro_code,$table,"prod_code");

        
        if($return['status']==true && $prod_status=="Completed"){

            $obj = json_decode($array, true);
            $items = json_decode($obj['prod_raw_items'], true); 
            
            for($i=0;$i<count($items);$i++){
           
               $sql4 = " UPDATE purchaseitemaster SET stockinqty =  stockinqty - ".$items[$i]['qty']."  WHERE itemcode='".$items[$i]['item']."' AND orgid='".$prod_orgid."' ;";

                if (mysqli_query($dbcon,$sql4)) {
                    $return['status']=true;
                    $return['code']= $pro_code;
                }else{
                    $return['status']=false;
                    $return['error']=mysqli_error($dbcon);
                }

            }

            //  add to sales inventory 

            $sql = " UPDATE salesitemaster2 SET stockinqty =  stockinqty + ".$obj['prod_qty']."  WHERE itemcode='".$obj['prod_item']."' ;";
            if (mysqli_query($dbcon,$sql)) {
                $return['status']=true;
                $return['code']= $pro_code;
            }else{
                $return['status']=false;
                $return['error']=mysqli_error($dbcon);
            }

        }

    }

}

echo json_encode($return);


?>
