<?php
include("database/db_conection.php");//make connection here
?>
<?php include('header.php');?>
<div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">

					
				<div class="row">
					<div class="col-xl-12">
							<div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Expense Entry Screen</h1>
                                    <ol class="breadcrumb float-right">
										<li class="breadcrumb-item">Home</li>
										<li class="breadcrumb-item active">Expense Entry Screen</li>
                                    </ol>
                                    <div class="clearfix"></div>
                            </div>
					</div>
			</div>
            <!-- end row -->


            <div class="row">					
					<div class="col-xs-12 col-sm-12 col-md-120 col-lg-12 col-xl-12">						
						<div class="card mb-3">
							<div class="card-header">
								
								
								<h3 class="fa-hover col-md-12 col-sm-12"><i class="fa fa-cart-plus smallfonts" aria-hidden="true">
								</i>&nbsp;&nbsp;Add Expense
								</h3>
								
							</div>
								
								
							<div class="card-body">
								
								<!--form autocomplete="off" action="#"-->
								<form id="add_expense_form" method="post" accept-charset="utf-8" novalidate>
								
								
								
								<div class="form-row">
									<div class="form-group col-md-6">
									   <label for="datepicker1">Date</label><span class="text-danger">*</span>
									  <!--input type="date" class="form-control" name="date" value="<?php echo date("d/m/Y") ?>"/-->
									  <input type="date" class="form-control form-control-sm"  id="expense_date" name="expense_date" value="<?php echo date("Y-m-d");?>">									
									</div>
									</div>
									
									
									<div class="form-row">
									<div class="form-group col-md-6">
									  <label >Paid Through</label>
                                     <select required id="expense_paid_thru" 
                                     onchange="togglePaymentDetailsOptions(this.value)"
                                     name="expense_paid_thru" data-parsley-trigger="change" 
									  class="form-control form-control-sm"  name="paymentype" >
										<option value="">--Select Paid Through--</option>
										<option value="Petty Cash">Petty Cash</option>
										<option value="Bank Transfer">Bank Transfer</option>
										<option value="Cheque">Cheque</option>
									</select>
									</div>
									</div>	
                                     
                                    <div class="form-row" id="expense_cheque_status_row" style="display:none">
                                    <div class="form-group col-md-6">
                                        <label>Cheque Status<span class="text-danger">*</span></label>
                                        <select required name="expense_cheque_status" id="expense_cheque_status" data-parsley-trigger="change" class="form-control form-control-sm">
                                            <option value="">-- Select Cheque Status --</option>
                                            <option value="Cleared">Cleared</option>
                                            <option value="Uncleared">Uncleared</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-row" id="expense_bank_row" style="display:none">
                                    <div class="form-group col-sm-6">
                                        <label> Bank<span class="text-danger">*</span></label>

                                        <select id="expense_bank" class="form-control form-control-sm" onchange="printBankDetails(this.value)" name="expense_bank">
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

                                <div class="form-row" id="expense_ref_row" style="display:none">
                                    <div class="form-group col-md-8">
                                        <label>Reference #</label>
                                        <input type="text" class="form-control form-control-sm" name="v_credits_ref_no" id="v_credits_ref_no" placeholder=" Reference Number(optional)" class="form-control" autocomplete="off" />
                                    </div>
                                </div>
								 
									
									<div class="form-row">
									<div class="form-group col-md-6">
									 <label >Payee type</label><span class="text-danger">*</span>
									 <select required id="expense_payee_type"
									 name="expense_payee_type" data-parsley-trigger="change"  class="form-control form-control-sm"  name="payeetype" >
										<option value="">Choose Type</option>
										<option value="Vendor">Vendor</option>
										<option value="Customer">Customer</option>
										<option value="Employee">Employee</option>
										<option value="Others">Others</option>									
									</select>
									</div>
									</div>
										
									<div class="form-row">
									<div class="form-group col-md-6">
									 <label >Payee</label><span class="icon lpanel-icon text-danger">*</span>
									  <input type="text" class="form-control form-control-sm" name="expense_payee"
									  id="expense_payee" placeholder="Enter Name of Supplier/Employee/Customer/Others" autocomplete="off" required>
									</div>
									</div>
                                    
                                    <div class="form-row">
									<div class="form-group col-md-6">
									<label > Invoice#</label><span class="text-danger"></span>
									  <input type="text" class="form-control form-control-sm" id="expense_invoice_no" name="expense_invoice_no" placeholder="Bill nos,..." autocomplete="off">
									</div>
									</div>									
									
									
									
									<div class="form-row">
									  <div class="form-group col-md-6">
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
									   <input type="text" class="form-control form-control-sm" name="expense_handler"
									   id="expense_handler" readonly class="form-control form-control-sm" value="<?php echo $rs['username']; ?>" />
									
									 </div>
									</div>


                                    
                                <div class="form-row">                                
                                    <div class="form-group col-md-4">									
                                        <label for="inputState">Status<span class="text-danger">*</span></label>
                                        <select class="form-control form-control-sm select2" required name="expense_status"  id="expense_status">
                                            <option value="Created">Created</option>
                                            <option value="Approved">Approved</option>
                                        </select>	
                                    </div>
                                </div>		
									
									<div class="form-row">
									<div class="form-group col-md-6">
                                        <textarea rows="3" class="form-control" name="expense_notes"  id="expense_notes" required placeholder="Add Expense  Notes"></textarea>
                                    </div>
									</div>
									
									
									<div class="form-row">
                                    <div class="col-md-12 float-right text-right">		
                                        <div class="btn-group" role="group">
                                            <!--a id="btnGroupDrop1" role="button" href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"-->
                                            <a id="btnGroupDrop1" role="button" href="#" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Choose Tax Method
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                <a class="dropdown-item" id="inclusive" >Inclusive of Tax</a>
                                                <a class="dropdown-item" id="exclusive" >Exclusive of Tax</a>
												<a class="dropdown-item" id="outofscopeoftax" >Out of Scope of Tax</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br/>
				
									 
