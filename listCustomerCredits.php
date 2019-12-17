<?php include('header.php'); ?>
<!-- End Sidebar -->

<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">

            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Customer Credits list</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">List Customer Credits</li>
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
                                <a href="addCustomerCredits.php" class="btn btn-primary btn-sm"><i class="fa fa-user-plus" aria-hidden="true"></i>
                                    Add Customer Credits</a></span>

                            <h3><i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i><b> Customer Credits list </b></h3>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-hover display">
                                    <thead>
                                        <tr>
                                            <th>Credit No.</th>												
                                            <th>Credit Date</th>												
                                            <th>Status</th>												
                                            <th>Customer</th>
                                            <th>Amount</th>	
                                            <th>Payment Mode</th>												
                                            <th>RefNo & Status</th>																							
                                            <th>Credit Balance</th>												
                                            <th>User</th>												
                                            <th>Actions</th>
                                        </tr>
                                    </thead>										
                                    <tbody>
                                        <?php


                                        include("database/db_conection.php");//make connection here
                                        $sql = "SELECT c.*,concat(cust.custid,' ',custname) as custname
										FROM customercredits c,customerprofile cust
										WHERE c.customer_credits_custid=cust.custid
                                        ORDER BY c.id DESC ";
                                        
                                        $result = mysqli_query($dbcon,$sql);
                                        if ($result->num_rows > 0){
                                            while ($row =$result-> fetch_assoc()){
                                                echo "<tr>";
                                                echo '<td>' .$row['customer_credits_id'] . '</td>';
                                                echo '<td>'.$row['customer_credits_paymentdate'].' </td>';
                                                if($row['customer_credits_availcredits']==0){
                                                    echo '<td class="text-success"> Closed </td>';

                                                }else{
                                                    echo '<td class="text-danger"> Open </td>';

                                                }
                                                echo '<td>'.$row['custname'].' </td>';
                                                echo '<td>'.$row['customer_credits_amount'].' </td>';
                                                echo '<td>'.$row['customer_credits_paymentmode'].' </td>';
                                                echo '<td>'.$row['customer_credits_ref_no'].'<br/>['.$row['customer_credits_cheque_status'].']</td>';

                                                echo '<td>'.$row['customer_credits_availcredits'].' </td>';
                                                echo '<td>'.$row['customer_credits_handler'].' </td>';
                                        ?>



                                        <?php
                                                echo ' <td>
                                                <div class="dropdown">
  <button type="button" class="btn btn-light btn-xs dropdown-toggle" data-toggle="dropdown">

  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#" onclick="ToPrint(this);"  data-id="po_print" data-code="'.$row['customer_credits_id'].'" data-img="assets/images/logo.png"> <i class="fa fa-print" aria-hidden="true"></i>&nbsp; Print</a>';
                                                if($row['customer_credits_availcredits']>0){
                                                    echo '
    <a class="dropdown-item" href="addCustomerCredits.php?customer_credits_id=' . $row['customer_credits_id'] . '&action=edit&type=customercredits"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp; Edit</a>';      

                                                    echo '
                                                    <a class="dropdown-item" href="#" onclick="deleteRecord_8(this);" data-id="'.$row['customer_credits_id'].'"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp; Delete</a>';
                                                    echo '<a class="dropdown-item" href="addCustomerRefund.php?customer_credits_id=' . $row['customer_credits_id'] . '&action=add&type=vendor_refunds"><i class="fa fa-rupee" aria-hidden="true"></i>&nbsp; Add Refund</a>';

                                                    echo '<a class="dropdown-item" href="listInvoices.php?customer_credits_id=' . $row['customer_credits_id'].'&customer_credits_custid=' . $row['customer_credits_custid'].'"><i class="fa fa-rupee" aria-hidden="true"></i>&nbsp; Apply to bills</a>';
                                                }


                                                echo        '</div></div></td>';
                                                echo ' </td>';
                                                echo "</tr>";
                                            }
                                        }
                                        ?>	

                                        <script>
                                            function deleteRecord_8(x)
                                            {
                                                console.log(x);
                                                var RecordId = $(x).attr('data-id');
                                                console.log(RecordId);
                                                console.log($(x).attr('data-id'));
                                                if (confirm('Confirm delete')) {
                                                    window.location.href = 'deleteCustomerCredits.php?id='+RecordId;
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
                      function ToPrint(el){
                        var code= $(el).attr('data-code');
                        window.location.href = 'assets/customer_credits_print_html.php?customer_credits_id='+code;
                     }
                </script>
                <?php include('footer.php'); ?>