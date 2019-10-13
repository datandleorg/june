<?php
include("../database/db_conection.php");//make connection here
include("../workers/getters/functions.php");//make connection here

if(isset($_GET['pe_code']))
{
    $pe_code = $_GET['pe_code'];

    $sql = "SELECT pe.*,c.* from partnerentries pe, customerprofile c where pe_code = '$pe_code' AND c.custid=pe.pe_orgid";
    $result = mysqli_query($dbcon,$sql);
    $row =$result-> fetch_assoc();
    $rw_orgid = $row['pe_orgid'];
    $rw_entrytype = $row['entrytype'];
    $raw_items = $row['pe_items'];
    $raw_items_arr = json_decode($raw_items);
    
    $sql1 = "SELECT * from comprofile where orgid ='001' limit 1 ";
    $result1 = mysqli_query($dbcon,$sql1);
    $row1 =$result1-> fetch_assoc();  
 
}

function get_itemDetails($dbcon,$code){
    echo $code;
    $sql = "SELECT * from purchaseitemaster where itemcode='$code' ";
    $result = mysqli_query($dbcon,$sql);
    $row =$result-> fetch_assoc();

    $ret = "[".$row['itemcode']."]  ".$row['itemname']." &nbsp;|&nbsp; HSN : ".$row['hsncode'];
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
            <div style="text-align:center;">PARTNER PURCHASE LIST</div>
        </h3>

        <table class="p_table" width="100%" style="border:1px solid #000;padding:10px;">
            <tbody>
                <tr>
                    <td width="50%" style="border:1px solid #000;padding:10px;">
                        <b><?php echo $rw_entrytype=="self" ? "Company" : "Customer";      ?> Name & Address</b><br/>

                        <?php echo $row['custname']; ?>,<br/>
                        <?php echo $row['address']; ?>,<br/>
                        <?php echo $row['city']; ?>-<?php echo $row['zip']; ?><br/>
                        <?php echo $row['state']; ?>&nbsp;<?php echo $row['country']; ?><br/>
                        <b>Mob#:</b>&nbsp;<?php echo $row['mobile']; ?><br/>
                        <b>GSTIN</b> - <?php echo $row['gstin']; ?>
                    </td>
                    <td style="border:1px solid #000;padding:0px;">
                        <table width="100%">
                            <tr>
                                <td style="border-bottom:1px solid #000;padding:5px;">(Partner Entries Code) PE_CODE:<b> <?php echo $row['pe_code']; ?></b></td> 
                            </tr> 
                        
             
                            <tr>
                                <td style="padding:5px;"></td> 
                            </tr>    
                        </table>

                    </td>
                </tr>
              <table width="100%" style="">
                    <thead style="border:1px solid #000;text-align:center;">
                        <th style=" width:10%;padding:10px;border:1px solid #000;">Item No.</th>
                        <th style="width:50%;padding:10px;border:1px solid #000;">Item Details</th>
                        <th style="width:15%;padding:10px;border:1px solid #000;">Qty </th>
                        <th style="width:15%;padding:10px;border:1px solid #000;">Unit</th>
                    </thead>
                    <tbody>
                        <?php
                        for($i=0;$i<count($raw_items_arr);$i++){
                        ?>
                        <tr style="border-right:1px solid #000;border-left:1px solid #000;">
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo $i+1;?>
                            </td>     
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo get_itemDetails($dbcon,$raw_items_arr[$i]->item);?>
                            </td>    
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo $raw_items_arr[$i]->qty;?>

                            </td>    
                             
                            <td style="padding:10px;padding-left:3%;border-right:1px solid #000;">
                                <?php echo $raw_items_arr[$i]->uom;?>

                            </td>
                        </tr>
                        <?php
                        }
                        ?>

                    </tbody>
                </table>
               
     
                <table class="p_table" width="100%" style="border:1px solid #000;padding:10px;">
                    <tbody>
                        <tr>
                            <td width="100%" style="border:1px solid #000;padding:10px;text-align:right;">
                            <b>For <?php echo $row1['orgname']; ?></b><br/>
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
                        window.history.back();
                    };
</script>