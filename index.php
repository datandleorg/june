<?php 
include('header.php');
include('workers/getters/functions.php');


$comprofile = findbyand($dbcon,$session_org,"comprofile","orgid")['values'][0];

function getpaymentstotal(){
    global $dbcon;
    $sql_q = "SELECT SUM(cust_payment_amount) as cust_payments from customer_payments ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    return $row['cust_payments']?$row['cust_payments']:0;

}

function getExpensestotal(){
    global $dbcon;
    $sql_q = "SELECT SUM(expense_total_amount) as totalexpense from expenses  ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    return $row['totalexpense']?$row['totalexpense']:0;

}

function getDepositstotal(){
    global $dbcon;
    $sql_q = "SELECT SUM(amount) as total_bankdeposits from bankdeposit ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    return $row['total_bankdeposits']?$row['total_bankdeposits']:0;

}

function getCashOnHand(){
     return getpaymentstotal()-getExpensestotal()-getDepositstotal();
}

function get_users_count(){
    global $dbcon;
    $sql_q = "select id from userprofile where status=1";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");
    return mysqli_num_rows($exc_q);
}
function get_po_count(){
    global $dbcon;
    $sql_q = "select id from purchaseorders where po_status='Created'";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");
    return mysqli_num_rows($exc_q);
}

function get_grn_count(){
    global $dbcon;
    $sql_q = "select id from grn_notes where grn_status='Recorded'";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");
    return mysqli_num_rows($exc_q);
}

function get_so_count(){
    global $dbcon;
    $sql_q = "select id from salesorders where so_status='Created'";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");
    return mysqli_num_rows($exc_q);
}

function get_inv_count(){
    global $dbcon;
    $sql_q = "select id from invoices where inv_payment_status='Unpaid'";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");
    return mysqli_num_rows($exc_q);
}

function get_payables(){
    global $dbcon;

    $sql_q = "select SUM(grn_balance) as payables from grn_notes where grn_payment_status!='Paid' and grn_status='Approved' ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    echo $row['payables']?$row['payables']:0;

}

function get_payables_overdue(){
    global $dbcon;

    $sql_q = "select SUM(grn_balance) as payables from grn_notes
where grn_payment_status!='Paid' and grn_status='Approved' and DATE_ADD(grn_date, INTERVAL grn_po_payterm DAY) < CURDATE()";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    echo $row['payables']?$row['payables']:0;

}

function get_recievables(){
    global $dbcon;
    $sql_q = "select SUM(inv_balance_amt) as recievables from invoices where inv_payment_status!='Paid' and inv_status='Approved' ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    echo $row['recievables']?$row['recievables']:0;
}

function get_recievables_overdue(){
    global $dbcon;
    $sql_q = "select SUM(inv_balance_amt) as recievables from invoices
where inv_payment_status!='Paid' and inv_status='Approved' and DATE_ADD(inv_date, INTERVAL inv_payterm DAY) < CURDATE()";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    echo $row['recievables']?$row['recievables']:0;
}

//function get_vendor_openbalance(){
//global $dbcon;
//$sql_q = "select sum(openbalance) from vendorprofile";
//$exc_q = mysqli_query($dbcon,$sql_q)or die("Error");
//	return array_sum($exc_q);
//}


?>
<!-- End Sidebar -->


