<?php include('header.php'); ?>
<!-- End Sidebar -->

<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">

            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Expenses list</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">List Expenses</li>
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
                                <a href="recordExpenses.php" class="btn btn-primary btn-sm"><i class="fa fa-user-plus" aria-hidden="true"></i>
                                    Add Expenses</a></span>

                            <h3><i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i>&nbsp;<b>Expenses List </b></h3>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-hover display" style="width: 100%;">
                                    <thead>
                                        <tr>								
											<th>Voucher#</th>
											<th>Date</th>
											<th>Payee</th>
                                            <th>Bill#</th>
											<th>Amount</th>
                                            <th>Recorded By</th>
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

                                        $sql = "SELECT * FROM expenses";
                                        $result = mysqli_query($dbcon,$sql);
                                        if ($result->num_rows > 0){
                                            while ($row =$result-> fetch_assoc()){
                                                echo "<tr>";                                                
                                                echo '<td>'.$row['expense_no'].' </td>';
                                                echo '<td>'.$row['expense_date'].' </td>';
                                                echo '<td>'.$row['expense_payee'].' </td>';
                                                echo '<td>'.$row['expense_invoice_no'].' </td>';
                                                echo '<td>'.$row['expense_total_amount'].' </td>';
                                                 echo '<td>'.$row['expense_handler'].' </td>';
                                        ?>


                                        <?php


                                                echo '<td>';

                                                echo '    <div class="dropdown">
  <button type="button" class="btn btn-light btn-xs dropdown-toggle" data-toggle="dropdown" style="width: 100%;">

  </button>

  <div class="dropdown-menu">

  <a class="dropdown-item"  href="recordExpenses.php?expense_no=' . $row['expense_no'] . '&action=edit&type=expenses">
  <i class="fa fa-pencil" aria-hidden="true"></i>&nbsp; Edit</a> 

    <a class="dropdown-item" onclick="ToPrint(this);" data-template="expenses_print"
     data-code="'.$row['expense_no'].'" data-img="assets/images/logo.png"  data-id="po_print">
     <i class="fa fa-print" aria-hidden="true"></i>&nbsp; Print</a>

     <a class="dropdown-item" onclick="deleteRecord_8(this);" 
     data-code="'.$row['expense_no'].'" >
     <i class="fa fa-trash" aria-hidden="true"></i>&nbsp; Delete</a>';

                                                echo ' </td>';
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

                    function ToPrint(el){
                        var code= $(el).attr('data-code');
                        window.location.href = 'assets/expenses_print_html.php?expense_no='+code;
                    }

                    function printContent(el){
                        var id= $(el).attr('data-id');
                        var code= $(el).attr('data-code');
                        var img= $(el).attr('data-img');
                        var template = $(el).attr('data-template');
                        get_print_html(code,img,template);

                        window.onbeforeprint = beforePrint;
                        window.onafterprint = afterPrint;
                        var restorepage = $('body').html();
                        var printcontent = $('#' + id).clone();
                        $('body').empty().html(printcontent);
                        window.print();
                        $('body').html(restorepage);
                    }

                    function deleteRecord_8(x)
                    {
                        var RecordId = $(x).attr('data-code');
                        if (confirm('Confirm delete')) {
                            window.location.href = 'deleteExpenses.php?id='+RecordId;
                        }
                    }
                </script>
                <?php include('footer.php'); ?>