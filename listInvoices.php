<?php include('header.php'); ?>
<?php
	$orgidUrl = "";
	if(isset($_GET['custid'])){ $orgidUrl = $_GET['custid']; } 

?>
<!-- End Sidebar -->

<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">

            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Invoice list</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">List Invoice Items</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!-- end row -->
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">						
                    <div class="card mb-3">
                        <div class="card-header">


                            <span class="pull-right">
                                <a href="addInvoice.php" class="btn btn-primary btn-sm"><i class="fa fa-user-plus" aria-hidden="true"></i>
                                    Add Invoice</a></span>

                            <h3><i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i><b>  Invoice list </b></h3>
                        </div>

                        <div class="form-row px-3 py-2">
                                    <div class="form-group col-md-4">
                                        <label for="inputState">Filter By Customer<i class="text-danger">*</i></label>
                                        <select id="compcode" 
										onchange="redirectTo(this)" class="form-control form-control-sm select2"  
										required name="orgid" required autocomplete="off">
                                            <option value="">Select Customer</option>
                                            <?php 
											include("database/db_conection.php");//make connection here
											 $sql = "SELECT id as oid, custid as orgid,concat(custid,'-',custname) as orgname, custype as orgtype FROM customerprofile 
										    ORDER BY oid ASC;
											";
                                            $exe = mysqli_query($dbcon,$sql); 
                                            while ($row = $exe->fetch_assoc()){	
                                                 $orgid=$row['orgid'];
												 $orgname=$row['orgname'];
                                                 $orgtype=$row['orgtype'];
                                                
												if($orgidUrl!='' && $orgidUrl===$orgid){
													echo '<option data-orgtype="'.$orgtype.'" selected  value="'.$orgid.'" >'.$orgname.' </option>';
												}else{
													echo '<option data-orgtype="'.$orgtype.'" value="'.$orgid.'" >'.$orgname.' </option>';

												}

                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="listinvoicestable" class="table table-bordered table-hover display">
                                    <thead>
                                        <tr>
                                            <th style="display:none;">Id#</th>												
                                            <th>Invoice#</th>												
                                            <th>Invoice Type</th>												
                                            <th>Phone</th>												
                                            <th>Inv Date</th>												
                                            <th>Customer</th>
                                            <th>Invoice Status</th>												
                                            <th>Amount</th>												
                                            <th>Balance due</th>												
                                            <th>Payment Status</th>												
                                            <th>Sales Person</th>												
                                            <th>Actions</th>
                                        </tr>
                                    </thead>										
                                    <tbody>


                                        <?php
                                        function payment_status($payment_status,$newdate,$po_payterm,$grn_date){
                                            $curdate=strtotime($newdate);
                                            $mydate=strtotime('+'.$po_payterm.' day', strtotime($grn_date));

                                            if($curdate > $mydate)
                                            {
                                                return '<span class="text-danger">Overdue</span>';
                                            }else{
                                                if($payment_status=="Paid"){
                                                    return '<span class="text-success">'.$payment_status.'</span>';

                                                }elseif($payment_status=="Unpaid"){
                                                    return '<span class="text-warning">'.$payment_status.'</span>';

                                                }else{
                                                    return '<span class="text-info">'.$payment_status.'</span>';

                                                }
                                            }
                                        }

                                        function status_code($status){
                                            if($status=="Approved"){
                                                $status_text = ' <span class="text-dark">'.$status.'</span>';  
                                                return $status_text;  
                                            }
                                            if($status=="Created"){
                                                $status_text = ' <span class="text-primary">'.$status.'</span>';  
                                                return $status_text;  
                                            } 


                                            if($status=="Cancelled"){
                                                $status_text = ' <span class="text-secondary">'.$status.'</span>';  
                                                return $status_text;  
                                            } 
                                            if($status=="Closed"){
                                                $status_text = ' <span class="text-muted">'.$status.'</span>';  
                                                return $status_text;  
                                            } 
                                        }

                                        if(isset($_GET['customer_credits_custid'])&&isset($_GET['customer_credits_id'])){
                                            $sql = "SELECT i.*,c.* FROM invoices i,customerprofile c where c.custid=i.inv_customer ";
                                            $sql.= $_GET['customer_credits_custid']!=='' ? " and c.custid='".$_GET['customer_credits_custid']."' " : "";
                                            $sql.="ORDER BY i.id DESC ";
                                        }else{
                                            $sql = "SELECT i.*,c.* FROM invoices i,customerprofile c where c.custid=i.inv_customer ";
                                            $sql.= $orgidUrl!=='' ? " and c.custid='".$orgidUrl."' " : "";
                                            $sql.="ORDER BY i.id DESC ";
    
                                        }
                                        
                                        $result = mysqli_query($dbcon,$sql);
                                        if ($result->num_rows > 0){
                                            while ($row =$result-> fetch_assoc()){
                                                echo "<tr>";
                                                echo '<td style="display:none;">' .$row['id'] . '</td>';
                                                echo '<td>' .$row['inv_code'] . '</td>';
                                                echo '<td>'.$row['inv_type'].' </td>';
                                                //echo '<td>'.$row['inv_cust_ref_phno'].' </td>';
                                                 echo '<td>'.$row['mobile'].' </td>';
                                                echo '<td>'.$row['inv_date'].' </td>';
                                                echo '<td>'.$row['custname'].' </td>';
                                                echo '<td>'.status_code($row['inv_status']).' </td>';
                                                echo '<td>'.$row['inv_value'].' </td>';
                                                echo '<td>'.$row['inv_balance_amt'].' </td>';
                                                if($row['inv_type']=="Credit Invoice"){
                                                    echo '<td>'.payment_status($row['inv_payment_status'],date('Y-m-d'),$row['inv_payterm'],$row['inv_date']) .' </td>';

                                                }else{
                                                    echo '<td><span class="text-success">Paid</span> </td>';

                                                }

                                                echo '<td>'.$row['inv_owner'].' </td>';
                                        ?>


                                        <?php


                                                echo '<td>';

                                                echo '    <div class="dropdown">
  <button type="button" class="btn btn-light btn-xs dropdown-toggle" data-toggle="dropdown">

  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item"  href="#" onclick="ToPrint(this);" data-template="sales_credit_inv" data-code="'.$row['inv_code'].'" data-img="assets/images/logo.png"  data-id="po_print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp; Print</a>   <a class="dropdown-item"  href="#" onclick="ToPrint(this);" data-template="dc_print" data-code="'.$row['inv_code'].'" data-img="assets/images/logo.png"  data-id="po_print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp; DC Print</a>';


                                                if($row['inv_status']=="Created"){
                                                    echo ' <a class="dropdown-item" href="addInvoice.php?inv_code=' . $row['inv_code'] . '&action=edit&type=invoices" class="btn btn-primary btn-sm" data-target="#modal_edit_user_5"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp; Edit</a>';   
                                                    echo '
                                                        <a class="dropdown-item"  href="#" onclick="deleteRecord_8(this);" data-id="'.$row['inv_code'].'" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp; Delete</a>';

                                                    echo '
                                                        <a class="dropdown-item"  href="workers/setters/invconvert.php?inv_code='.$row['inv_code'].'&inv_status=Approved"  data-id="'.$row['inv_code'].'" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp; Convert to Approved</a>';

                                                }

                                                if($row['inv_status']=="Approved" && $row['inv_balance_amt']>0){
                                                    if(isset($_GET['customer_credits_id'])){
                                                        echo '
                                                        <a class="dropdown-item"  href="addCustomerReceipts.php?customer_credits_id='.$_GET['customer_credits_id'].'&customer_credits_custid='.$_GET['customer_credits_custid'].'&inv_code=' . $row['inv_code'] . '&action=add&type=customer_payments" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Recieve Payment"><i class="fa fa-exchange" aria-hidden="true"></i>&nbsp; Recieve payment</a>';

                                                    }else{
                                                        echo '
                                                        <a class="dropdown-item"  href="addCustomerReceipts.php?inv_code=' . $row['inv_code'] . '&action=add&type=customer_payments" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Recieve Payment"><i class="fa fa-exchange" aria-hidden="true"></i>&nbsp; Recieve payment</a>';

                                                    echo '
                                                        <a class="dropdown-item"  href="addCreditNotes.php?inv_code=' . $row['inv_code'] . '&action=add&type=creditnotes" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="  Create CreditNote"><i class="fa fa-exchange" aria-hidden="true"></i>&nbsp; Create CreditNote</a>';

                                                    }

                                                }



                                                echo '    </div></div>';


                                                echo ' </td>';
                                                echo "</tr>";
                                            }
                                        }
                                        ?>						
                                        <script>
                                            function deleteRecord_8(x)
                                            {
                                                var RecordId = $(x).attr('data-id');
                                                if (confirm('Confirm delete')) {
                                                    window.location.href = 'deleteInvoices.php?inv_code='+RecordId;
                                                }
                                            }
                                        </script>

                                    </tbody>
                                </table>
                            </div>

                        </div>														
                    </div><!-- end card-->	
        
                </div>


                <script>

                    var table = $('#listinvoicestable').DataTable();
                    table.order( [ 5, 'desc' ] ).draw();

                    function ToPrint(el){
                        var code= $(el).attr('data-code');
                        var template= $(el).attr('data-template');
                            if(template=="sales_credit_inv"){
                                window.location.href = 'assets/'+template+'.php?inv_code='+code;

                            }else{
                                window.location.href = 'assets/'+template+'.php?inv_code='+code;
                            }
                     }

                     function redirectTo(ele){
                        var orgid = $(ele).val();
                        var orgtype = $(ele).find('option:selected').attr('data-orgtype');
                        location.href='listInvoices.php?custid='+orgid+'&custype='+orgtype;
                    }
     
                </script>
                <?php include('footer.php'); ?>