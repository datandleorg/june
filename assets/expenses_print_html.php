<?php
include("../database/db_conection.php");//make connection here
include("../workers/getters/functions.php");//make connection here

if(isset($_GET['expense_no']))
{
    $expense_no = $_GET['expense_no'];

    $sql = "SELECT * from expenses where expense_no = '$expense_no' ";
    $result = mysqli_query($dbcon,$sql);
    $row =$result-> fetch_assoc();
    $expense_items = $row['expense_items'];
    $expense_items_arr = json_decode($expense_items);
    
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

function getTotal($arr){
   $sum = 0;

   foreach ($arr as $value){ 
      $sum+= (float)$value->expense_amount;
   } 

   return $sum;
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
            <div style="text-align:center;">VOUCHER</div>
        </h3>

        <table class="p_table" width="100%" style="border:1px solid #000;padding:10px;">
            <tbody>
                <tr>
                    <td width="50%" style="border:1px solid #000;padding:10px;">
                    <b>Voucher No:</b> <?php echo $row['expense_no']; ?><br/>
                    <b>Voucher Data:</b> <?php echo $row['expense_date']; ?><br/>
                    <b>Amount:</b> <?php echo $row['expense_total_amount']; ?><br/>
                    </td>
                    <td style="border:1px solid #000;padding:0px;">
                        <table width="100%">
                            <tr>
                                <td style="border-bottom:1px solid #000;padding:5px;">Mode Of Payment:<b> <?php echo $row['expense_paid_thru']; ?></b></td> 
                            </tr> 
                        
                            <tr>
                                <td style="padding:5px;">
                                Payee: <b><?php echo $row['expense_payee']; ?></b>
                                </td> 
                            </tr>  
                            <tr>
                                <td style="padding:5px;">
                                Invoice No: <b><?php echo $row['expense_invoice_no']; ?></b>
                                </td> 
                            </tr>    
                        </table>

                    </td>
                </tr>
              <table width="100%" style="boder:1px solid #000;">
                    <thead style="border:1px solid #000;text-align:center;">
                        <th style=" width:10%;padding:10px;border:1px solid #000;">Item No.</th>
                        <th style="width:50%;padding:10px;border:1px solid #000;">Category</th>
                        <th style="width:15%;padding:10px;border:1px solid #000;">Description </th>
                        <th style="width:15%;padding:10px;border:1px solid #000;">Amount </th>
                    </thead>
                    <tbody>
                        <?php
                        for($i=0;$i<count($expense_items_arr);$i++){
                        ?>
                        <tr style="border-right:1px solid #000;border-left:1px solid #000;">
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo $i+1;?>
                            </td>     
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo $expense_items_arr[$i]->expense_category;?>
                            </td>    
                            <td style="padding:10px;padding-left:5%;border-right:1px solid #000;">
                                <?php echo $expense_items_arr[$i]->expense_desc;?>

                            </td>    
                             
                            <td style="padding:10px;padding-left:3%;border-right:1px solid #000;">
                                <?php echo $expense_items_arr[$i]->expense_amount;?>

                            </td>
                        </tr>
                        <?php
                        }
                        ?>

                    </tbody>
                </table>

                <table style="border:1px solid #000;width:100%;">
                  <tbody>
                    <tr>
                      <td width="60%">
                      </td>
                      <td>
                        <table>
                          <tbody>
                            <tr>
                            <td style="padding:1em;width:60%;"><b>Sub Total:</b><td>
                            <td style="padding:1em;width:40%;"><?php echo getTotal($expense_items_arr); ?><td>
                            </tr>
                            <tr>
                            <td style="padding:1em;width:60%;"><b>GrandTotal Total:</b><td>
                            <td style="padding:1em;width:40%;"><?php echo getTotal($expense_items_arr); ?><td>
                            </tr>
                           </tbody>
                        </table>

                      </td>
                    </tr>
                  </tbody>
                </table>
                
                <table style="border:1px solid #000;width:100%;">
                  <tbody>
                    <tr>
                      <td width="50%" style="padding:1em;">
                            <b>Notes:</b>
                            <p><?php echo $row['expense_notes'];?></p>
                      </td>
                      <td>
<!-- 
                      <table width="100%" style="padding:0px;border:1px solid #000;" >
                                    <tbody>
                                        <tr>
                                            <td width="56%" style="text-align:center;border-bottom:1px solid #000;padding:0px;">
                                               <b> Sub Total</b>
                                            </td>
                                            <td style="text-align:center;padding:10px;border-bottom:1px solid #000;"> 
                                            
                                            </td>
                                        </tr>
                              
                              
                                        <tr>
                                            <td width="56%" style="text-align:center;padding:0px;border-bottom:1px solid #000;">
                                                <b>Grand Total</b>
                                            </td>
                                 
                                            <td style="text-align:center;padding:10px;border-bottom:1px solid #000;"> 

                                            </td>
                                        </tr>
                                     
                                    </tbody>
                                </table> -->

                      </td>
                    </tr>
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