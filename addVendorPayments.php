
<?php include('header.php');?>
<!-- End Sidebar -->
<!-- Button trigger modal -->



<div class="content-page" ng-app="paymentPages" ng-controller="formCtrl" ng-init="formInit()">

<?php include('addPettyCashConv.php');?> 

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">


            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Vendor Payments</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">Vendor Payments</li>
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
                                <i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i> Vendor Payments
                            </h3>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-8">

                                    <!--form autocomplete="off" action="#"-->
                                    <form ng-submit="makePayment()" >

                                        <div class="form-row">
                                            <div class="form-group col-md-8" >

                                                <label for="inputState">Vendor Name<span class="text-danger">*</span></label>
                                                <select required id="payment_vendor" ng-model="vp.payment_vendor"
                                                    ng-change="onVendorChange()" class="form-control form-control-sm"
                                                    name="payment_vendor">
                                                    <option value="">--Select Vendor Code--</option>
                                                    <?php
                                                    $sql = "SELECT * FROM vendorprofile ";
                                                    $result = mysqli_query($dbcon, $sql);
                                                    while ($row = $result->fetch_assoc()) {
                                                        $vendorid = $row['vendorid'];
                                                        $supname = $row['supname'];
                                                        echo '<option  value="' . $vendorid . '" >' . $supname . '</option>';
                                                    }
                                                    ?>
                                                </select>

                                            </div>
                                        </div>


                                        <div class="form-row">


                                            <div class="form-group col-md-4">
                                                <label for="inputState">Invoice#</label>
                         
                                                <select ng-model="vp.payment_invoice_no" ng-change="onInvoiceChange()"  class="select2 form-control">
                                                       <option selected value="">Select Invoice</option>
                                                       <option ng-repeat="invoice in invoices">{{invoice.grn_invoice_no}}</option>
                                                </select>

                                            </div>

                                            <div class="form-group col-md-4">										
                                                <label>Enter Amount <span class="text-danger">*&nbsp;</span><i class="fa fa-rupee fonts" aria-hidden="true"></i>&nbsp;[INR]</label>
                                                <input 
                                                ng-model="vp.payment_amount"
                                                ng-change="show_credits_input()"
                                                type="text" class="form-control form-control-sm" 
                                                name="payment_amount" id="payment_amount" 
                                                placeholder="Enter Amount" required class="form-control" 
                                                autocomplete="off" value="0" />
                                            </div>
                                        
                                        </div>

                                        <div class="form-row" ng-if="showCreditInput">

                                            <div class="form-group col-md-4">
                                                <label for="inputState">Total Amount</label>
                                                <p id="total_amount">{{+vp.payment_credits_used+(+vp.payment_amount)}}</p>
                                            </div>

                                            <div class="form-group col-md-4">										
                                                <label>Enter Credit Amount <span class="text-danger">*&nbsp;</span><i class="fa fa-rupee fonts" aria-hidden="true"></i>&nbsp;[INR]</label>
                                                <input 
                                                ng-model="vp.payment_credits_used"
                                                type="text" class="form-control form-control-sm" id="payment_credits_used" 
                                                placeholder="Enter Credit Amount" class="form-control" autocomplete="off" />
                                            </div>
                        
                                        </div>


                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label>Payment Date<span class="text-danger">*</span></label>									 
                                                <input type="date" 
                                                class="form-control form-control-sm"
                                                ng-model="vp.payment_date"
                                                name="payment_date">
			  
                                            </div>

                                            <div class="form-group col-md-4">
                                                <label >Payment Mode<span class="text-danger">*</span></label>
                                                <select 
                                                required id="payment_mode" 
                                                data-parsley-trigger="change"
                                                ng-model="vp.payment_mode"
                                                ng-change="onPaymentModeChange()"  
                                                class="form-control form-control-sm"  name="payment_mode" >
                                                    <option value="">-- Select Payment Mode --</option>
                                                    <option value="Cash">Cash</option>
                                                    <option value="Cheque">Cheque</option>
                                                    <option value="Bank Transfer">Bank Transfer</option>
                                                </select>
                                                <p ng-if="vp.payment_mode==='Cash'">Petty Cash Balance:<span id="petty_cash_bal">{{comprofile.petty_cash_bal}}</span>  &nbsp;<span class="fa fa-exchange mr-2 text-primary" data-toggle="modal" data-target="#pettyCashConvModal" title="Convert To petty cash" ng-click="onConv()"></span> </p>
                                            </div>
                                        </div>
                        
                                        
                                        <div class="form-row" ng-if="vp.payment_mode==='Cheque'">
                                            <div class="form-group col-md-6">
                                                <label>Cheque Status<span class="text-danger">*</span></label>
                                                <select required name="payment_cheque_status" id="payment_cheque_status" 
                                                ng-model="vp.payment_cheque_status"
                                                data-parsley-trigger="change" class="form-control form-control-sm select2">
                                                    <option value="">-- Select Cheque Status --</option>
                                                    <option value="Cleared">Cleared</option>
                                                    <option value="Uncleared">Uncleared</option>
                                                </select>
                                            </div>
                                         </div>
                                         



                                <div class="form-row" ng-if="vp.payment_mode!=='Cash' && vp.payment_mode!==''">
                                    <div class="form-group col-sm-6">
                                        <label> Bank<span class="text-danger">*</span></label>
                                        <select id="payment_bank" class="select2 form-control form-control-sm " 
                                        ng-model="vp.payment_bank"
                                        ng-change="onBankChange()"
                                        name="payment_bank">
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
                                        ng-if="vp.payment_bank!=='' && (vp.payment_mode=='Bank Transfer' || vp.payment_mode=='Cheque')">
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
                                                name="payment_ref_no" id="payment_ref_no" 
                                                ng-model="vp.payment_ref_no"
                                                placeholder=" Reference Number(optional)"  class="form-control" autocomplete="off" />
                                            </div>
                                        </div>

                      

                                        <div class="form-row">
                                            <div class="form-group col-md-8">
                                                <label for="inputState">Handler</label>

                                                <input type="text" class="form-control form-control-sm" name="payment_user"
                                                ng-model="vp.payment_user"
                                                id="payment_user" readonly class="form-control form-control-sm" 
                                                value="<?php echo $session_user; ?>" required />

                                            </div>
                                        </div>



                                        <div class="form-row">
                                            <div class="form-group col-md-8">
                                                <label>Add Notes</label>
                                                <textarea rows="2" 
                                                ng-model="vp.payment_notes" 
                                                class="form-control editor" id="payment_notes" name="payment_notes" placeholder="Internal Notes"></textarea>
                                            </div> 
                                        </div>

                                        


                                        <div class="form-row">
                                            <div class="col-md-12 col-md-offset-12">
                                                <input type="checkbox" ng-model="vp.payment_notify"  id="payment_notify" name="paymentemail" value="payment_email">
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
                                    <h4>Bill Details</h4>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <p><b>GRN # :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="text_grn_id">{{grn_values.grn_id}}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <p><b>PO # :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="text_po_code">{{grn_values.grn_po_code !=="" ? grn_values.grn_po_code : "-"}}</p>
                                        </div>
                                    </div>
   
                                    <div class="row">
                                        <div class="col-md-7">
                                            <p><b>Amount Paid :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="text_amount_paid">{{eval(grn_values.grn_po_value)-eval(grn_values.grn_balance)}}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <p><b>Amount Payable :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="text_balance">{{grn_values.grn_balance}}</p>
                                        </div>
                                    </div>
                                    <div class="row" id="credit_balance_div" style="display:none;">
                                        <div class="col-md-7">
                                            <p><b>Available Credits :</b></p>
                                        </div>
                                        <div class="col-md-5">
                                            <p id="credit_balance">
                                            {{grn_values.grn_id}}
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
            

    //     var page_action = "<?php if(isset($_GET['action'])){ echo $_GET['action']; } ?>";
    //     var page_table = "<?php if(isset($_GET['type'])){ echo $_GET['type']; } ?>";
    //     var page_vendor = "<?php if(isset($_GET['vendorid'])){ echo $_GET['vendorid']; } ?>";
    //     var page_payment_invoice_no = "<?php if(isset($_GET['invoice_no'])){ echo $_GET['invoice_no']; } ?>";
    //     var page_payment_id = "<?php if(isset($_GET['payment_id'])){ echo $_GET['payment_id']; } ?>";
    //    var page_payment_v_credits_id  = "<?php if(isset($_GET['v_credits_id '])){ echo $_GET['v_credits_id ']; } ?>";

 
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
                $scope.v_credits_id = $location.search()['v_credits_id'];

                if($scope.v_credits_id && $scope.v_credits_id!==""){                    
                    $scope.showCreditInput = true;
                }

                if (page_action == "edit") {
                    var credits_data = Page.get_edit_vals(page_payment_id, "payments", "payment_id");                    
                    $scope.vp = credits_data;
                    $scope.vp.payment_date = new Date($scope.vp.payment_date);
                    $scope.onVendorChange();
                    $scope.onPaymentModeChange();
                    if($scope.vp.payment_mode==="Cash"){
                    }else{
                        $scope.onBankChange();
                    }
                    $scope.onCreditChange();
                    $scope.editMode = true;
                }

            
            }
            $scope.test = "test";
            $scope.invoices =[];
            $scope.vp = {
                payment_vendor: "",
                payment_invoice_no: "",
                payment_amount: "",
                payment_credits_used: "",
                payment_date: new Date(),
                payment_mode: "",
                payment_cheque_status: "",
                payment_bank: "",
                payment_ref_no: "",
                payment_user: "<?php echo $session_user; ?>",
                payment_notes: "",
                payment_notify: false
            };

            $scope.creditAmtValidation = true;


            $scope.onPaymentModeChange = () => {
                let comprofile = Page.get_edit_vals('<?php echo $session_org;?>', "comprofile", "orgid");
                $scope.comprofile = comprofile;
            }

            $scope.getCompanyDetails = () => {
                let comprofile = Page.get_edit_vals('<?php echo $session_org;?>', "comprofile", "orgid");
                $scope.comprofile = comprofile;
            }


            $scope.onBankChange = () => {
                let selectedBank = Page.get_edit_vals($scope.vp.payment_bank, "compbank", "id");
                $scope.selectedBank = selectedBank;
            }

            $scope.onVendorChange = () => {
                let vendorProfile = Page.get_edit_vals($scope.vp.payment_vendor, "vendorprofile",
                    "vendorid");
                $scope.vendorProfile = vendorProfile;

                var data = $.param({
                    payment_vendor: vendorProfile.vendorid
                });
        
                $http.post("workers/getters/get_invoices.php",data,config)
                .then(function(response) {
                    if(response.data.status){
                        $scope.invoices = response.data.values;
                       //Page.plant("payment_invoice_no",response.data.status,response.data.values,"grn_invoice_no",null,null,"Invoices");
                    }
                });
            }

            $scope.onInvoiceChange = () =>{
                let grn_values = Page.get_edit_vals($scope.vp.payment_invoice_no,'grn_notes','grn_invoice_no');
                $scope.grn_values = grn_values;
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

            $scope.convertToPettyCash = () =>{
                
                let obj = {
                    conv_amt:$scope.conv_amt,
                    handler:"<?php echo $session_user;?>",
                    compId: "<?php echo $session_org;?>",
                    conv_remarks:$scope.conv_remarks ? $scope.conv_remarks : "",
                    action:"add",
                    table:"petty_cas_conv"
                };

                $http({
                        method: 'POST',
                        url: "workers/setters/save_conversion.php",
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                        transformRequest: function(obj) {
                           return $scope.reqTransform(obj);
                        },
                        data: obj
                    }) .then(function(response) {
                    if(response.data.status){
                        $scope.conv_amt="";
                        $scope.conv_remarks = "";
                        $scope.getCompanyDetails();
                        $("#pettyCashConvModal").modal('hide');
                    }
                });

            }

            $scope.makePayment = () =>{

                $scope.table = "payments";
                $scope.vp.payment_grn_id = $('#text_grn_id').text();
                $scope.vp.payment_po_code = $('#text_po_code').text();

                var decision = confirm("confirm Payment");
                
                if (decision===false) {
                    return false;
                } 

                var total_amt = 0;
                if($scope.v_credits_id!==""){
                    total_amt = +$scope.vp.payment_amount + +    $scope.vp.payment_credits_used;
                }
                
                if(+$scope.grn_values.grn_balance < +total_amt){
                    alert('Total Payment cannot be greater than Payable Amount ');
                    return false;
                }

                let obj = {
                        array : JSON.stringify({...$scope.vp,payment_amount:total_amt}),
                        payment_id:"",
                        payment_grn_id:$scope.vp.payment_grn_id,
                        payment_amount:$scope.vp.payment_amount,
                        action:"add",table:"payments",
                        page_payment_v_credits_id:$scope.v_credits_id!==undefined?$scope.v_credits_id:"",
                        compId:`<?php echo $session_org?$session_org:'';?>`,
                        handler:`<?php echo $session_user?$session_user:'';?>`
                }

                $http({
                        method: 'POST',
                        url: "workers/setters/save_payments.php",
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                        transformRequest: function(obj) {
                           return $scope.reqTransform(obj);
                        },
                        data: obj
                    }) .then(function(response) {
                    if(response.data.status){
                        location.href="listGoodsReceiptNote.php";
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
        //         $('#payment_vendor').val(page_vendor);
        //         onvendor_select(page_vendor);
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

