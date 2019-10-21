
<?php include('header.php');?>
<!-- End Sidebar -->


<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">


            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Customer Credits Refund</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">Customer Credits Refund</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>



            <div class="row">					
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">						
                    <div class="card mb-3">
                        <div class="card-header">
                            <h3>
                                <i class="fa fa-rupee bigfonts" aria-hidden="true"></i>Customer Credits Refund</h3>

                        </div>

                        <div class="card-body">

                            <!--form autocomplete="off" action="#"-->
                            <form action=""  id="addcustomerrefund_form" enctype="multipart/form-data" method="post" accept-charset="utf-8">

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        Credit Ref#<label ></label><span class="text-danger">*</span>
                                        <input type="text" id="customer_refund_creditsid" class="form-control form-control-sm" readonly name="customer_refund_creditsid">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="datepicker1"><span class="text-danger">Refunded On*</span></label>
                                        <input type="date" class="form-control form-control-sm"  name="customer_refund_paymentdate" id="customer_refund_paymentdate" value="<?php echo date("Y-m-d");?>">									
                                    </div>
                                </div>


                                <div class="form-row">      
                                    <div class="form-group col-md-12">
                                        <label><span class="text-danger">Payment Mode*</span></label>
                                        <select required id="customer_refund_paymentmode" data-parsley-trigger="change"  class="form-control form-control-sm"  name="customer_refund_paymentmode" >
                                            <option value="">-- Select Payment Mode --</option>
                                            <option value="Cash">Cash</option>
                                            <option value="Cheque">Cheque</option>
                                            <option value="Credit Card">Credit Card</option>
                                            <option value="Bank Transfer">Bank Transfer</option>
                                            <option value="Bank Remittance">Bank Remittance</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        Reference #<label ></label><span class="text-danger">*</span>
                                        <input type="text" class="form-control form-control-sm" name="customer_refund_refno" id="customer_refund_refno" placeholder="" autocomplete="off" required>
                                    </div>
                                </div>							


                                <div class="form-row">
                                    <label><span class="text-danger">Amount<span class="text-danger">*</span></label>
                                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">								  								  
                                        <div class="input-group-addon">INR</span></div>
                                        <input type="text" name="customer_refund_amount" class="form-control form-control-sm" id="customer_refund_amount" placeholder="Enter Amount" required>
                                       &nbsp;&nbsp; <input type="checkbox" id="paymentemail" name="paymentemail" value="payment_email">
                                     <label for="subscribeNews">&nbsp;Refund Full Credits(<i class="fa fa-rupee fonts" aria-hidden="true"></i>&nbsp;)</label>									
                                            
									</div>
                                </div>								


                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputState">Handler</label>
                                        <input type="text" class="form-control form-control-sm" name="customer_refund_handler" id="customer_refund_handler" readonly class="form-control form-control-sm" value="<?php echo $session_user; ?>" required />
                                    </div>
                                </div>									

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label>Refund Notes</label>
                                        <textarea cols="20" rows="2" class="form-control tip redactor" name="customer_refund_notes" id="customer_refund_notes" placeholder="Max 200 Characters "></textarea>
                                    </div> 
                                </div>


                                <div class="form-row">
                                    <div class="form-group text-right m-b-10">
                                        &nbsp;<button id="submit-form" class="btn btn-primary" name="submit" type="submit">
                                        Submit
                                        </button>
                                        <button id="cancel-form" type="reset" name="cancel" class="btn btn-secondary m-l-5">
                                            Cancel
                                        </button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <h5>Customer Credits details</h5>

                    <p>Customer ID :&nbsp;<span id="show_customerid"></span></p>
                    <p>Intial Credit Amount : &nbsp;<span id="show_amount"></span></p>
                    <p>Credit Balance : &nbsp;<span id="show_amount_bal"></span></p>
                    <p><span id="show_error"></span></p>
                </div>

            </div>
            <!-- END container-fluid -->

        </div>
        <!-- END content -->

    </div>
    <!-- END content-page -->

    <script>

        var page_action = "<?php if(isset($_GET['action'])){ echo $_GET['action']; } ?>";
        var page_table = "<?php if(isset($_GET['type'])){ echo $_GET['type']; } ?>";
        var page_customer_credits_id = "<?php if(isset($_GET['customer_credits_id'])){ echo $_GET['customer_credits_id']; } ?>";
        var page_customer_refund_id = "<?php if(isset($_GET['customer_refund_id'])){ echo $_GET['customer_refund_id']; } ?>";


        $(function(){
            if(page_action=="add"&&page_customer_credits_id){

                $('#customer_refund_creditsid').val(page_customer_credits_id);               
                var credits_data = Page.get_edit_vals(page_customer_credits_id,"customercredits","customer_credits_id");
                $('#show_customerid').text(credits_data.customer_credits_vendorid);               
                $('#show_amount').text(credits_data.customer_credits_amount);               
                $('#show_amount_bal').text(credits_data.customer_credits_availcredits);               

            }

        });      
    </script>



    <script>
        function get_vendors(suptype){

            var vendor_params=[];
            var suptype_data = Page.get_edit_vals(suptype,"suptype","id");
            vendor_params[0]={"suptype":suptype_data.suptype};  

            Page.load_select_options('v_credits_vendorid',vendor_params,'vendorprofile','Vendors','vendorid','supname',null);

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


        $("#cancel-form").click(function(){
            location.href="listCustomerCredits.php";
        });

        $("form#addcustomerrefund_form").submit(function(e){
            e.preventDefault();


            $('#submit-form').hide();
            $('#cancel-form').hide();
            var $form = $(this);
            var data = getFormData($form);
            var credits_amount = $('#show_amount_bal').text();
            // console.log(credits_amount);
            if(eval(data.customer_refund_amount)>eval(credits_amount)){

                alert('Refund Amount cannot be greater than Credit amount ');
                return false;
            }else{
                data.table = "customer_refund";

                $.ajax ({
                    url: 'workers/setters/save_customerrefund.php',
                    type: 'post',
                    data: {
                        array : JSON.stringify(data),
                        customer_refund_id:page_customer_refund_id,
                        customer_credits_id:page_customer_credits_id,
                        action:page_action?page_action:"add",table:"customer_refund"},
                    dataType: 'json',
                    success:function(response){
                         location.href="listCustomerCredits.php";
                    }


                });
            }


        });
    </script>			


    <?php include('footer.php');?>

