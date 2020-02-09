
<?php include('header.php');?>
<!-- End Sidebar -->
<!-- Button trigger modal -->



<div class="content-page" ng-app="paymentPages" ng-controller="formCtrl" ng-init="formInit()">
    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">


            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Customer Payments</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">Customer Payments</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!-- end row -->


            <!--div class="alert alert-success" role="alert">
<h4 class="alert-heading">Company Registrtion Form</h4>
<p></a></p>
</div-->


            <div class="row" >					
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">					
                    <div class="card mb-3">
                        <div class="card-header">
                            <!--h3><i class="fa fa-check-square-o"></i>Create Company </h3-->

                            <h3>
                                <i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i> Customer Payments
                            </h3>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-8">

                                    <!--form autocomplete="off" action="#"-->
                                    <form ng-submit="makePayment()" >

                                        <div class="form-row">
                                            <div class="form-group col-md-8" ng-if="!editMode" >

                                                <label for="inputState">Customer Name<span class="text-danger">*</span></label>
                                                <select required id="cust_payment_customer" ng-model="cp.cust_payment_customer"
                                                    ng-change="onCustomerChange()" class="form-control form-control-sm"
                                                    name="cust_payment_customer">
                                                    <option value="">--Select Customer--</option>
                                                    <?php
                                                    $sql = "SELECT * FROM customerprofile ";
                                                    $result = mysqli_query($dbcon, $sql);
                                                    while ($row = $result->fetch_assoc()) {
                                                        $custid = $row['custid'];
                                                        $custname = $row['custname'];
                                                        echo '<option  value="' . $custid . '" >' . $custname . '</option>';
                                                    }
                                                    ?>
                                                </select>

                                            </div>
                                            <div class="form-group col-md-8" ng-if="editMode" >
                                                <p><b>Customer:</b></p>
                                                <p>{{customerProfile.custname}}</p>
                                            </div>
                                        </div>


                                        <div class="form-row">


                                            <div class="form-group col-md-4">
                                                <label for="inputState">Invoice#</label>
                         
                                                <select ng-model="cp.cust_payment_invoice_no" ng-change="onInvoiceChange()"  class="select2 form-control">
                                                       <option selected value="">Select Invoice</option>
                                                       <option ng-repeat="invoice in invoices">{{invoice.inv_code}}</option>
                                                </select>

                                            </div>

                                            <div class="form-group col-md-4">										
                                                <label>Enter Amount <span class="text-danger">*&nbsp;</span><i class="fa fa-rupee fonts" aria-hidden="true"></i>&nbsp;[INR]</label>
                                                <input 
                                                ng-model="cp.cust_payment_amount"
                                                type="text" class="form-control form-control-sm" 
                                                name="cust_payment_amount" id="cust_payment_amount" 
                                                placeholder="Enter Amount" required class="form-control" 
                                                autocomplete="off" value="0" />
                                            </div>
                                        
                                        </div>

                                        <div class="form-row" ng-if="showCreditInput">

                                            <div class="form-group col-md-4">
                                                <label for="inputState">Total Amount</label>
                                                <p id="total_amount">{{+cp.cust_payment_credits_used+(+cp.cust_payment_amount)}}</p>
                                            </div>

                                            <div class="form-group col-md-4">										
                                                <label>Enter Credit Amount <span class="text-danger">*&nbsp;</span><i class="fa fa-rupee fonts" aria-hidden="true"></i>&nbsp;[INR]</label>
                                                <input 
                                                ng-model="cp.cust_payment_credits_used"
                                                type="text" class="form-control form-control-sm" id="cust_payment_credits_used" 
                                                placeholder="Enter Credit Amount" class="form-control" autocomplete="off" />
                                            </div>
                        
                                        </div>


                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label>Payment Date <span class="text-danger">*</span></label>									 
                                                <input type="date" 
                                                class="form-control form-control-sm"
                                                ng-model="cp.cust_payment_date"
                                                name="cust_payment_date">
			  
                                            </div>

                                            <div class="form-group col-md-4">
                                                <div ng-if="!editMode">
                                                    <label >Payment Mode<span class="text-danger">*</span></label>
                                                    <select 
                                                    required id="payment_mode" 
                                                    data-parsley-trigger="change"
                                                    ng-model="cp.cust_payment_mode"
                                                    ng-change="onPaymentModeChange()"  
                                                    class="form-control form-control-sm"  name="cust_payment_mode" >
                                                        <option value="">-- Select Payment Mode --</option>
                                                        <option value="Cash">Cash</option>
                                                        <option value="Cheque">Cheque</option>
                                                        <option value="Bank Transfer">Bank Transfer</option>
                                                    </select>
                                                  
                                            </div>
                                            <div class="form-group col-md-8" ng-if="editMode" >
                                                    <p><b>Payment Mode:</b></p>
                                                    <p>{{cp.cust_payment_mode}}</p>
                                                </div>
                                        </div>
                                        </div>

                                        
                                        <div class="form-row" ng-if="cp.cust_payment_mode==='Cheque'">
                                            <div class="form-group col-md-6">
                                                <label>Cheque Status<span class="text-danger">*</span></label>
                                                <select required name="cust_payment_cheque_status" id="cust_payment_cheque_status" 
                                                ng-model="cp.cust_payment_cheque_status"
                                                data-parsley-trigger="change" class="form-control form-control-sm select2">
                                                    <option value="">-- Select Cheque Status --</option>
                                                    <option value="Cleared">Cleared</option>
                                                    <option value="Uncleared">Uncleared</option>
                                                </select>
                                            </div>
                                         </div>



                                <div class="form-row" ng-if="cp.cust_payment_mode!=='Cash' && cp.cust_payment_mode!==''">
                                    <div class="form-group col-sm-6">
                                        <label> Bank<span class="text-danger">*</span></label>
                                        <select id="cust_payment_bank" class="select2 form-control form-control-sm " 
                                        ng-model="cp.cust_payment_bank"
                                        ng-change="onBankChange()"
                                        name="cust_payment_bank">
                                            <option value="">--Select Bank--</option> ';
                                            <?php
                                                $sql = "SELECT * FROM compbank where orgid='COMP001' ";
                                                $result = mysqli_query($dbcon, $sql);
                                                while ($row = $result->fetch_assoc()) {
                                                    $bankid = $row['id'];
                                                    $bankname = $row['bankname'];
                                                    echo '<option  value="' . $bankid . '" >' . $bankname . '</option>';
                                                }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                           
                                <div class="form-row" ng-if="selectedBank">
                                    <div class="form-group col-md-6"
                                        ng-if="cp.cust_payment_bank!=='' && (cp.cust_payment_mode=='Bank Transfer' || cp.cust_payment_mode=='Cheque')">
                                        <p>Bank Details</p>
                                        <p><b>{{selectedBank.bankname}}</b><br />
                                            {{selectedBank.acctname}}<br />
                                            {{selectedBank.acctno}}<br />
                                            {{selectedBank.acctype}}<br />
                                            {{selectedBank.branch}}<br />
                                            {{selectedBank.ifsc}}<br />
                                        </p>
                                    </div>
                                </div>



                                        <div class="form-row">								
                                            <div class="form-group col-md-8">										
                                                <label>Reference #</label>
                                                <input type="text" class="form-control form-control-sm" 
                                                name="cust_payment_ref_no" id="cust_payment_ref_no" 
                                                ng-model="cp.cust_payment_ref_no"
                                                placeholder=" Reference Number(optional)"  class="form-control" autocomplete="off" />
                                            </div>
                                        </div>

                      

                                        <div class="form-row">
                                            <div class="form-group col-md-8">
                                                <label for="inputState">Handler</label>

                                                <input type="text" class="form-control form-control-sm" name="cust_payment_user"
                                                ng-model="cp.cust_payment_user"
                                                id="cust_payment_user" readonly class="form-control form-control-sm" 
                                                value="<?php echo $session_user; ?>" required />

                                            </div>
                                        </div>



                                        <div class="form-row">
                                            <div class="form-group col-md-8">
                                                <label>Add Notes</label>
                                                <textarea rows="2" 
                                                ng-model="cp.cust_payment_notes" 
                                                class="form-control editor" id="cust_payment_notes" name="cust_payment_notes" placeholder="Internal Notes"></textarea>
                                            </div> 
                                        </div>

                                        


                                        <div class="form-row">
                                            <div class="col-md-12 col-md-offset-12">
                                                <input type="checkbox" ng-model="cp.cust_payment_notify"  id="cust_payment_notify" name="paymentemail" value="payment_email">
                                                <label for="subscribeNews">Send a Payment Made email notification to Vendor</label>									
                                            </div>
                                        </div><br/>


                                        
                                        


                                        <div class="form-row">
                                            <div class="form-group text-right m-b-12">
                                                <input type="hidden"  >
                                                &nbsp;<button id="submit-form" class="btn btn-primary" name="submit" type="submit">
                                                Submit
                                                </button>

                                                <button id="cancel-form" type="" name="cancel" class="btn btn-secondary m-l-5">
                                                    Cancel
                                                </button>
                                            </div>
                                            <div>

                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-md-4">
                                    <!--grn details-->
                                    <h4>Invoice Details</h4>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <p><b>INVOICE NO # :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="text_grn_id">{{inv_values.inv_code}}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <p><b>SO # :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="text_po_code">{{inv_values.inv_po_code !=="" ? inv_values.inv_po_code : "-"}}</p>
                                        </div>
                                    </div>
   
                                    <div class="row">
                                        <div class="col-md-7">
                                            <p><b>Amount Paid :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="text_amount_paid">{{+inv_values.inv_value  - +inv_values.inv_balance_amt}} </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <p><b>Amount Payable :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="text_balance">{{inv_values.inv_balance_amt}}</p>
                                        </div>
                                    </div>
                                    <div class="row" id="credit_balance_div" ng-if="showCreditInput">
                                        <div class="col-md-7">
                                            <p><b>Available Credits :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="credit_balance">
                                            {{customerProfile.cust_credit_bal}}
                                            </p>
                                        </div>
                                    </div>
         
                                </div>
                            </div>


                        </div>



                    </div>
                </div>
                <!-- END container-fluid -->
            </div>
            <!-- END content -->
        </div>
        <!-- BEGIN Java Script for this page -->
        <script>
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            

        var page_action = "<?php if(isset($_GET['action'])){ echo $_GET['action']; } ?>";
        var page_table = "<?php if(isset($_GET['type'])){ echo $_GET['type']; } ?>";
        var page_customer = "<?php if(isset($_GET['custid'])){ echo $_GET['custid']; } ?>";
        var page_payment_invoice_no = "<?php if(isset($_GET['inv_code'])){ echo $_GET['inv_code']; } ?>";
        var page_payment_id = "<?php if(isset($_GET['cust_payment_id'])){ echo $_GET['cust_payment_id']; } ?>";

 
        var error = false;
        var app = angular.module('paymentPages', []);


        app.config( [ '$locationProvider', function( $locationProvider ) {
        // In order to get the query string from the
        // $location object, it must be in HTML5 mode.
        $locationProvider.html5Mode({
                enabled: true,
                requireBase: false
            })
        }]);

        app.controller('formCtrl', function ($scope, $http,$location) {
   
            $scope.formInit = () =>{
         
         
                $scope.invoices =[];
                $scope.cp = {
                    cust_payment_customer: "",
                    cust_payment_invoice_no: "",
                    cust_payment_amount: "",
                    cust_payment_credits_used: "",
                    cust_payment_date: new Date(),
                    cust_payment_mode: "",
                    cust_payment_cheque_status: "",
                    cust_payment_bank: "",
                    cust_payment_ref_no: "",
                    cust_payment_user: "<?php echo $session_user; ?>",
                    cust_payment_notes: "",
                    cust_payment_notify: false
                };

            $scope.creditAmtValidation = true;
            $scope.showCreditInput = true; 
            $scope.editMode = false;

                if (page_action === "edit") {
                   
                    $scope.payment_data = Page.get_edit_vals(page_payment_id, "customer_payments", "cust_payment_id");
                    let {id, payment_id, ...rest } =  $scope.payment_data;               
                    $scope.cp = rest;
                    $scope.cp.cust_payment_date = new Date($scope.cp.cust_payment_date);
                    $scope.onCustomerChange();
                    $scope.onInvoiceChange();

                    if($scope.payment_data.cust_payment_credits_used!==""){
                        $scope.showCreditInput = true;                        
                        $scope.cp.cust_payment_credits_used = $scope.payment_data.cust_payment_credits_used;
                    }
 
                     $scope.editMode = true;
                    //console.log($scope.editMode);
                }else{
                    $scope.cp.cust_payment_customer = page_customer!=="" ? page_customer :"";
                    $scope.onCustomerChange();
                    $scope.cp.cust_payment_invoice_no = page_payment_invoice_no!=="" ? page_payment_invoice_no :"";
                    $scope.onInvoiceChange();

                }


               // $scope.v_credits_id = $location.search()['v_credits_id'];


                // if($scope.v_credits_id && $scope.v_credits_id!==""){ 
                //     $scope.page_action = $location.search()['action'];
                //     $scope.page_customer = $location.search()['vendorid'];
                //     $scope.page_payment_invoice_no = $location.search()['invoice_no'];

                //     if($scope.page_action==="add"){
                //         $scope.showCreditInput = true;                        
                //         $scope.vp.payment_vendor = $scope.page_customer;
                //         $scope.vp.payment_invoice_no = $scope.page_payment_invoice_no;


                //         $scope.creditData = Page.get_edit_vals($scope.v_credits_id, "vendorcredits", "v_credits_id");
                //         $scope.vp.payment_credits_used = $scope.creditData.v_credits_availcredits;
                //         $scope.onVendorChange();
                //         $scope.onInvoiceChange();
                //     }
                // }

            
            }



            $scope.onPaymentModeChange = () => {
               // let comprofile = Page.get_edit_vals('<?php echo $session_org;?>', "comprofile", "orgid");
               // $scope.comprofile = comprofile;
            }

            $scope.getCompanyDetails = () => {
                let comprofile = Page.get_edit_vals('<?php echo $session_org;?>', "comprofile", "orgid");
                $scope.comprofile = comprofile;
            }


            $scope.onBankChange = () => {
                let selectedBank = Page.get_edit_vals($scope.cp.cust_payment_bank, "compbank", "id");
                $scope.selectedBank = selectedBank;
            }

            $scope.onCustomerChange = () => {
                let customerProfile = Page.get_edit_vals($scope.cp.cust_payment_customer, "customerprofile",
                    "custid");
                $scope.customerProfile = customerProfile;

                var data = $.param({
                    cust_payment_customer: customerProfile.custid
                });
        
                $http.post("workers/getters/get_invoices.php",data,config)
                .then(function(response) {
                    if(response.data.status){
                        $scope.invoices = response.data.values;
                    }
                });
            }

            $scope.onInvoiceChange = () =>{
                console.log($scope.cp);
                let inv_values = Page.get_edit_vals($scope.cp.cust_payment_invoice_no,'invoices','inv_code');
                $scope.inv_values = inv_values;
            }

            $scope.onCreditChange = () => {
                if ($scope.vc.v_credits_paymentmode === "Cash") {
                     $scope.creditAmtValidation = +$scope.vc.v_credits_amount > +$scope.comprofile
                        .petty_cash_bal ? false : true;
        
                        
                } else {
                    $scope.creditAmtValidation = +$scope.vp.payment_amount > +$scope.selectedBank
                        .closing_bal ? false : true;
                }

                error = !$scope.creditAmtValidation;
            }

            $scope.reqTransform = (obj) =>{
                var str = [];
                for(var p in obj)
                str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            }



            $scope.makePayment = () =>{

                $scope.table = "customer_payments";
                $scope.cp.cust_payment_invoice_no = $('#text_grn_id').text();
                $scope.cp.cust_payment_so_code = $('#text_po_code').text();

                var decision = confirm("confirm Payment");
                
                if (decision===false) {
                    return false;
                } 

                var total_amt = 0;
                    total_amt = +$scope.cp.cust_payment_amount + +    $scope.cp.cust_payment_credits_used;
                
                if(+$scope.inv_values.inv_balance_amt < +total_amt){
                    alert('Total Payment cannot be greater than Payable Amount ');
                    return false;
                }

                let obj = {
                        array : JSON.stringify({...$scope.cp}),
                        cust_payment_id:page_payment_id,
                        cust_payment_invoice_no:$scope.cp.cust_payment_invoice_no,
                        total_amount:total_amt,
                        action:page_action!==""?page_action:"add",
                        table:"customer_payments",
                        compId:`<?php echo $session_org?$session_org:'';?>`,
                        handler:`<?php echo $session_user?$session_user:'';?>`
                }

                $http({
                        method: 'POST',
                        url: "workers/setters/save_customer_payments.php",
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                        transformRequest: function(obj) {
                           return $scope.reqTransform(obj);
                        },
                        data: obj
                    }) .then(function(response) {
                    if(response.data.status){
                        location.href="listInvoices.php";
                    }else{
                        alert(response.data.message);
                    }
                    
                });
   
            }
        });

        // $(function(){
        //     var vendor_params =[];
        //     Page.load_select_options('payment_vendor',vendor_params,'vendorprofile','Vendor Code','vendorid','supname'); 

        //     if(page_action=="add"&&page_payment_invoice_no){
        //         $('#payment_vendor').val(page_customer);
        //         onvendor_select(page_customer);
        //         $('#payment_invoice_no').val(page_payment_invoice_no);
        //         oninvoice_select(page_payment_invoice_no);

        //     }

        // });