<!--link  rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" /-->
<table  class="table table-hover small-text" id="tb">
<tr class="tr-header">
<th width="30%">Expense Category</th>
<th width="35%">Description</th>
<!-- <th width="10%">Qty</th> -->
<!-- <th width="15%"><i class="fa fa-rupee fonts" aria-hidden="true"><b>&nbsp;Rate</i></th> -->
<th width="30%" > <i class="fa fa-rupee fonts" aria-hidden="true"><b>&nbsp;Amount</b></i></th>
<!-- <th width="8%"> <i class="fa fa-rupee fonts" aria-hidden="true"><b>&nbsp;Discount</b></i></th>-->
<!-- <th width="20%"> GST@%</th>  -->
<!--th width="20%"> <i class="fa fa-rupee fonts" aria-hidden="true"><b>&nbsp;Total</b></i></th-->
<th><a href="javascript:void(0);" style="font-size:18px;" id="addMore" title="Add More Person">
<span class="fa fa-plus"></span></a></th>

</tr>
<tr>
	<td>
		<!--select name="accountname" class="form-control itemcode">
			<option value="" name="accountname" selected>-Select Category--</option>
			<?php $qr  = "SELECT * FROM expenseacctmaster ";
				  $exc = mysqli_query($dbcon,$qr)or die();
				  while($r = mysqli_fetch_array($exc)){ ?>
				  <option value="<?php echo $r['accountname']; ?>"><?php echo $r['accountname']; ?></option>
			<?php
				}
			?>
			
			<option value="Sticker">Sticker</option>
		</select-->
        
        <select name="expense_category" id="expense_category" class="form-control itemcode">
            <option value="" name="accountname" selected>-Select Category--</option>
  <optgroup label="OPERATING EXPENSE">
       <option value="Advertising & Marketting">Advertising & Marketting</option>
    <option value="Travel Expense">Travel Expense</option>
    <option value="Insurance">Insurance</option>
      <option value="IT & Internet Expense">IT & Internet Expense</option>
      <option value="Automobile Expense">Automobile Expense</option>
       <option value="Telephone">Telephone</option>
       <option value="Credit Card Expense">Credit Card Expense</option>
       <option value="Consultantant Expense">Consultantant Expense</option>
      <option value="Rent Expense">Rent Expense</option>
      <option value="Repairs & Maintenance">Repairs & Maintenance</option>
      
     
  </optgroup>
  <optgroup label="PAYROLL">
    <option value="Salaries & Wages">Salaries & Wages</option>
    <option value="Contrator Wages">Contrator Wages</option>
      <option value="Employeement Reimbursement">Employeement Reimbursement</option>
      <option value="Employee Advance">Employee Advance</option>
  </optgroup>
    <optgroup label="OFFICE">
    <option value="Office Supplies">Office Supplies</option>
    <option value="Printing & Stationaries">Printing & Stationaries</option>
    <option value="Cleaning">Cleaning</option>
  </optgroup>
 <optgroup label="ENERTAINMENT">
    <option value="Meals & Entertainment">Meals & Entertainment</option>
    </optgroup>
            
