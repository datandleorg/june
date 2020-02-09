<?php include('header.php'); ?>
<!-- End Sidebar -->

<script src="assets/js/jspdf.debug.js"></script>
<script src="assets/js/jspdf.min.js"></script>

<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">

            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Payments list</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">List Payments</li>
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
                                <a href="addVendorPayments.php" class="btn btn-primary btn-sm"><i class="fa fa-user-plus" aria-hidden="true"></i>
                                    Add Payments</a></span>

                            <h3><i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i><b> Payments list </b></h3>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-hover display">
                                    <thead>
                                        <tr>
                                            <th style="display:none;">Id#</th>												
                                            <th style="width:50px">Transaction#</th>												
                                            <th style="width:3000px">Date</th>												
                                            <th style="width:200px">Bank</th>
                                            <th style="width:200px">Reference#</th>
                                            <th style="width:3500px">Vendor</th>												
                                            <th style="width:100px">Invoioce#</th>												
                                            <th style="width:300px">PaymentMode</th>												
                                            <th style="width:300px">Amt Received</th>
                                            <th style="width:300px">Credits Used</th>
                                            <th style="width:300px">Total Amt</th>
                                            <th style="width:300px">Cheque Status</th>
                                            <th style="width:200px">Actions</th>
                                        </tr>
                                    </thead>										
                                    <tbody>
                                        <?php
                                        include("database/db_conection.php");//make connection here
                                        $sql = "SELECT p.*,v.supname
										FROM payments p, vendorprofile v where payment_vendor = v.vendorid
										ORDER BY p.payment_id DESC ";
                                        $result = mysqli_query($dbcon,$sql);
                                        if ($result->num_rows > 0){
                                            while ($row =$result-> fetch_assoc()){
                                                echo "<tr>";
                                                echo '<td style="display:none;">' .$row['id'] . '</td>';
                                                echo '<td>' .$row['payment_id'] . '</td>';
                                                echo '<td>'.$row['payment_date'].' </td>';
                                                echo '<td>'.$row['payment_bank'].' </td>';
                                                echo '<td>'.$row['payment_ref_no'].' </td>';
                                                echo '<td>'.$row['supname'].' </td>';
                                                echo '<td>'.$row['payment_invoice_no'].' </td>';
                                                echo '<td>'.$row['payment_mode'].' </td>';
                                                echo '<td>'.$row['payment_amount'].' </td>';
                                                echo '<td>'.$row['payment_credits_used'].' </td>';
                                                echo '<td>'.($row['payment_amount']+$row['payment_credits_used']).' </td>';
                                                echo '<td>'.$row['payment_cheque_status'].' </td>';
                                                echo '<td>
                                                        
                                                        <div class="dropdown">
          <button type="button" class="btn btn-light btn-xs dropdown-toggle" data-toggle="dropdown">
        
          </button>
          <div class="dropdown-menu">
          <a class="dropdown-item"
                                                     onclick="ToPrint(this);" data-img="assets/images/logo.png"
                                                      data-code="'.$row['payment_id'].'"  data-id="po_print">
                                                        <i class="fa fa-print" aria-hidden="true"></i> Print</a>
                                                        <a class="dropdown-item"
                                                        href="addVendorPayments.php?payment_id=' . $row['payment_id'] . '&action=edit&type=payments">
                                                           <i class="fa fa-pencil" aria-hidden="true"></i> Edit</a>
                                                           <a class="dropdown-item"
                                                           href="deleteVendorPayments.php?payment_id=' . $row['payment_id'] . '">
                                                              <i class="fa fa-trash" aria-hidden="true"></i> Delete</a>
          </div></div>
                                                        </td>
                                                      ';
                                                echo "</tr>";
                                            }
                                        }
                                        ?>						
                                   
                                    </tbody>
                                    <tfoot>
                                            <tr>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                </table>
                            </div>

                        </div>														
                    </div><!-- end card-->	
            
                </div>


                <script>

var table = $('#example1').DataTable( {
            lengthChange: false,
            "footerCallback": function ( row, data, start, end, display ) {
                var api = this.api(), data;
                var intVal = function ( i ) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
                };
                var grossval = api
                .column( 8)
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 ).toFixed(2);
                var grossval2 = api
                .column( 9 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 ).toFixed(2);

                var grossval3 = api
                .column( 10 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 ).toFixed(2);



                $( api.column( 5 ).footer() ).html('Total');
                $( api.column( 7 ).footer() ).html(grossval);
                $( api.column( 8 ).footer() ).html(grossval2);
                $( api.column( 9 ).footer() ).html(grossval3);
                //   $( api.column( 5 ).footer() ).html(taxamt);
                //   $( api.column( 7 ).footer() ).html(netval);
                //  $( api.column( 8 ).footer() ).html(bal);

            }

        });
                   //var table = $('#pmade').DataTable();
                   //console.log(table,"sss");
                   // table.order( [ 1, 'desc' ] ).draw();

                    function ToPrint(el){
                        var code= $(el).attr('data-code');
                        var template= $(el).attr('data-template');
                        window.location.href = 'assets/payment_print_html.php?payment_id='+code;
                     }
                </script>
                <?php include('footer.php'); ?>