//         function printBankDetails(bankid) {
//             if (bankid != '') {
//                 var bank_data = Page.get_edit_vals(bankid, "compbank", "id");
//                 var bank_div = '';
//                 bank_div += '<h6>Bank Details</h6>';
//                 bank_div += '<p>';
//                 bank_div += '<b>' + bank_data.bankname + '</b><br/>';
//                 bank_div += bank_data.acctname + '<br/>';
//                 bank_div += bank_data.acctno + '<br/>';
//                 bank_div += bank_data.acctype + '<br/>';
//                 bank_div += bank_data.branch + '<br/>';
//                 bank_div += bank_data.ifsc + '<br/>';
//                 bank_div += '</p>';
//                 $('#vendor_bank_details').html(bank_div);
//             } else {
//                 $('#vendor_bank_details').html('');

//             }
//         }

//         function modifyRefNoField(modeOfPayment){
//                 console.log(modeOfPayment);
                
//                 if (modeOfPayment === "Bank Transfer") {
//                     $('#payment_bank_row').show();
//                     $('#payment_cheque_status_row').hide();
//                     $('#vendor_bank_details').show();
                    
//                 } else {
//                     $('#payment_bank_row').hide();
//                     $('#vendor_bank_details').hide();

//                 }

//                 if (modeOfPayment === "Cheque") {
//                     $('#payment_bank_row').show();
//                     $('#payment_cheque_status_row').show();
//                     $('#vendor_bank_details').show();
                    