<optgroup label="HEALTH">
    <option value="Health Insurance">Health Insurance</option>
    <option value="Doctor Visit">Doctor Visit</option>
  </optgroup>
            
            <optgroup label="VOCATION/HOLIDAY">
    <option value="Airfare">Airfare</option>
    <option value="Accomadations">Accomadations</option>
    <option value="Accomadations">Food</option>
    <option value="Accomadations">Rental Car</option>
  </optgroup>
            
<optgroup label="OTHERS">
    <option value="Other Expense">Other Expense</option>
    </optgroup>


</select>
        
        
	</td>
								
									  
								  
	<td><input type="text" name="expense_desc" id="expense_desc" placeholder="Description"    data-id="" class="form-control hsncode"></td>
	<!-- <td><input type="text" name="qty"   placeholder="Qty" data-id="" class="form-control qty"></td>
	<td><input type="text" name="price" placeholder="Rate/Qty"    data-id="" class="form-control price"></td> -->
	<td><input type="text" name="expense_amount" id="expense_amount" placeholder="Amount" data-id="" 
    onkeypress="scrap_rowitem.update_math_vals_for_scrap();"   
    onkeyup="scrap_rowitem.update_math_vals_for_scrap();" class="form-control amount"></td>
	
	<!-- <td>                       
                                            <select class="form-control amount" id="taxname"  onchange="rowitem.update_math_vals('po');"; name="taxname" style="line-height:1.5;">
                                                <option data-type="single" value="0" selected>Open Taxrate</option>
                                                <?php 

                                                $sql = mysqli_query($dbcon, "SELECT id,taxname,taxrate,taxtype FROM taxmaster ");
                                                while ($row = $sql->fetch_assoc()){	
                                                    $taxname=$row['taxname'];
                                                    $taxrate=$row['taxrate'];
                                                    $taxtype=$row['taxtype'];
                                                    $taxid=$row['id'];
                                                    echo '<option data-type="'.$taxtype.'"  data-rate="'.$taxrate.'" value="'.$taxid.'" >'.$taxname.'</option>';
                                                }
                                                ?>
                                            </select>
                                        </td> -->
	
	<!-- <td><input type="text" name="discount[]" class="form-control discount" placeholder="Itm wise Disc"></td> -->
	<!--<td><input type="text" name="gst[]" placeholder="GST Rate%" data-id=""  class="form-control gst" ></td>
	<!--td><input type="text" name="total[]" class="form-control total" data-id="" placeholder="Item Total"></td-->
	<td><a href='javascript:void(0);'  class='remove'><span class='fa fa-trash'></span></a></td>
</tr>
</table>

