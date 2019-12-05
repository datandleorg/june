
<?php include('header.php');?>
<!-- End Sidebar -->

<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">


            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Customer Credits</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item"><a  href="index.php">Home</a></li>
                            <li class="breadcrumb-item active">Customer Credits</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">						
                    <div class="card mb-3">
                        <div class="card-header">
                            <h5><div class="text-muted font-light"><i class="fa fa-truck smallfonts" aria-hidden="true"></i>&nbsp;Add Customer Credits<span class="text-muted"></span></div></h5>
                        </div>

                        <div class="card-body">
                            <form autocomplete="off" action="#" enctype="multipart/form-data" id="addcustomercredits_form" method="post" novalidate>


                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Customer Name<span class="text-danger">*</span></label>
                                        <select id="customer_credits_custid" onchange="print_bill_addr(this.value);" class="form-control form-control-sm" name="customer_credits_custid">
                                            <option selected>--Select Customer Code--</option>
                                        </select>

                                    </div>
                                </div>


                                <div class="form-row">
                                    <div class="form-group col-md-6" id="customer_bill_addr">

                                    </div>											
                                </div>

                                <div class="form-row">      
                                    <div class="form-group col-md-6">
                                        <label >Payment Mode<span class="text-danger">*</span></label>
                                        <select required name="customer_credits_paymentmode" id="customer_credits_paymentmode" 
                                        onchange="togglePaymentDetailsOptions(this.value)"
                                        data-parsley-trigger="change"  class="form-control form-control-sm"   >
                                            <option value="">-- Select Payment Mode --</option>
                                            <option value="Cash">Cash</option>
                                            <option value="Cheque">Cheque</option>
                                            <option value="Credit Card">Credit Card</option>
                                            <option value="Bank Transfer">Bank Transfer</option>
                                            <option value="Bank Remittance">Bank Remittance</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-row" id="customer_credits_cheque_status_row">
                                    <div class="form-group col-md-6">
                                        <label>Cheque Status<span class="text-danger">*</span></label>
                                        <select required name="customer_credits_cheque_status" id="customer_credits_cheque_status" data-parsley-trigger="change" class="form-control form-control-sm">
                                            <option value="">-- Select Cheque Status --</option>
                                            <option value="Cleared">Cleared</option>
                                            <option value="Uncleared">Uncleared</option>
                                        </select>
                                    </div>
                                </div>

                                
                                <div class="form-row" id="customer_credits_bank_row">
                                    <div class="form-group col-sm-6">
                                        <label> Bank<span class="text-danger">*</span></label>

                                        <select id="customer_credits_bank" class="form-control form-control-sm" onchange="printBankDetails(this.value)" name="customer_credits_bank">
                                            <option selected>--Select Bank--</option> ';
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

                                <div class="form-row">
                                    <div class="form-group col-md-6" id="vendor_bank_details">

                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-8">
                                        <label>Reference #</label>
                                        <input type="text" class="form-control form-control-sm" name="customer_credits_refno" id="customer_credits_refno" placeholder=" Reference Number(optional)" class="form-control" autocomplete="off" />
                                    </div>
                                </div>


                                <!-- Modal Ends-->	
                                <div class="form-row">
                                    <div class="form-group col-md-3">
                                        <label for="inputState">Credit Date</label>									
                                        <input type="date" class="form-control form-control-sm"  id="customer_credits_paymentdate" name="customer_credits_paymentdate" value="<?php echo date("Y-m-d");?>">		
                                    </div>

                                    <div class="form-group col-md-3">									  
                                        <label>Enter Credits</label>
                                        <input type="text" class="form-control form-control-sm" name="customer_credits_amount" id="customer_credits_amount" placeholder="Credit Amount"  required class="form-control" autocomplete="off">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Handler</label>

                                        <input type="text" class="form-control form-control-sm" name="customer_credits_handler" id="customer_credits_handler" readonly class="form-control form-control-sm" value="<?php echo $session_user; ?>" required />

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
                                        <textarea rows="2" class="form-control editor" id="customer_credits_notes" name="customer_credits_notes" placeholder="add product/price/stock related notes here"></textarea>
                                    </div> 
                                </div>


                                <div class="form-row">
                                    <div class="col-md-12 col-md-offset-12">
                                        <input type="checkbox" id="customer_credits_email_notification" name="customer_credits_email_notification">
                                        <label for="subscribeNews">Send a Customer Credit Note information email notification to Customer</label>									
                                    </div>
                                </div>
                                <br/>



                                <div class="form-row">
                                    <div class="modal-footer">
                                        <button class="btn btn-primary" name="vendorCredit" value="vendorCredit" type="submit">
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


    <?php include('footer.php');?>


    <script>

        var page_action = "<?php if(isset($_GET['action'])){ echo $_GET['action']; } ?>";
        var page_table = "<?php if(isset($_GET['type'])){ echo $_GET['type']; } ?>";
        var page_customer_credits_id = "<?php if(isset($_GET['customer_credits_id'])){ echo $_GET['customer_credits_id']; } ?>";


        $(function(){
            get_vendors();
            $('#message-alert').hide();

            if(page_action=="edit"){
                var credits_data = Page.get_edit_vals(page_customer_credits_id,"customercredits","customer_credits_id");
                $('#customer_credits_custid').val(credits_data.customer_credits_custid);
                $('#customer_credits_paymentmode').val(credits_data.customer_credits_paymentmode);
                $('#customer_credits_paymentdate').val(credits_data.customer_credits_paymentdate);               
                $('#customer_credits_handler').val(credits_data.customer_credits_handler);
                $('#customer_credits_amount').val(credits_data.customer_credits_amount);
                $('#customer_credits_notes').val(credits_data.customer_credits_notes);               

            }

        });      
    </script>



    <script>

        function togglePaymentDetailsOptions(paymentMode) {
            if (paymentMode == "Bank Transfer" || paymentMode == "Bank Remittance") {
                $('#customer_credits_bank_row').show();
                $('#customer_credits_cheque_status_row').hide();
                $('#vendor_bank_details').show();
            } else {
                $('#customer_credits_bank_row').hide();
                $('#vendor_bank_details').hide();

            }

            if (paymentMode == "Cheque") {
                $('#customer_credits_cheque_status_row').show();
                $('#customer_credits_bank_row').hide();
                $('#vendor_bank_details').hide();
                $('#customer_credits_cheque_status').val('Uncleared');
            } else {
                $('#customer_credits_cheque_status_row').hide();
            }

        }

        function printBankDetails(bankid) {
            if (bankid != '') {
                var bank_data = Page.get_edit_vals(bankid, "compbank", "id");
                var bank_div = '';
                bank_div += '<h6>Bank Details</h6>';
                bank_div += '<p>';
                bank_div += '<b>' + bank_data.bankname + '</b><br/>';
                bank_div += bank_data.acctname + '<br/>';
                bank_div += bank_data.acctno + '<br/>';
                bank_div += bank_data.acctype + '<br/>';
                bank_div += bank_data.branch + '<br/>';
                bank_div += bank_data.ifsc + '<br/>';
                bank_div += '</p>';
                $('#vendor_bank_details').html(bank_div);
            } else {
                $('#vendor_bank_details').html('');

            }
        }

        function get_vendors(){
           alert()
            var customer_params=[];
            Page.load_select_options('customer_credits_custid',customer_params,'customerprofile','Customers','custid','custname',null);

        }

        function print_bill_addr(custid){
            if(custid!=''){
                var customer_data = Page.get_edit_vals(custid,"customerprofile","custid");
                var bill_div = '';
                bill_div+= '<h6>Billing Address</h6>';
                bill_div+= '<p>';
                bill_div+= '<b>'+customer_data.custname+'</b><br/>';
                bill_div+= customer_data.address+'<br/>';
                bill_div+= customer_data.state+'<br/>';
                bill_div+= customer_data.city+'<br/>';
                bill_div+= customer_data.zip+'<br/>';
                bill_div+= '</p>';
                $('#customer_bill_addr').html(bill_div);
            }else{
                $('#customer_bill_addr').html('');

            }
        }

        function getFormData($form){
            var unindexed_array = $form.serializeArray();
            var indexed_array = {};

            $.map(unindexed_array, function(n, i){
                if(n['name']=="id"||n['name']=="customer_credits_email_notification"){

                }else{
                    indexed_array[n['name']] = n['value'];
                }
            });

            return indexed_array;
        }

        $("form#addcustomercredits_form").submit(function(e){
            e.preventDefault();
            var $form = $(this);
            var data = getFormData($form);
            if(page_action=="edit"){

                var credirRefund_arr = Page.get_multiple_vals(page_customer_credits_id,"customer_refund","customer_refund_creditsid");
                var refund_sum = 0 ;
                console.log(credirRefund_arr);
                if(credirRefund_arr.length>0){
                    for(r=0;r<credirRefund_arr.length;r++){
                        refund_sum = refund_sum + eval(credirRefund_arr[r].v_refund_amount);
                    }         
                }


                if(data.customer_credits_amount<refund_sum){
                    $('#message-alert').show();
                    $('#message-alert').text('Refunds has been made for this Credit , so It cant be lesser than that .');
                    return false;

                }else{
                    $('#message-alert').hide();
                    $('#message-alert').text('');

                }           

            }
            // console.log($('#v_credits_email_notification').is(":checked"));
            data.table = "customercredits";
            data.customer_credits_email_notification =$('#customer_credits_email_notification').is(":checked")?"yes":"no";

            if(page_action!="edit"){
                data.customer_credits_availcredits = $('#customer_credits_amount').val();
            }

            $.ajax ({
                url: 'workers/setters/save_customercredits.php',
                type: 'post',
                data: {
                    array : JSON.stringify(data),
                    customer_credits_id:page_customer_credits_id,
                    action:page_action?page_action:"add",
                    compId:<?php echo $session_org?$session_org:'';?>
                    table:"customercredits"},
                dataType: 'json',
                success:function(response){
                    location.href="listCustomerCredits.php";
                }

            });

        });
    </script>			


    </body>
</html>