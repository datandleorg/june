<?php include('header.php'); ?>
<!-- End Sidebar -->


<div class="content-page">



    <!-- Start content -->
    <div class="content">



        <div class="card-header">
            <h3><i class="fa fa-line-chart bigfonts" aria-hidden="true"></i><b> Reports List</b></h3>
</div>


<div class="container-fluid">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <td>
                                        <i class="fa fa-shopping-basket" aria-hidden="true"></i>&nbsp;Purchases & Expenses
                                    </td>
                                    <td class="text-left"><i class="fa fa-shopping-cart"></i>&nbsp;Sales
                                    </td>
                                    <td class="text-center"><i class="fa fa-truck smallfonts" aria-hidden="true"></i>&nbsp;Inventory</td>
                                    <td class="text-right"><i class="fa fa-th-large bigfonts" aria-hidden="true"></i>&nbsp;GENERAL
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- foreach ($order->lineItems as $line) or some such thing here -->
                                <tr>
                                    <td><a href="PurchaseOrderReports.php">
                                        <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Purchases by Vendor</a></td>
                                    <td class="text-left"><a  href="SalesOrderReports.php">
                                        <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Sales Order</a>
                                    </td>

                                    <td class="text-center"><a  href="StockInwardReports.php">
                                        <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Inventory(Inward) Stock Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="Raw Material Purchase Item Master/Stock Inward Report."></i>
                                    </td>

                                    <td class="text-right">  <a  href="listRecordPayments.php">
                                        <i class="fa fa-angle-right bigfonts" aria-hidden="true">&nbsp;</i>Payments Transactions </a>
                                        &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus"
										data-placement="top" title="Manual Payments Received Transactions Report."></i><br><br>
									 
									  <a href="listPettyCashConv.php"> <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;
									 Petty Cash Conversion Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" 
									 data-toggle="popover" data-trigger="focus" data-placement="top" title="As and when  amount is deposited into company's bank 
									 Report is generated."></i><br><br>
									 
									 
									</td>
									
                                </tr> 


                                <tr>
                                    <td>
                                       <a href="ExpensesReports.php"> <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Expenses Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="As and when Expense is recorded  Report is generated."></i>
                                    </td>      
                                    
                                    


                                    <td class="text-left">
                                        <!--a href="listInvoices.php">
<i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Sales by Sales Person</a-->
                                    </td>
<td class="text-center">
                                        <a href="StockOutwardReports.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Inventory(Outward) Stock Report</a>
                                    </td> 
                                    <!--td class="text-center">
                                        <a href="StockTransfersReports.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Stock Transfers(Inward to Locations) Report</a>
                                    </td-->                                                 

                                </tr>  
                                

                                <tr>
                                    <td> 
                                        
                                    </td>
                                    
                                    

                                    <td class="text-left">
                                        <!--a href="listExpenses.php">
<i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Expenses by Payee c</a-->
                                    </td>

                                    <!--td class="text-center">
                                        <a href="StockOutwardReports.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Inventory(Outward) Stock Report</a>&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="Sales Item Master/Stock Outward Report."></i>
                                    </td-->
                                </tr>
                                
                                <tr>
                                    <td> 
                                        
                                    </td>
                                    
                                    

                                    <td class="text-left">
                                        <!--a href="listExpenses.php">
<i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Expenses by Payee c</a-->
                                    </td>

                                    <td class="text-center">
                                        <a href="inventoryInwardLogReport.php">
                                             <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Inventory INWARD Log Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="As and when Inward qty is added or updated manually or through GRN, the transaction log report is generated."></i>
                                        
                                        
                                        
                                    </td>
                                    
                                   
                                </tr>
                                <tr>
                                    <td> 
                                        
                                    </td>
                                    
                                    

                                    <td class="text-left">
                                        <!--a href="listExpenses.php">
<i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Expenses by Payee c</a-->
                                    </td>

                                    <td class="text-center">
                                        <a href="inventAdjOutwardReport.php">
                                             <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Inventory(OUTWARD) Log Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="As and when Inward qty is added or updated manually or through GRN, the transaction log report is generated."></i>
                                    </td>
                                    
                                    <td class="text-left">
                                        <!--a href="listExpenses.php">
<i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Expenses by Payee c</a-->
                                    </td>                                   
                                    
                                    
                                   
                                </tr>
 
                                      <tr>
                                    <td> 
                                        
                                    </td> 
                                          
                                          <td class="text-left">
                                        <!--a href="listExpenses.php">