<hr>
                                <div class="row">
                                    <div class="col-md-7"></div>
                                    
									<div class="col-md-5">

                                        <div class="col-md-12">
                                            <div class="row"><div class="col-md-8"><p class="h6">Sub Total: </p>
											</div>
												
                                                <div class="col-md-4 text-right"><span style="font-weight:600;"  class="lead text-danger" id="posubtotal">--</span>
												</div>	
												
                                            </div>

                                        </div>
									</div>
									
										
									<div class="col-md-7"></div>
                                    
                                    <div class="col-md-5">

                                        <div class="col-md-12">
                                            <div class="row"><div class="col-md-8"><p class="h6">Total Tax: </p>
                                             </div>
                                                
                                                <div class="col-md-4 text-right"><span style="font-weight:600;"  class="lead text-danger" id="tottax">--</span></div>	
                                            </div>

                                        </div>
									</div>
									
									<div class="col-md-7"></div>
                                    
                                    <div class="col-md-5">

                                        <div class="col-md-12">
                                            <div class="row"><div class="col-md-8"><p class="h6">Grand Total(Round off): </p>
                                             </div>
                                                
                                                <div class="col-md-4 text-right"><span style="font-weight:600;"  class="lead text-danger" id="grandtotal">--</span></div>	
                                            </div>

                                        </div>
									</div>
									
									</div>
									
								<br><br><br><br><br><br><br>
								
									
									
								<div class="form-row">
										<div class="form-group col-md-6">
										<?php if(isset($_GET['action'])&&$_GET['action']=='edit'){
                                      //    echo "<img src='upload/".$_GET['expense_no'].".jpg' width='100%' height='100px'/>";
										}?>
                                        <label> <div class="fa-hover col-md-12 col-sm-12">
                                           <span class="text-danger"><i class="fa fa-paperclip bigfonts" aria-hidden="true"></span></i>&nbsp;Attach Receipt<span class="text-danger">(not more than 1MB)</span></div>
                                        </label> 
                                        &nbsp;&nbsp;<input type="file" name="expense_file_src" id="expense_file_src"  name="image" class="form-control">
                                    </div>	
								
                                </div>

                                <div class="form-row mb-4">
                                <div class="col-md-6">
                                       <button type="button" id="expense_file_preview_btn" class="btn btn-danger mb-3">Remove</button>
                                       <img width="100%" id="expense_file_preview" height="0px" />
                                    </div>	
                                </div>
									
									
									
							                      <div class="form-row">
                                                    <div class="form-group text-right m-b-0">
                                                       &nbsp;&nbsp;&nbsp;&nbsp; <button class="btn btn-primary" name="submit" type="submit">
                                                            Submit
                                                        </button>
                                                        <button type="reset" onclick="location.href='listRecordExpenses.php'" name="cancel" class="btn btn-secondary m-l-5">
                                                            Cancel
                                                        </button>
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

</div>
<!-- END main -->

<script>

    var page_action = "<?php if(isset($_GET['action'])){ echo $_GET['action']; } ?>";
    var page_table = "<?php if(isset($_GET['type'])){ echo $_GET['type']; } ?>";
    var page_expense_no = "<?php if(isset($_GET['expense_no'])){ echo $_GET['expense_no']; } ?>";
    $('#expense_file_preview_btn').hide();


    var expense_bill = "";

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

    function togglePaymentDetailsOptions(paymentMode) {
        
            if (paymentMode == "Bank Transfer" || paymentMode == "Bank Remittance") {
                $('#expense_bank_row').show();
                $('#expense_cheque_status_row').hide();
                $('#vendor_bank_details').show();
                $('#expense_ref_row').hide();

            } else {
                $('#expense_bank_row').hide();
                $('#vendor_bank_details').hide();
            }

            if (paymentMode == "Cheque") {
                $('#expense_cheque_status_row').show();
                $('#expense_ref_row').show();
                $('#expense_bank_row').hide();
                $('#vendor_bank_details').hide();
                $('#expense_cheque_status').val('Uncleared');
            } else {
                $('#expense_cheque_status_row').hide();
                $('#expense_ref_row').hide();
            }

        }

