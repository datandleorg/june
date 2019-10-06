<?php
include("../database/db_conection.php");//make connection here
include("../workers/getters/functions.php");//make connection here

if(isset($_GET['prod_code']))
{
    $prod_code = $_GET['prod_code'];

    $sql = "SELECT p.entrytype as prod_entrytype,p.custid as prod_custid,p.*,s.* from productionlist p , salesitemaster2 s where s.itemcode=p.prod_item and  prod_code = '$prod_code' ";
    $result = mysqli_query($dbcon,$sql);
    $row =$result-> fetch_assoc();

    $prod_company = $row['prod_company'];
    $prod_custid = $row['prod_custid'];
    $prod_raw_items = $row['prod_raw_items'];
    $prod_entrytype = $row['prod_entrytype'];
    $prod_raw_items_arr = json_decode($prod_raw_items);

    $sql1 = "SELECT * from comprofile where orgid ='001' limit 1 ";
    $result1 = mysqli_query($dbcon,$sql1);
    $row1 =$result1-> fetch_assoc();  
 
    if($prod_entrytype=="self"){
        $sql2 = "SELECT * from comprofile where orgid ='001' limit 1 ";
    }else if($prod_entrytype=="outsourced"){
        $sql2 = "SELECT comp.*, comp.custname as orgname from customerprofile comp where custid ='$prod_custid' limit 1 ";
    }

    $result2 = mysqli_query($dbcon,$sql2);
    $row2 =$result2-> fetch_assoc();  


}


function get_itemDetails($dbcon,$code){
    $sql = "SELECT * from purchaseitemaster where itemcode='$code' ";
    $result = mysqli_query($dbcon,$sql);
    $row =$result-> fetch_assoc();

   // $ret = "[".$row['itemcode']."]  ".$row['itemname']." &nbsp;|&nbsp; HSN : ".$row['hsncode']."&nbsp;|&nbsp;";
   // $ret.=  "GST@ ".($row['taxrate']/1)."%";
    
    $ret = "[".$row['itemcode']."]  ".$row['itemname']." ";
   // $ret.=  "GST@ ".($row['taxrate']/1)."%";
    
    return $ret;
}

?> 

<html>
    <head>
        <meta content="text/html; charset=UTF-8" http-equiv="content-type">
        <style type="text/css">
            .p_table{
                border:1px soid #000;
            }
        </style>

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    </head>
    <body onload="printInit();">
             <img src="images/logo.png" width="200px" height="100px"/>
       <h5 > <div style="text-align:center">Lento Foods India Private Limited<br>
		</div> </h5>
        <h3>
            <div style="text-align:center;">Production Report</div>
        </h3>

        <table class="p_table" width="100%" style="border:1px solid #000;padding:10px;">
            <tbody>
                <tr>
                    <td width="50%" style="border:1px solid #000;padding:10px;">
                    <b><?php echo $prod_entrytype=="self" ? "Company" : "Customer";      ?> Name & Address</b><br/>

                        <?php echo $row2['orgname']; ?>,<br/>
                        <?php echo $row2['address']; ?>,<br/>
                        <?php echo $row2['city']; ?>-<?php echo $row2['zip']; ?><br/>
                        <?php echo $row2['state']; ?>&nbsp;<?php echo $row2['country']; ?><br/>
                        <b>Mob#:</b>&nbsp;<?php echo $row2['mobile']; ?><br/>
                        <b>GSTIN</b> - <?php echo $row2['gstin']; ?>
                    </td>
                    <td style="border:1px solid #000;padding:0px;">
                        <table width="100%">
                            <tr>
                                <td style="border-bottom:1px solid #000;padding:5px;">Production Id#:<b> <?php echo $row['prod_code']; ?></b></td> 
                            </tr> 
                            <tr>
                                <td style="border-bottom:1px solid #000;padding:5px;">
                                    Production Date: <b><?php echo $row['prod_date']; ?></b>
                                </td> 
                            </tr>    
                            <tr>
                                <td style="padding:5px;">
                                Production Status: <b><?php echo $row['prod_status']; ?></b>
                                </td> 
                            </tr>  
                            <tr>
                                <td style="padding:5px;"></td> 
                            </tr>    
                        </table>

                    </td>
                </tr>
                <tr>
                    <td width="50%" style="border:1px solid #000;padding:10px;">
                    
                    </td>
                    <td style="border:1px solid #000;padding:10px;">
                        <table>
                            <tbody>
                                <tr>
                                    <td width="40%">
                                        <b>Product</b>
                                    </td>
                                    <td>
                                        <b>: <?php echo $row['itemname'];?></b>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="40%">
                                        <b>Qty </b>
                                    </td>
                                    <td>
                                        <b>: <?php echo $row['prod_qty'];?></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <b>Unit</b>
                                    </td>
                                    <td>
                                        <b>: <?php echo $row['prod_uom'];?></b>
                                    </td>
                                </tr>
                             
                            </tbody>
                        </table>
                    </td>
                </tr>
                <table width="100%" style="">
                    <thead style="border:1px solid #000;text-align:center;">
                        <th style=" width:10%;padding:10px;border:1px solid #000;">Item No.</th>
                        <th style="width:50%;padding:10px;border:1px solid #000;">Item Details</th>
                        <th style="width:15%;padding:10px;border:1px solid #000;">Qty</th>
                        <th style="width:10%;padding:10px;border:1px solid #000;">Unit</th>
                    </thead>
                    <tbody>
                        <?php
                        for($i=0;$i<count($prod_raw_items_arr);$i++){
                        ?>
                        <tr style="border-right:1px solid #000;border-left:1px solid #000;">
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo $i+1;?>
                            </td>     
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo get_itemDetails($dbcon,$prod_raw_items_arr[$i]->item);?>
                            </td>    
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo $prod_raw_items_arr[$i]->qty;?>

                            </td>    
                            <td style="padding:10px;padding-left:1%;border-right:1px solid #000;">
                                <?php echo $prod_raw_items_arr[$i]->uom;?>

                            </td>    
                  
                        </tr>
                        <?php
                        }
                        ?>

                    </tbody>
                </table>
             
                        </tr>
                    </tbody>
                </table>
          
                <table class="p_table" width="100%" style="border:1px solid #000;padding:10px;">
                    <tbody>
                        <tr>
                            <td width="100%" style="border:1px solid #000;padding-top:10px;padding-left:10px;">
                                <p><b>Notes :</b> <?php echo $row['prod_notes']; ?></p><br/>

                            </td>
                        </tr>
                    </tbody>
                </table>
                <table class="p_table" width="100%" style="border:1px solid #000;padding:10px;">
                    <tbody>
                        <tr>
                            <td width="100%" style="border:1px solid #000;padding:10px;text-align:right;">
                            <b>For <?php echo $row2['orgname']; ?></b><br/>
                            <br/>
                            <br/>
                            <b>Authorized Signatory</b>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
            </tbody>
        </table>

<script>

               function printInit(){
               window.print();
               window.onbeforeprint = beforePrint;
               window.onafterprint = afterPrint;

               }

                        
                   var beforePrint = function () {
                       // alert('start');
                    };

                    var afterPrint = function () {
                        window.location.href = '/lento/listProductions.php';
                    };
</script>