//                 } else {
//                     $('#payment_bank_row').hide();
//                     $('#vendor_bank_details').hide();
//                     $('#payment_cheque_status_row').hide();

//                 }

//                 if(modeOfPayment!=="Cash"){
//                     $('#payment_ref_no').attr("required",true);
//                 }else{
//                     $('#payment_ref_no').attr("required",false);
//                 }

//                 if(modeOfPayment=="Cash"){
//                     var comprofile = Page.get_edit_vals("COMP001", "comprofile", "orgid");
//                     $("#petty_cash_bal").html(comprofile.petty_cash_bal);
//                 }
// }

//         function onvendor_select(val){

//                 $.ajax ({
//                     url: 'workers/getters/get_invoices.php',
//                     type: 'post',
//                     async:false,
//                     data: {payment_vendor:val},
//                     dataType: 'json',
//                     success:function(response){
//                         Page.plant("payment_invoice_no",response.status,response.values,"grn_invoice_no",null,null,"Invoices");

//                     }


//                 });

//                 if(page_payment_v_credits_id!=''){
//                     var credits_data = Page.get_edit_vals(page_payment_v_credits_id,'vendorcredits','v_credits_id');

//                     $('#credit_balance').text(credits_data.v_credits_availcredits);   
//                     $('#credit_balance_div').show();   
//                     if(credits_data.v_credits_availcredits>0){
//                         show_credits_input();
//                         $('#show_credit_div').show();
//                         $('#payment_amount_credit').val(credits_data.v_credits_availcredits); 
//                         show_credits_input();
//                     }
//                 }


