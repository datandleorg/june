
<?php include('header.php');?>

<!-- End Sidebar -->


<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">


            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Bank Credits/Deposit</h1>
                        <ol class="breadcrumb float-right">
                            <a  href="index.php"><li class="breadcrumb-item">Home</a></li>
                        <li class="breadcrumb-item active">Bank Credits/Deposit</li>
                        </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- end row -->


        <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">						
                <div class="card mb-3">
                    <div class="card-header">
                        <!--h3><i class="fa fa-check-square-o"></i>Create Company </h3-->
                        <h3><div class="fa-hover col-md-8 col-sm-8">
                            <i class="fa fa-bank bigfonts" aria-hidden="true"></i> Credit Bank Deposit<h3>
                            </div>


                            <div class="card-body">
                                <form method="post" enctype="multipart/form-data" id="bankDepositForm">

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="datepicker1">Date</label><span class="text-danger">*</span>
                                            <!--input type="date" class="form-control" name="date" value="<?php echo date("d/m/Y") ?>"/-->
                                            <input type="date" class="form-control form-control-sm"  name="depositdate" value="<?php echo date("Y-m-d");?>">									
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="inputState">Company Name<span class="text-danger">*</span></label>
                                            <select id="compcode"  class="form-control form-control-sm" name="compcode">
                                                <option selected>Open Company Names</option>
                                                <?php 
                                                $sql = mysqli_query($dbcon,"select * from comprofile");
                                                while ($row = $sql->fetch_assoc()){	
                                                    echo $compname = $row['orgname'];
                                                    echo $compcode=$row['orgid'];
                                                    if($compcode==$_GET['orgid']){
                                                        echo '<option value="'.$compcode.'"  selected>'.$compname.'</option>';  
                                                    }else{
                                                        echo '<option value="'.$compcode.'" >'.$compname.'</option>';      
                                                    }
                                                }
                                                ?>
                                            </select>

                                        </div>
                                    </div>

                                     <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="inputState">Bank Name<span class="text-danger">*</span></label>
                                            <select id="bankname" onchange="onbankname(this.value);" class="form-control form-control-sm" name="bankname">
                                                <option selected>Open Bank Names</option>
                                                <?php 
                                                $sql = mysqli_query($dbcon,"select bankname,id from compbank");
                                                while ($row = $sql->fetch_assoc()){	
                                                     $bankname=$row['bankname'];
                                                     $bankid=$row['id'];
                                                    if($bankname==$_GET['bankname']){
                                                        echo '<option value="'.$bankid.'"  selected>'.$bankname.'</option>';  
                                                    }else{
                                                        echo '<option value="'.$bankid.'" >'.$bankname.'</option>';      
                                                    }
                                                }
                                                ?>
                                            </select>

                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="inputState">Account Number</label>
                                            <input type="text" class="form-control form-control-sm" 
                                            name="acctno" id="acctno" readonly class="form-control form-control-sm"  />

                                        </div>
                                    </div>									


                                    <div class="form-row">
                                        <span class="text-danger"> Amount<label >*</span></label>
                                        <form class="form-inline">	
                                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">								  								  
                                                <div class="input-group-addon">INR</div>
                                                <input type="text" name="amount" class="form-control form-control-sm" id="amount" placeholder="Enter Amount" required>
                                            </div>
                                            </div></br>										

                                <?php 
                                 if(!isset($_GET['action'])){
                                     echo ' <div class="form-row">
                                     <div class="form-group col-md-12">
                                         <label >Payment Method</label>
                                         <select required id="paymethod" data-parsley-trigger="change"  onchange="togglePaymentDetailsOptions(this.value)" class="form-control form-control-sm"  name="paymethod" >
                                             <option value="">Open Payment Method</option>
                                             <option value="Cash">Cash</option>
                                             <option value="Cheque">Cheque</option>
                                             <option value="Bank Transfer">Bank Transfer</option>
                                         </select>
                                         <small id="cashbaldiv">Cash Balance: <span id="cashbal"></span></small>
                                     </div>
                                 </div>';
                                 }else{
                                    echo '<p><b>Payment Mode: </b><span id="paymentMode"></span></p>';
                                    echo '<p id="cashbaldiv"><b>Balance: </b><span id="cashbal"></span></p>';
                                }
                                ?>
                                   


                                    <div class="form-row" id="v_credits_cheque_status_row">
                                        <div class="form-group col-md-6">
                                            <label>Cheque Status<span class="text-danger">*</span></label>
                                            <select name="pay_status" id="pay_status" data-parsley-trigger="change" class="form-control form-control-sm">
                                                <option value="">-- Select Cheque Status --</option>
                                                <option value="Cleared">Cleared</option>
                                                <option value="Uncleared">Uncleared</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label >Payment Type</label>
                                            <select required id="paytype" data-parsley-trigger="change"  class="form-control form-control-sm"  name="paytype" >
                                                <option value="">Open Payment Type</option>
                                                <option value="Sales">Sales</option>
                                                <option value="Payments">Payments</option>
                                                <option value="Investments">Investments</option>
                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="inputZip">Reference#</label>
                                            <input type="text" class="form-control" name="referenceno" placeholder="" class="form-control" autocomplete="off">
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Notes</label></span>
                                        <textarea cols="20" rows="2" class="form-control tip redactor" name="notes" placeholder="Max 255 Characters "></textarea>
                                    </div> 
                                    </div>

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputState">Created By</label>
                                        <input type="text" class="form-control form-control-sm" name="createdby" readonly class="form-control form-control-sm" value="<?php echo $session_user; ?>" />

                                    </div>
                                </div>									

                                <div class="form-row">
                                    <div class="form-group text-right m-b-10">
                                        &nbsp;<button class="btn btn-primary" name="submit" type="submit">
                                        Submit
                                        </button>
                                        <button type="reset" name="cancel" class="btn btn-secondary m-l-5">
                                            Cancel
                                        </button>
                                    </div>
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

    <script>

        var page_action = "<?php if(isset($_GET['action'])){ echo $_GET['action']; } ?>";
        var page_table = "<?php if(isset($_GET['type'])){ echo $_GET['type']; } ?>";
        var page_transid = "<?php if(isset($_GET['transid'])){ echo $_GET['transid']; } ?>";

        $('#v_credits_cheque_status_row').hide();
        $('#v_credits_cheque_status').prop('required',false);
        $("#cashbaldiv").hide();

        if(page_action=="edit"){
            var edit_data = Page.get_edit_vals(page_transid,page_table,"transid");
            set_form_data(edit_data);
            onbankname(edit_data.bankname);
            togglePaymentDetailsOptions(edit_data.paymethod);
            
         
        }


        
        function togglePaymentDetailsOptions(paymentMode) {

              
            if (paymentMode == "Cheque") {
                //console.log($('#v_credits_cheque_status_row'));
                
                $('#v_credits_cheque_status_row').show();
                $('#v_credits_cheque_status').val('Uncleared');
                $('#v_credits_cheque_status').prop('required',true);
                $("#cashbaldiv").hide();

            } else {
                $('#v_credits_cheque_status_row').hide();
                $('#v_credits_cheque_status').prop('required',false);
                if(paymentMode==="Cash"){
                    var cedit_data = Page.get_edit_vals("COMP001","comprofile","orgid");
                    $("#cashbaldiv").show();
                    $("#cashbal").html(cedit_data.cash_on_hand);
                }
            }

            $("#paymentMode").html(paymentMode);

        }


        function set_form_data(data){

            $.each(data, function(index, value) {

                if(index=="id"||index=="so_code"){
                }else if(index=="so_items"){
                    set_math_vals(JSON.parse(value));
                }else{
                    $('#'+index).val(value);
                }
            }); 

            }

        function onbankname(bankid){
            console.log(bankid,"bankid");
            var edit_data = Page.get_edit_vals(bankid,"compbank","id");
            $('#acctno').val(edit_data.acctno);
        }


        $("form#bankDepositForm").submit(function(e){
            e.preventDefault();
            var $form = $(this);
            var data = getFormData($form);
            

            function getFormData($form){
                console.log($form.serializeArray());
                
                var unindexed_array = $form.serializeArray();
                var indexed_array = {};

                $.map(unindexed_array, function(n, i){
                    if(n['name']=="id"){

                    }else{
                        indexed_array[n['name']] = n['value'];
                    }
                });

                return indexed_array;
          }

           console.log(data);
      //  return false;

            $.ajax ({
                url: 'workers/setters/save_bankdeposit.php',
                type: 'post',
                data: {
                    array : JSON.stringify(data),
                    transid:page_transid,
                    action:page_action?page_action:"add",
                    table:"bankdeposit",
                    compId:`<?php echo $session_org?$session_org:'';?>`,
                    handler:`<?php echo $session_user?$session_user:'';?>`

                },
                dataType: 'json',
                success:function(res){
                    
                    if(!res.status){
                       alert(res.message);
                    }else{
                        location.href="listBankDeposit.php";
                    }
                    
                }


            });

        });

    </script>
    <?php include('footer.php');?>
