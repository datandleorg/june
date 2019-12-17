<?php include('header.php');?>

<div class="content-page" ng-app="paymentPages" ng-controller="formCtrl" ng-init="formInit()">

    <div class="content">

        <div class="container-fluid">


            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Vendor Credits</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                            <li class="breadcrumb-item active">Vendor Credits</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                    <div class="card mb-3">
                        <div class="card-header">
                            <h5>
                                <div class="text-muted font-light"><i class="fa fa-truck smallfonts"
                                        aria-hidden="true"></i>&nbsp;Add Vendor Credits<span class="text-muted"></span>
                                </div>
                            </h5>
                        </div>

                        <div class="card-body">
                            <form autocomplete="off" action="#" enctype="multipart/form-data" id="addcredits_form"
                                method="post">

                                <div class="form-row">

                                    <div class="form-group col-md-6">
                                        <label for="inputState">Vendor Name<span class="text-danger">*</span></label>
                                        <select required id="v_credits_vendorid" ng-model="vc.v_credits_vendorid"
                                            ng-change="onVendorChange()" class="form-control form-control-sm"
                                            name="v_credits_vendorid">
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


                                <div class="form-row" ng-if="vc.v_credits_vendorid!==''">
                                    <div class="form-group col-md-6">
                                        <h6>Billing Address</h6>
                                        <p>
                                            <b>{{vendorProfile.supname}}</b><br />
                                            {{vendorProfile.address}}<br />
                                            {{vendorProfile.state}}<br />
                                            {{vendorProfile.city}}<br />
                                            {{vendorProfile.zip}}<br />
                                        </p>
                                    </div>
                                </div>

                                
                                <div class="form-row" ng-if="editMode">
                                    <div class="form-group col-md-6">
                                       Payment Mode : {{vc.v_credits_paymentmode}}
                                    </div>
                                </div>

                                <div class="form-row" ng-show="!editMode">
                                    <div class="form-group col-md-6">
                                        <label>Payment Mode<span class="text-danger">*</span></label>
                                        <select required name="v_credits_paymentmode" id="v_credits_paymentmode"
                                            ng-model="vc.v_credits_paymentmode" ng-change="onPaymentModeChange()"
                                            class="form-control form-control-sm" name="v_credits_paymentmode">
                                            <option value="">-- Select Payment Mode --</option>
                                            <option value="Cash">Cash</option>
                                            <option value="Cheque">Cheque</option>
                                            <option value="Bank Transfer">Bank Transfer</option>
                                        </select>
                                        <p ng-if="vc.v_credits_paymentmode=='Cash'" class="small p-1"
                                            id="petty_cash_bal">Petty Cash balance : {{comprofile.petty_cash_bal}}</p>
                                    </div>
                                </div>

                                <div class="form-row" id="v_credits_cheque_status_row"
                                    ng-if="vc.v_credits_paymentmode=='Cheque'">
                                    <div class="form-group col-md-6">
                                        <label>Cheque Status<span class="text-danger">*</span></label>
                                        <select name="v_credits_cheque_status" id="v_credits_cheque_status"
                                            ng-model="vc.v_credits_cheque_status" data-parsley-trigger="change"
                                            class="form-control form-control-sm">
                                            <option value="">-- Select Cheque Status --</option>
                                            <option value="Cleared">Cleared</option>
                                            <option value="Uncleared">Uncleared</option>
                                        </select>
                                    </div>
                                </div>



                                <div class="form-row" id="v_credits_bank_row"
                                    ng-if="vc.v_credits_paymentmode=='Bank Transfer' || vc.v_credits_paymentmode=='Cheque'">
                                    <div class="form-group col-sm-6">
                                        <label> Bank<span class="text-danger">*</span></label>

                                        <select id="v_credits_bank" class="form-control form-control-sm"
                                            ng-model="vc.v_credits_bank" name="v_credits_bank"
                                            ng-change="onBankChange()">
                                            <option value='' selected>--Select Bank--</option> ';
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
                                        <p ng-if="vc.v_credits_bank!==''" class="small p-1" id="petty_cash_bal">Account
                                            balance : {{selectedBank.closing_bal}}</p>

                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6"
                                        ng-if="vc.v_credits_bank!=='' && (vc.v_credits_paymentmode=='Bank Transfer' || vc.v_credits_paymentmode=='Cheque')">
                                        <h6>Bank Details</h6>
                                        <p><b>{{selectedBank.bankname}}</b><br />
                                            {{selectedBank.acctname}}<br />
                                            {{selectedBank.acctno}}<br />
                                            {{selectedBank.acctype}}<br />
                                            {{selectedBank.branch}}<br />
                                            {{selectedBank.ifsc}}<br />
                                        </p>
                                    </div>
                                </div>


                                <div class="form-row" ng-if="vc.v_credits_paymentmode!=='Cash'">
                                    <div class="form-group col-md-8">
                                        <label>Reference #</label>
                                        <input ng-model="vc.v_credits_ref_no" type="text"
                                            class="form-control form-control-sm" name="v_credits_ref_no"
                                            id="v_credits_ref_no" placeholder=" Reference Number(optional)"
                                            class="form-control" autocomplete="off" />
                                    </div>
                                </div>


                                <!-- Modal Ends-->
                                <div class="form-row">
                                    <div class="form-group col-md-3">
                                        <label for="inputState">Credit Date</label>
                                        <input type="date" class="form-control form-control-sm"
                                            ng-model="vc.v_credits_paymentdate" id="v_credits_paymentdate"
                                            name="v_credits_paymentdate">
                                    </div>

                                    <div class="form-group col-md-3">
                                        <label>Enter Credits<span class="text-danger">*</span></label>
                                        <input type="text" class="form-control form-control-sm"
                                            ng-change="onCreditChange()" ng-model="vc.v_credits_amount"
                                            name="v_credits_amount" id="v_credits_amount" placeholder="Credit Amount"
                                            required class="form-control" autocomplete="off">
                                        <p class="small text-danger"
                                            ng-if="!creditAmtValidation || vc.v_credits_amount<0">Enter a valid credit
                                            amount </p>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Handler</label>

                                        <input type="text" class="form-control form-control-sm" name="v_credits_handler"
                                            ng-model="vc.v_credits_handler" id="v_credits_handler" readonly
                                            class="form-control form-control-sm" value="<?php echo $session_user; ?>"
                                            required />

                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <h5>Notes Information</h5>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Add Notes</label>
                                        <textarea rows="2" class="form-control editor" id="v_credits_notes"
                                            name="v_credits_notes" ng-model="vc.v_credits_notes"
                                            placeholder="add product/price/stock related notes here"></textarea>
                                    </div>
                                </div>


                                <div class="form-row">
                                    <div class="col-md-12 col-md-offset-12">
                                        <input type="checkbox" id="v_credits_email_notification"
                                            ng-model="vc.v_credits_email_notification"
                                            name="v_credits_email_notification">
                                        <label for="subscribeNews">Send a Vendor Credit Note information email
                                            notification to Vendor</label>
                                    </div>
                                </div><br />



                                <div class="form-row">
                                    <div class="modal-footer">
                                        <!--input type="hidden" name="vendorCreditID" value="<?= $_GET['id'] ?>"-->

                                        <button class="btn btn-primary" name="vendorCredit" value="vendorCredit"
                                            type="submit">
                                            Submit
                                        </button>
                                        <button type="reset" name="cancel" class="btn btn-secondary m-l-5">
                                            Cancel
                                        </button>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="alert alert-danger alert-dismissible" id="message-alert" role="alert">

                                    </div>
                                </div>



                            </form>

                        </div>
                    </div>
                </div>



            </div>
            <!-- END container-fluid -->

        </div>
        <!-- END content -->

    </div>
    <!-- END content-page -->


    <?php include('footer.php'); ?>



    <script>
        var page_action = "<?php if (isset($_GET['action'])) {echo $_GET['action'];} ?>";
        var page_table = "<?php if (isset($_GET['type'])) {echo $_GET['type'];} ?>";
        var page_v_credits_id = "<?php if (isset($_GET['v_credits_id'])) { echo $_GET['v_credits_id']; } ?>";


        $(function () {
            $('#message-alert').hide();
        });
    </script>



    <script>
        var error = false;
        var app = angular.module('paymentPages', []);
        app.controller('formCtrl', function ($scope, $http) {
            $scope.formInit = () =>{
                if (page_action == "edit") {
                    var credits_data = Page.get_edit_vals(page_v_credits_id, "vendorcredits", "v_credits_id");                    
                    $scope.vc = credits_data;
                    $scope.vc.v_credits_paymentdate = new Date($scope.vc.v_credits_paymentdate);
                    $scope.onVendorChange();
                    $scope.onPaymentModeChange();
                    if($scope.vc.v_credits_paymentmode==="Cash"){
                    }else{
                        $scope.onBankChange();
                    }
                    $scope.onCreditChange();
                    $scope.editMode = true;
                }
            }
            $scope.test = "test";
            $scope.vc = {
                v_credits_vendorid: "",
                v_credits_paymentmode: "",
                v_credits_cheque_status: "Uncleared",
                v_credits_bank: "",
                v_credits_ref_no: "",
                v_credits_paymentdate: new Date(),
                v_credits_amount: 0,
                v_credits_handler: "<?php echo $session_user; ?>",
                v_credits_notes: "",
                v_credits_email_notification: false
            };
            $scope.creditAmtValidation = true;


            $scope.onPaymentModeChange = () => {
                let comprofile = Page.get_edit_vals('<?php echo $session_org;?>', "comprofile", "orgid");
                $scope.comprofile = comprofile;
            }

            $scope.onBankChange = () => {
                let selectedBank = Page.get_edit_vals($scope.vc.v_credits_bank, "compbank", "id");
                $scope.selectedBank = selectedBank;
            }

            $scope.onVendorChange = () => {
                let vendorProfile = Page.get_edit_vals($scope.vc.v_credits_vendorid, "vendorprofile",
                    "vendorid");
                $scope.vendorProfile = vendorProfile;
            }

            $scope.onCreditChange = () => {
                if ($scope.vc.v_credits_paymentmode === "Cash") {
                     $scope.creditAmtValidation = +$scope.vc.v_credits_amount > +$scope.comprofile
                        .petty_cash_bal ? false : true;
        
                        
                } else {
                    $scope.creditAmtValidation = +$scope.vc.v_credits_amount > +$scope.selectedBank
                        .closing_bal ? false : true;
                }

                error = !$scope.creditAmtValidation;
            }
        });


        function getFormData($form) {
            var unindexed_array = $form.serializeArray();
            var indexed_array = {};

            $.map(unindexed_array, function (n, i) {
                if (n['name'] == "id" || n['name'] == "v_credits_email_notification") {

                } else {
                    indexed_array[n['name']] = n['value'];
                }
            });

            return indexed_array;
        }


        $("form#addcredits_form").submit(function (e) {
            e.preventDefault();
            var $form = $(this);
            var data = getFormData($form);
            if (page_action == "edit") {

                var credirRefund_arr = Page.get_multiple_vals(page_v_credits_id, "vendor_refund",
                    "v_refund_creditsid");

                if (credirRefund_arr) {
                    var refund_sum = 0;
                    if (credirRefund_arr.length > 0) {
                        for (r = 0; r < credirRefund_arr.length; r++) {
                            refund_sum = refund_sum + eval(credirRefund_arr[r].v_refund_amount);
                        }
                    }


                    if (data.v_credits_amount < refund_sum) {
                        $('#message-alert').show();
                        $('#message-alert').text(
                            'Refunds has been made for this Credit , so It cant be lesser than that .');
                        return false;

                    } else {
                        $('#message-alert').hide();
                        $('#message-alert').text('');

                    }
                }


            }
            // console.log($('#v_credits_email_notification').is(":checked"));
            data.table = "vendorcredits";
            data.v_credits_email_notification = $('#v_credits_email_notification').is(":checked") ? "yes" :
                "no";

            if (page_action != "edit") {
                data.v_credits_availcredits = $('#v_credits_amount').val();
            }

            if (data.v_credits_paymentmode !== "Cheque") {
                data.v_credits_cheque_status = '';
            }

            data.v_credits_compId = `<?php echo $session_org?$session_org:'';?>`;
            
            if (!error) {
                $.ajax({
                    url: 'workers/setters/save_vendorcredits.php',
                    type: 'post',
                    data: {
                        array: JSON.stringify(data),
                        v_credits_id: page_v_credits_id,
                        action: page_action ? page_action : "add",
                        table: "vendorcredits",
                        compId: `<?php echo $session_org?$session_org:'';?>`,
                        handler: `<?php echo $session_user?$session_user:'';?>`

                    },
                    dataType: 'json',
                    success: function (response) {
                        location.href="listVendorCredits.php";
                    }
                });
            } else {
                alert('error in data, please check again');
            }

        });
    </script>


    </body>

    </html>