<i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Expenses by Payee c</a-->
                                    </td>

                                    <td class="text-center">
                                    <a href="VendorItemWise.php"> <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Vendor Wise (Inward) Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="As and when Inward qty is added through GRN, vendor wise Item purchased Report is generated."></i><br><br>
                                     </td>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel-body">
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-condensed">       
                                <thead>
                                    <tr>
                                        <td >
                                            <i class="fa fa-rupee bigfonts" aria-hidden="true"></i>&nbsp;Payables & Payments Made
                                        </td>


                                        <td class="text-left">
                                            <i class="fa fa-money bigfonts" aria-hidden="true"></i>&nbsp;Receivables & Received Payments
                                        </td>
										
										 <td class="text-right">
                                            <i class="fa fa-money bigfonts" aria-hidden="true"></i>&nbsp;Bank Accounts
                                        </td>
										
										
                                        <td class="text-left">
                                            &nbsp;&nbsp;&nbsp;</td>
                                        <td class="text-right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                                </thead>

                                <tbody>
                                    <!-- foreach ($order->lineItems as $line) or some such thing here -->
                                    <tr>
                                        <td><a href="VendorPayablesReports.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Vendor Balances Report
                                            </a>&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="Vendor/Supplier Payments Outstanding Report."></i>
                                        </td>

                                        <td>
                                            <a href="CustomerReceivablesReports.php">
                                                <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Customer Balances Report                                        
                                            </a>&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="Customer Outstanding Report."></i>
                                        </td>
										
										 <td>
                                            <a href="TransactionsReports.php">
                                                <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i>&nbsp;&nbsp;Bank Reconcilation Reports                                       
                                            </a>&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="The purpose of a bank reconciliation. A bank reconciliation is used to compare your records to those of your bank, to see if there are any differences between these two sets of records for your cash transactions. ... Thus, fraud detection is a key reason for completing a bank reconciliation.
											Bank reconciliation statement is generally prepared by the company accountant or the bookkeeper with the purpose to compare the bank's records with your own company records. It is done on monthly basis whenever bank statement arrives"></i>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td>
                                            <a href="VendorPaymentsReports.php">
                                                <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Payments Made Report</a>&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="Vendor/Suplier Payments Paid Report."></i>
                                            </a>
                                        </td>

                                        <td class="text-left">
                                            <a href="PaymentsRecievedReports.php">
                                                <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i>&nbsp;Sales By Customer </a>
                                        </td>
										
										
										
										<td class="text-left">
										<a href="BankDepositReports.php"> <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;
										 Bank Deposit Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" 
										 data-toggle="popover" data-trigger="focus" data-placement="top" title="As and when  amount is deposited into company's bank this 
										 Report is generated."></i>
                                       </td>



                                    </tr>

                                    <tr>
                                        <td><a href="listDebitNotes.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Debit Notes</td>

                                        <td class="text-left"><a href="listCreditNotes.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Credit Notes Deatils</a>
                                        </td>
										
										<td class="text-left">
                                           <a href="BankWithdrawelsReports.php"> <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;
									 Bank Withdrawels Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" 
									 data-toggle="popover" data-trigger="focus" data-placement="top" title="As and when  amount is Withdraw from company's bank account, this
									 Report is generated."></i>
                                        </td>
										
										
                                    </tr>

                                    <tr>
                                        <td><a href="VendorCreditsReports.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Vendor Credits
                                            History</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="Vendor Advance Credits Transaction History Report."></i></td>
                                        <td><a href="PaymentsRecievedReports.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Customer Payments Made</a>&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="Customer Payments Received Report."></i></td>
                                    </tr>

                                    <tr>
                                        <td><a href="listVendorRefunds.php">
                                            <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Refund History</td>
                                            
                                            <td>
                                            <a href="salesItemwiseReport.php">
                                                <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Customer/Item wise Sales Report                                        
                                            </a>&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="Customer Outstanding Report."></i><br><br>
<a href="SummaryReports.php"> <i class="fa fa-angle-right bigfonts" aria-hidden="true"></i> &nbsp;Collection Balance Summary Report</a> &nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" data-trigger="focus" data-placement="top" title="collection epenses bank deposit and cash on hand Report"></i><br>
                                                                         
									   </td>

                                    </tr>






                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>





        <?php include('footer.php'); ?>