<div class="content-page">

    <!-- Start content -->
    <div class="content">
        
        <div class="container-fluid">
					
						<div class="row">
									<div class="col-xl-12">
											<div class="breadcrumb-holder">
													<!--h1 class="main-title float-left">Dashboard</h1-->
											<!--img src="assets/images/avatars/logo.png" alt="Profile image" width="80" height="80" class="avatar-rounded"-->
											<!--img src="assets/images/avatars/logo.png" alt="Profile image" width="80" height="80" class="avatar-rounded"-->
											<!--img src="assets/images/avatars/dhirajLogo.jpg" alt="Profile image" width="180" height="60" -->    
                                                <img src="assets/images/avatars/logo.png" alt="Profile image" width="100" height="80">  
											<?php if(isset($_SESSION['login_email'])){ echo $_SESSION['login_email']; } ?>
                                                <font face="Hemi Head Rg" color="Apple Red">Logged In</font>
										   </div>
    
									</div>
						</div>
        

        <div class="container">
            <br/>
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body noradius noborder bg-default">
                            <h5 class="card-title lead text-center text-white">PO PENDING APPROVALS</h5>
                            <p class="m-b-20 text-white counter text-center text-white ">
                                <?php echo get_po_count();?>
                            </p>                          
                        </div>
                    </div>
                </div>
                
                
               

                
                
                
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body noradius noborder bg-warning">
                            <h5 class="card-title lead text-center text-white">GRN PENDING APPROVALS</h5>
                            <p class="m-b-20 text-white counter text-center text-white">
                                <?php echo get_grn_count();?>

                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <!--div class="card"-->
                        <div class="card-box noradius noborder bg-info">
                            <h5 class="card-title lead text-center text-white">SO PENDING APPROVALS</h5>
                            <p class="m-b-20 text-white counter text-center text-white">
                                <?php echo get_so_count();?>
                            </p>
                        </div>
                    <!--/div-->
                </div>

                <div class="col-md-3">
                        <div class="card-box noradius noborder bg-danger">
                            <h5 class="card-title lead text-center text-white">UNPAID INVOICES</h5>
                            <br/>
                            <p class="m-b-20 text-white counter text-center text-white">
                                <?php echo get_inv_count();?>
                            </p>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-6">

                    <!--div class="card"-->
                        <div class="card-box noradius noborder bg-info">
                            <div class="row">
                                <div class="col-md-6" style="border-right:1px solid #cccccc;">
                                    <h5 class="card-title lead text-center text-white">TOTAL RECIEVABLES</h5>
                                    <br/>
                                    <p class="card-text text-center text-muted">
                                        <span class="pull-right text-danger lead"><b>OVERDUE</b><br/>
                                             <b><span class="display-5 card-text text-center text-info"><?php echo get_recievables_overdue();?></span></b>
                                        </span>
                                       <b> <span class="m-b-20 text-white counter text-center text-white ">
                                            <?php
                                            echo get_recievables()." &#8377;";
                                            ?>
                                           </span> </b>


                                    </p>
                                </div>
                                <div class="col-md-5">
                                    <h5 class="card-title lead text-center text-white">TOTAL PAYABLES</h5>
                                    <br/>
                                    <p class="card-text text-center text-muted">
                                        <span class="pull-right text-danger lead"><b>OVERDUE</b><br/>
                                            <b><span class="display-5 card-text text-center text-info"><?php echo get_payables_overdue();?></span></b>
                                        </span>
                                       <b> <span class="m-b-20 text-white counter text-center text-white" >
                                            <?php
                                            echo get_payables()." &#8377;";
                                            ?>
                                        </span> </b></p>
                                </div>

                                <!--
<a href="#" class="btn btn-primary">Go somewhere</a>
-->
                            <!--/div-->
                        </div>

                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card-box noradius noborder bg-danger">
                            <!--h5 class="card-title lead text-center text-white">USERS</h5>
                            <br/>
                            <p class="m-b-20 text-white counter text-center text-white"><?php  print_r(get_users_count());?></p-->
							
							<h6 class="m-b-20 text-white counter">Users:&nbsp;&nbsp;</a><?php  print_r(get_users_count());?></p>
							<h6 class="m-b-20 text-white counter"><a href="listCustomerCredits.php">Customer Credits:&nbsp;&nbsp;</a><?php echo getpaymentstotal();?></h6>
							 <h6 class="m-b-20 text-white counter">Petty Cash:&nbsp;&nbsp;</a><?php echo $comprofile['petty_cash_bal'];?></h6>
							
                    </div>
                </div>
                
                <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
				    <div class="card-box noradius noborder bg-warning">
                    <h6 class="m-b-20 text-white counter">Income:&nbsp;&nbsp;</a><?php echo getpaymentstotal();?></h6>
                            <h6 class="m-b-20 text-white counter">Expenses:&nbsp;<?php echo getExpensestotal();?></h6>
                            <h6 class="m-b-20 text-white counter">Bank Deposit:&nbsp;<?php echo getDepositstotal();?></h6>
                            <h6 class="text-white">Undeposited Funds:&nbsp;<?php echo $comprofile['cash_on_hand'];?></h6>
				    </div>
				</div>
                
            </div>

        </div>

    </div>

        
        

    <?php include('footer.php');?>