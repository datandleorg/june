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
                        <h1 class="main-title float-left">Petty Cash Conversion list</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">List Petty Cash Conversion</li>
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


                      

                            <h3><i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i><b> Conversion list </b></h3>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-hover display">
                                    <thead>
                                        <tr>
                                            <th style="display:none;">Id#</th>												
                                            <th style="width:50px">Conversion Id#</th>												
                                            <th style="width:3000px">Amount</th>												
                                            <th style="width:200px">Remarks</th>
                                            <th style="width:200px">User</th>
                                            <th style="width:200px">Date#</th>
                                            <th style="width:200px">Actions</th>
                                        </tr>
                                    </thead>										
                                    <tbody>
                                        <?php
                                        include("database/db_conection.php");//make connection here
                                        $sql = "SELECT *
										FROM petty_cas_conv p ORDER BY p.conv_id DESC ";
                                        $result = mysqli_query($dbcon,$sql);
                                        if ($result->num_rows > 0){
                                            while ($row =$result-> fetch_assoc()){
                                                echo "<tr>";
                                                echo '<td style="display:none;">' .$row['id'] . '</td>';
                                                echo '<td>' .$row['conv_id'] . '</td>';
                                                echo '<td>'.$row['conv_amt'].' </td>';
                                                echo '<td>'.$row['conv_remarks'].' </td>';
                                                echo '<td>'.$row['handler'].' </td>';
                                                echo '<td>'.$row['conv_date'].' </td>';
                                                echo '<td></td>';
    
                                                echo "</tr>";
                                            }
                                        }
                                        ?>						
                                   
                                    </tbody>
                                </table>
                            </div>

                        </div>														
                    </div><!-- end card-->	
            
                </div>


                <script>
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