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

//Expenses 
function getExpensestotal(){
    global $dbcon;
    $sql_q = "SELECT SUM(expense_total_amount) as totalexpense from expenses where expense_date = curdate()  ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    return $row['totalexpense']?$row['totalexpense']:0;

}
//SELECT SUM(amount) as total_bankdeposits from bankdeposit
function getDepositstotal(){
    global $dbcon;
    $sql_q = "SELECT SUM(amount) as total_bankdeposits from bankdeposit where depositdate = curdate() ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    return $row['total_bankdeposits']?$row['total_bankdeposits']:0;

}
//Bank Accounts
function getBankName(){
    global $dbcon;
    $sql_q = "select concat(bankname,':  ',closing_bal) as bankname from compbank where bankcode='BNK-1' ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    return $row['bankname']?$row['bankname']:0;

}
function getBankName2(){
    global $dbcon;
    $sql_q = "select concat(bankname,':  ',closing_bal) as bankname2 from compbank where bankcode='BNK-2' ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    return $row['bankname2']?$row['bankname2']:0;

}


//Bank Withdrawels
function getWithdrawelsTotal(){
    global $dbcon;
    $sql_q = "SELECT SUM(amount) as total_withdrawels from bankwithdrawels where withdraweldate = curdate() ";
    $exc_q = mysqli_query($dbcon,$sql_q)or die("Error");

    $row=mysqli_fetch_assoc($exc_q);
    return $row['total_withdrawels']?$row['total_withdrawels']:0;

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
                        <div class="card-box noradius noborder bg-success">
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
							
							<!--h6 class="m-b-20 text-white counter">Total Users:&nbsp;&nbsp;<?php  print_r(get_users_count());?></p-->
							<!--h6 class="m-b-20 text-white counter"><a href="listCustomerCredits.php">Customer Credits:&nbsp;&nbsp;</a><?php echo getpaymentstotal();?></h6-->
							 <h6 class="m-b-20 text-white counter">PETTY CASH:&nbsp;&nbsp;<h5 class="fa fa-rupee text-white counter">&nbsp;<b><?php echo $comprofile['petty_cash_bal'];?></h6>
							  <h6 class="m-b-20 text-white counter"><b>UNDEPOSITED FUNDS:&nbsp;&nbsp;</h6><h6 class="fa fa-rupee text-white counter">&nbsp;<b><b><?php echo $comprofile['cash_on_hand'];?></h6>
							
                    </div>
                </div>
				
               
                <div class="col-xs-12 col-md-12 col-lg-12 col-xl-12">
				    <div class="card-box noradius noborder bg-dark">
                  
                            <h6 class="m-b-20 text-white counter">EXPENSES&nbsp;<h5 class="fa fa-rupee text-white counter">&nbsp;<b><?php echo getExpensestotal();?><br><a href="ExpensesReports.php">View more..</a></h6>
				
                           <br>
						   
							 <h6 class="m-b-20 text-white counter">BANK WITHDRAWELS<h5 class="fa fa-rupee text-white counter">&nbsp;<b>&nbsp;<?php echo getWithdrawelsTotal();?></h6>
                           
				    </div>
				</div>
            </div>
		
			 
           <hr>
		   
			<div class="container">
             <br/>
            <?php 
            if($session_role==="Admin"){
            echo '
			
			<br/>
			<div class="row">
                <div class="col-md-6">
                    <div class="card">
                      <div class="card-box noradius noborder bg-purple">
                            <h5 class="card-title lead text-center text-white">BANK ACCOUNTS</h5>
							<h6 class="card-title lead text-left text-warning"><b>Bank Balances</h6>
                            <p class="card-title lead text-left text-white  ">
                             '. getBankName().'
                            </p>     
							<p class="card-title lead text-left text-white  ">
                                '. getBankName2().'
                            </p>       							
                        </div>
                    </div>
					
			</div> ';
			}?>
			
				
		
				 <div class="card">
				    <div class="card-box noradius noborder bg-danger">
					<h5 class="m-b-20 text-white text-left counter">SALES</h5><h5 class="card-title lead text-center text-white"><h5 class="fa fa-rupee text-left text-white counter">&nbsp;<b><?php echo getpaymentstotal();?><br><a href="PaymentsRecievedReports.php"><b>View more..</a></h6>
                    <br>
				    <h6 class="m-b-20 text-white text-left counter">BANK DEPOSITS<h5 class="fa fa-rupee text-white counter">&nbsp;<b><?php echo getDepositstotal();?></h6>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
    </div>
			
        
        

    <?php include('footer.php');?>