//         }

            // function show_credits_input(){
            //     var amount = $('#payment_amount').val()?$('#payment_amount').val():0;
            //     var credit = $('#payment_amount_credit').val()?$('#payment_amount_credit').val():0;
            //     var curr_total_amt = eval(credit)+eval(amount);
            //     $('#total_amount').text(curr_total_amt);

            // }

            // function oninvoice_select(val){

            //     var grn_data = get_grn_values(val);
            //     $('#text_grn_id').text(grn_data.grn_id);
            //     $('#text_po_code').text(grn_data.grn_po_code);
            //     $('#text_amount_payable').text(grn_data.grn_po_value); 
            //     $('#text_amount_paid').text(eval(grn_data.grn_po_value)-eval(grn_data.grn_balance)); 
            //     $('#text_balance').text(grn_data.grn_balance); 

            // }


            // function get_form_values(code){
            //     var edit_data = Page.get_edit_vals(code,'payments','payment_id');
            //     return edit_data;
            // }

            // function get_grn_values(code){
            //     var edit_data = Page.get_edit_vals(code,'grn_notes','grn_invoice_no');
            //     return edit_data;
            // }

            // function getFormData($form){
            //     var unindexed_array = $form.serializeArray();
            //     var indexed_array = {};

            //     $.map(unindexed_array, function(n, i){

            //         if(n['name']=="id"||n['payment_amount_credit']){

            //         }else{
            //             indexed_array[n['name']] = n['value'];

            //         }
            //     });

            //     return indexed_array;
            // }


            $("#cancel-form").click(function(){
                location.href="listPaymentsMade.php";
            });

            // $("form#add_payment_form").submit(function(e){
            //     e.preventDefault();

            //     var $form = $(this);
            //     var data = getFormData($form);

            //     var payable_amount = eval($('#text_balance').text());

            //     if(page_payment_v_credits_id!=''){
            //         var amount = $('#payment_amount').val()?$('#payment_amount').val():0;
            //         var credit = $('#payment_amount_credit').val()?$('#payment_amount_credit').val():0;
            //         var curr_total_amt = eval(credit)+eval(amount);
            //         $('#total_amount').text(curr_total_amt);
            //         data.payment_credits_used = credit;
            //         data.payment_amount = curr_total_amt;

            //         var availabe_credit = eval($('#credit_balance').text());
            //         if(eval(data.payment_amount)>payable_amount){
            //             alert('Total Payment cannot be greater than Payable Amount ');
            //             $('#submit-form').show();
            //             $('#cancel-form').show();

            //             return false;
            //         }

            //         if(credit>availabe_credit){
            //             alert('You are above your credit balance ');
            //             $('#submit-form').show();
            //             $('#cancel-form').show();

            //             return false;
            //         }
            //     }

            //     if(eval(data.payment_amount)>payable_amount){
            //         alert('Total Payment cannot be greater than Payable Amount ');
            //         $('#submit-form').show();
            //         $('#cancel-form').show();

            //         return false;
            //     }

            //     data.table = "payments";
            //     data.payment_grn_id = $('#text_grn_id').text();
            //     data.payment_po_code = $('#text_po_code').text();

            //     $.ajax ({
            //         url: 'workers/setters/save_payments.php',
            //         type: 'post',
            //         data: {
            //             array : JSON.stringify(data),
            //             payment_id:"",
            //             payment_grn_id:data.payment_grn_id,
            //             payment_amount:data.payment_amount,
            //             action:"add",table:"payments",
            //             page_payment_v_credits_id:page_payment_v_credits_id,
            //             compId:`<?php echo $session_org?$session_org:'';?>`,
            //             handler:`<?php echo $session_user?$session_user:'';?>`
            //         },
            //         dataType: 'json',
            //         success:function(response){
            //             if(response.status){
            //                // location.href="listGoodsReceiptNote.php";
            //             }
            //         }


            //     });

            // });
        </script>

        <?php include('footer.php');?>