$(function(){   




	$('#expense_file_src').change(function(e){
            expense_bill = e.target.files[0];
            if(expense_bill.size<20000000){
                let blobUrl =  URL.createObjectURL(expense_bill);
                $('#expense_file_preview').attr('src',blobUrl);
                $('#expense_file_preview').css('height','200px');
                $('#expense_file_preview_btn').show();
            }else{
                $('#expense_file_preview').css('height','0px');
                alert("image size greater than 20MB. coompress image and upload");
            }            
    });

    $('#expense_file_preview_btn').click(function(e){
            $('#expense_file_src').val('');
            expense_bill = "";
            $('#expense_file_preview').attr('src',"");
            $('#expense_file_preview_btn').hide();
            $('#expense_file_preview').css('height','0px');

    });


    $('#addMore').on('click', function() {
              var data = $("#tb tr:eq(1)").clone(true).appendTo("#tb");
              data.find("input").val('');
     });

     $(document).on('click', '.remove', function() {
         var trIndex = $(this).closest("tr").index();
            if(trIndex>1) {
             $(this).closest("tr").remove();
           } else {
             alert("Sorry!! Can't remove first row!");
           }
      });

	  if(page_action=="edit"){
            var edit_data = Page.get_edit_vals(page_expense_no,page_table,"expense_no");
            set_form_data(edit_data);
            if(edit_data.expense_file_src!=''){
                $('#expense_file_preview').attr('src',edit_data.expense_file_src);
                $('#expense_file_preview_btn').show();
                $('#expense_file_preview').css('height','200px');
            }

            $("#cancel-form").click(function(){
                if(page_action=="edit"){
                  location.href="listProductRawItems.php";
                }
            });
        }


		function set_form_data(data){

			$.each(data, function(index, value) {

				if(index=="id"||index=="expense_category"||index=="expense_desc"||index=="expense_amount" ||index=="expense_file_src"){
				}else if(index=="expense_items"){
					set_math_vals(JSON.parse(value));
				}else{
					$('#'+index).val(value);
				}
			}); 
		}

        function set_math_vals(po_items_json){
            var itemrowCount = po_items_json.length;
            var rowCount = $('#tb tr').length;
            var totalamt = 0;
                for(r=0;r<itemrowCount;r++){
                    if(r<itemrowCount-1){
                      var dataRow = $("#tb tr:eq(1)").clone(true).appendTo("#tb");
                    }
                    $('#tb tr').eq(r+1).find('#expense_category').val(po_items_json[r].expense_category);
                    $('#tb tr').eq(r+1).find('#expense_desc').val(po_items_json[r].expense_desc);
                    $('#tb tr').eq(r+1).find('#expense_amount').val(po_items_json[r].expense_amount);

                }

                scrap_rowitem.update_math_vals_for_scrap();
        }

	  $("form#add_expense_form").submit(function(e){
        e.preventDefault();

        var rowCount = $('#tb tr').length;
        var expense_items = [];
        var expense_total_amount = 0;

        for(i=1;i<rowCount;i++){ 

            var expense_category = $('#tb tr').eq(i).find('#expense_category option:selected').text();
            var expense_desc = $('#tb tr').eq(i).find('#expense_desc').val();
            var expense_amount = $('#tb tr').eq(i).find('#expense_amount').val();

			expense_items_ele = {
				expense_category:expense_category,
				expense_desc:expense_desc,
				expense_amount:+expense_amount
			}

			expense_items[expense_items.length] = expense_items_ele;

            expense_total_amount+= +expense_amount;
		}

	  var $form = $("#add_expense_form");
      var data = getFormData($form);

        function getFormData($form){
            var unindexed_array = $form.serializeArray();
            var indexed_array = {};

            $.map(unindexed_array, function(n, i){
                if(n['name']=="expense_amount"||n['name']=="expense_desc"||n['name']=="expense_category"){

                }else{
                    indexed_array[n['name']] = n['value'];
                }
            }); 

            return indexed_array;
        }

        data.expense_items = JSON.stringify(expense_items);

        var formData = new FormData();

        Object.keys(data).map((k)=>{
            formData.append(k,data[k])
        })

        formData.append("expense_file_src",expense_bill);
	    formData.append("expense_no",page_expense_no);
	    formData.append("action",page_action?page_action:"add");
	    formData.append("table","expenses");
	    formData.append("expense_total_amount",expense_total_amount);
        

		
        $.ajax ({
            url: 'workers/setters/save_expense.php',
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success:function(response){
                if(JSON.parse(response).status){
                   location.href="listRecordExpenses.php";
                 }
			}
        });
	  });

});      
</script>
