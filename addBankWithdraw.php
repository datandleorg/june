<?php
include("database/db_conection.php");//make connection here
include('header.php');
?>

<!-- End Sidebar -->


<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">


            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Bank Withdrawel</h1>
                        <ol class="breadcrumb float-right">
                            <a  href="index.php"><li class="breadcrumb-item">Home</a></li>
                        <li class="breadcrumb-item active">Bank Withdrawels</li>
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
                            <i class="fa fa-bank bigfonts" aria-hidden="true"></i> Debit Bank Account<h3>
                            </div>


                            <div class="card-body">
                                <form method="post" enctype="multipart/form-data" id="bankWithdrawlForm">

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="datepicker1">Date</label><span class="text-danger">*</span>
                                            <!--input type="date" class="form-control" name="date" value="<?php echo date("d/m/Y") ?>"/-->
                                            <input type="date" class="form-control form-control-sm"  name="withdraweldate" value="<?php echo date("Y-m-d");?>">									
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
                                                    echo $bankname_get=$row['bankname'];
                                                    if($bankname_get==$_GET['bankname']){
                                                        echo '<option data-name="'.$bankname_get.'" value="'.$row['id'].'"  selected>'.$bankname_get.'</option>';  
                                                    }else{
                                                        echo '<option data-name="'.$bankname_get.'" value="'.$row['id'].'" >'.$bankname_get.'</option>';      
                                                    }
                                                }
                                                ?>
                                            </select>
                                           <small>Balance: <span id="acbal"></span></small>
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
                                                <input type="text" name="amount" class="form-control form-control-sm" id="amount" placeholder="Enter Withdrawel Amount" required>
                                            </div>
                                            </div></br>										

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label >Payment Method</label>
                                            <select required id="paymethod" data-parsley-trigger="change"  class="form-control form-control-sm"  name="paymethod" >
                                                <option value="Cash" selected>Cash</option>
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
                                        <?php 
                                        //session_start();
                                        include("database/db_conection.php");
                                        $userid = $_SESSION['userid'];
                                        $sq = "select username from userprofile where id='$userid'";
                                        $result = mysqli_query($dbcon, $sq) or die(mysqli_error($dbcon));
                                        //$count = mysqli_num_rows($result);
                                        $rs = mysqli_fetch_assoc($result);
                                        ?>
                                        <input type="text" class="form-control form-control-sm" name="createdby" readonly class="form-control form-control-sm" value="<?php echo $rs['username']; ?>" />

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


        if(page_action=="edit"){
            var edit_data = Page.get_edit_vals(page_transid,page_table,"transid");
            set_form_data(edit_data);
            onbankname(edit_data.bankname);
        }


        function set_form_data(data){

            $.each(data, function(index, value) {

                if(index=="id"||index=="so_code"){
                }else{
                    $('#'+index).val(value);
                }
            }); 

            }

        function onbankname(bankid){
            var edit_data = Page.get_edit_vals(bankid,"compbank","id");
            $('#acctno').val(edit_data.acctno);
            $('#acbal').html(edit_data.closing_bal);
        }


        $("form#bankWithdrawlForm").submit(function(e){
            e.preventDefault();
            var $form = $(this);
            var data = getFormData($form);            

            function getFormData($form){
                
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

            $.ajax ({
                url: 'workers/setters/save_bankwithdrawl.php',
                type: 'post',
                data: {
                    array : JSON.stringify(data),
                    transid:page_transid,
                    action:page_action?page_action:"add",
                    table:"bankwithdrawels",
                    compId:`<?php echo $session_org?$session_org:'';?>`,
                    handler:`<?php echo $session_user?$session_user:'';?>`

                },
                dataType: 'json',
                success:function(res){
                    if(!res.status){
                       alert(res.message);
                    }else{
                        location.href="listBankWithdrawels.php";
                    }
                }


            });

        });

    </script>
    <?php include('footer.php');?>
