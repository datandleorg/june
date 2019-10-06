<?php
include("database/db_conection.php");//make connection here

	
	/*$con = mysqli_connect("localhost","root","root","dhirajpro");
	// Check connection
	if(mysqli_connect_errno()){
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}*/

if(isset($_POST['submit']))
{	$itemcode ="";
	$prefix = "DAPL00";
	//$postfix = "/";
	//$today = date("dmy");
    $itemname=$_POST['itemname'];//here getting result from the post array after submitting the form.
	$vendor=$_POST['vendor'];//same
    $description=$_POST['description'];//same
	//$category=$_POST['category'];//same
    //$status 	=$_POST['status'];
    $priceperqty 		=$_POST['priceperqty'];
    $uom 		=$_POST['uom'];
    $taxmethod 		=$_POST['taxmethod'];
    $taxname	=$_POST['taxname'];
	$hsncode =$_POST['hsncode'];
    $pricedatefrom 	=$_POST['pricedatefrom'];
    $stockinqty 	=$_POST['stockinqty'];
    $stockinuom	=$_POST['stockinuom'];
	$lowstockalert	=$_POST['lowstockalert'];
	$stockasofdate =$_POST['stockasofdate'];
	//$qtyondemand=$_POST['qtyondemand'];
    //$usageunit =$_POST['usageunit'];
    $handler 	=$_POST['handler'];
	$notes = $_POST['notes'];
	$disptaxrate = $_POST['disptaxrate'];
	$disptax = $_POST['disptax'];
	$product_price = $_POST['product_price'];
	$final_price = $_POST['final_price'];
	

	
	
   $sql="SELECT MAX(id) as latest_id FROM purchaseitemaster ORDER BY id DESC";
	if($result = mysqli_query($dbcon,$sql)){
		$row   = mysqli_fetch_assoc($result);
		if(mysqli_num_rows($result)>0){
			$maxid = $row['latest_id'];
			$maxid+=1;
			
			$itemcode = $prefix.$maxid;
		}else{
			$maxid = 0;
			$maxid+=1;
			$itemcode = $prefix.$maxid;
		}
	}
	$sql = "INSERT into purchaseitemaster(`itemcode`,
										`itemname`,
										`vendor`,
										`description`,
										`priceperqty`,
										`uom`,
										`taxmethod`,
										`taxname`,
										`taxrate`,
										`taxamount`,
										`itemcost`,
										`taxableprice`,
										`hsncode`,
										`pricedatefrom`,
										`stockinqty`,
										`stockinuom`,
										`lowstockalert`,
										`stockasofdate`,
										`handler`,
										`notes`)
								VALUES ('$itemcode',
								        '$itemname',
										'$vendor',
										'$description',
										'$priceperqty',
										'$uom',
										'$taxmethod',
										'$taxname',
										'$disptaxrate',
										'$disptax',
										'$product_price', 
										'$final_price',
										'$hsncode',
										'$pricedatefrom',
										'$stockinqty',
										'$stockinuom',
										'$lowstockalert',
										'$stockasofdate',
						                '$handler',
										'$notes')";
									  
   // Inserting Log details into purchaseitemlog
	$sql1= "INSERT into purchaseitemlog(`itemcode`,
										`itemname`,
										`oldpriceqty`,
										`olduom`,
										`oldstock`,
										`taxmethod`,
										`taxname`,
										`taxrate`,
										`taxamount`,
										`itemcost`,
										`taxableprice`,
										`hsncode`,
										`createdby`,
										`createdon`,
										`stockasofdate`,
										`notes`)
								VALUES ('$itemcode',
										'$itemname',
										'$priceperqty',
										'$uom',
										'$stockinqty',
										'$taxmethod',
										'$taxname',
										'$disptaxrate',
										'$disptax',
										'$product_price', 
										'$final_price',
										'$hsncode',
										'$handler',
										'$pricedatefrom',
										'$stockasofdate',
										'$notes')";

//echo "$insert_purchaseItemMaster";	
										
   if(mysqli_query($dbcon,$sql)&& mysqli_query($dbcon,$sql1))
	{
		header("location:listPurchaseItemMaster.php");
    }   else {
		die('Error: ' . mysqli_error($dbcon));
	    echo "<script>alert('User creation unsuccessful ')</script>";
	}
}

?>
<?php include('header.php');?>
	<!-- End Sidebar -->

   
    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">

					
										<div class="row">
					<div class="col-xl-12">
							<div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Purchase Item Master</h1>
                                    <ol class="breadcrumb float-right">
										<li class="breadcrumb-item">Home</li>
										<li class="breadcrumb-item active">Purchase Item Master</li>
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

			
			<div class="row">					
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">					
						<div class="card mb-3">
							<div class="card-header">
								<!--h3><i class="fa fa-check-square-o"></i>Create Company </h3-->
								<h3><class="fa-hover col-md-12 col-sm-12">
								<i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i> Purchase Item Master
								</h3>
							</div>
							<div class="card-body">
								
								<!--form autocomplete="off" action="#"-->
								<form autocomplete="off" action="#" enctype="multipart/form-data" method="post">
									
									<div class="form-row">
										<div class="form-group col-md-6">
											<label></i>Item Name<span class="text-danger">*</span></label>
											<input type="text" class="form-control form-control-sm" name="itemname" placeholder="Product Name" required class="form-control" autocomplete="off" />
										</div>
									</div>
									
								<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputState">Category</label>
											<select id="category" onchange="onvendor(this);" class="form-control form-control-sm"  required name="category" autocomplete="off">
												<option selected>Select Category</option>
												<?php 
												include("database/db_conection.php");//make connection here
												$sql = mysqli_query($dbcon,"SELECT code,category FROM itemcategory
																			ORDER BY id ASC
																			");
												  while ($row = $sql->fetch_assoc()){	
													echo $category_code=$row['code'];
													echo $category=$row['category'];
													echo '<option onchange="'.$row[''].'" value="'.$category_code.'" >'.$category.'</option>';
												  
												  }
												?>
											</select>
										</div>
									</div>
									
									<!--div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputState">Vendor Name</label>
											<select id="compcode" onchange="onvendor(this);" class="form-control form-control-sm"  required name="vendor" autocomplete="off">
												<option selected>Open Vendors</option>
												<?php 
												include("database/db_conection.php");//make connection here
												$sql = mysqli_query($dbcon,"SELECT concat(title,' ',supname) as vendor FROM vendorprofile
																			ORDER BY id ASC
																			");
												  while ($row = $sql->fetch_assoc()){	
													echo $vendor=$row['vendor'];
													echo '<option onchange="'.$row[''].'" value="'.$vendor.'" >'.$vendor.'</option>';
												  
												  }
												?>
											</select>
										</div>
									</div-->
									  
									<div class="form-row">
										<div class="form-group col-md-6">
											<label>Description</label></span>
											<input type="text"  class="form-control form-control-sm" name="description" placeholder="add product description" />
										</div>
									</div>
									
									<div class="form-row">
										<div class="form-group col-md-6">
											<h5>Purchase Price Information</h5>
										</div>
									</div>
									
									<div class="form-row">
										<div class="form-group col-md-3">
											<i class="fa fa-rupee fonts" aria-hidden="true"></i>
											<label>Item Cost/Qty<span class="text-danger">*</label></span>
											<input type="text" onchange="gettaxrate()" name="priceperqty" id="priceperqty" class="form-control form-control-sm"  required placeholder="Price Per Qty" autocomplete="off" />
										</div>
									
									<div class="form-group col-md-3">
									            <label>UOM&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" 
										  data-trigger="focus" data-placement="top" title="The Item will be measured in terms of this UNIT(e.g.:Kgs,dozen,box"></i>
											<span class="text-danger"></label>
                                                <select id="uom" onchange="gettaxrate()" required class="form-control form-control-sm" name="uom">
                                                    <option value="0" selected>Select UOM</option>
                                                    <?php 
                                                    include("database/db_conection.php");//make connection here

                                                    $sql = mysqli_query($dbcon, "SELECT code,description FROM uom_lookups ");
                                                    while ($row = $sql->fetch_assoc()){	
                                                         $description=$row['description'];
														 $code=$row['code'];
                                                      echo '<option  value="'.$code.'" >'.$description.'</option>';
                                                    }
                                                    ?>
                                                </select>	
									</div>							
									</div>
									
									
									<div class="form-row">
									<div class="form-group col-md-6">
									 <label>As of Date<span class="text-danger">*</label>
									 <i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" 
										  data-trigger="focus" data-placement="top" title="As of Date is price as on date"></i>
									  <input type="date" class="form-control form-control-sm"  name="pricedatefrom" value="<?php echo date("Y-m-d");?>">					  
								  </div>
								   </div>											
											
									
									<div class="form-row">
									<div class="form-group col-md-3">
									  <label for="inputState">Tax Method
									 </label>
									  <select id="taxmethod" onchange="gettaxrate()" class="form-control form-control-sm" name="taxmethod">
										<option selected>Select Tax Method</option>
										<option value="1">Inclusive</option>
										<option value="0">Exclusive</option>
									</select>
									</div>
									
							
								
									<div class="form-group col-md-3">
									            <label for="inputState">Tax Name</label>
                                                <select id="taxname" onchange="gettaxrate()" required class="form-control form-control-sm" name="taxname">
                                                    <option value="0" selected>Open Taxrate</option>
                                                    <?php 
                                                    include("database/db_conection.php");//make connection here

                                                    $sql = mysqli_query($dbcon, "SELECT taxname,taxrate FROM taxmaster ");
                                                    while ($row = $sql->fetch_assoc()){	
                                                         $taxname=$row['taxname'];
                                                         $taxrate=$row['taxrate'];
                                                        echo '<option  value="'.$taxrate.'" >'.$taxname.'</option>';
                                                    }
                                                    ?>
                                                </select>	
									</div>							
								</div>
								
								<div class="form-row">
									<div class="form-group col-md-3">
										<!-- <i class="fa fa-rupee fonts" aria-hidden="true"></i> -->
										<label>Tax Rate %<span class="text-danger">*</label></span>
										<input type="text" name="disptaxrate" id="disptaxrate" class="form-control form-control-sm"  required placeholder="Price Per Qty" autocomplete="off" readonly>
									</div>
																		
									<div class="form-group col-md-3">									
									<label>Tax Amount&nbsp;<span class="text-danger"><i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" 
									  data-trigger="focus" data-placement="top" title="The Item will be measured in terms of this uint(e.g.:Kgs,dozen,box"></i>
									 <span class="text-danger"></label>
									<input type="text" name="disptax" id="disptax" class="form-control form-control-sm" autocomplete="off" placeholder="Tax Amount" required readonly />
									 </div>
									 </div>
									 
									 <div class="form-row">
									 <div class="form-group col-md-3">
										<i class="fa fa-rupee fonts" aria-hidden="true"></i>
										<label>Actual Product Price<span class="text-danger">*</label></span>
										<input type="text" name="product_price" id="product_price" class="form-control form-control-sm"  required placeholder="Actual Product price" autocomplete="off" readonly />
									</div>
									
									<div class="form-group col-md-3">									
									<label>Final Price&nbsp;<span class="text-danger"><i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" 
									  data-trigger="focus" data-placement="top" title="The Item will be measured in terms of this uint(e.g.:Kgs,dozen,box"></i>
									 <span class="text-danger"></label>
									<input type="text" name="final_price" id="final_price" class="form-control form-control-sm" autocomplete="off" placeholder="Price Including Tax" required readonly>
									 </div>
									</div>
																		
									<div class="form-row">
									<div class="form-group col-md-6">
									 <label>HSN Code</label>
									  <input type="text" name="hsncode" class="form-control form-control-sm"  placeholder="Enter a valid HSN Code.." required >
								   </div>
								   </div>														   
							
								   	<div class="form-row">
										<div class="form-group col-md-6">
											<h5>Sales Price Information</h5>
										</div>
									</div>
								
								   
								   	<div class="form-row">
										<div class="form-group col-md-3">
											<i class="fa fa-rupee fonts" aria-hidden="true"></i>
											<label>Sales Price/Qty<span class="text-danger">*</label></span>
											<input type="text" onchange="getstaxrate()" name="salespriceperqty" id="salespriceperqty" class="form-control form-control-sm"  required placeholder="Sales Price Per Qty" autocomplete="off" />
										</div>
										
										
										<!--div class="form-group col-md-3">									
											<label>UOM&nbsp;<span class="text-danger"><i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" 
										  data-trigger="focus" data-placement="top" title="The Item will be measured in terms of this uint(e.g.:Kgs,dozen,box"></i>
											<span class="text-danger"></label>
											<input type="text" name="suom" class="form-control form-control-sm" autocomplete="off" placeholder="Eg.Litters,Kgs.." required />
										</div>
									</div-->
									
									<div class="form-group col-md-3">
									            <label>UOM&nbsp;<i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" 
										  data-trigger="focus" data-placement="top" title="The Item will be measured in terms of this UNIT(e.g.:Kgs,dozen,box"></i>
											<span class="text-danger"></label>
                                                <select id="suom"  required class="form-control form-control-sm" name="suom">
                                                    <option value="0" selected>Select UOM</option>
                                                    <?php 
                                                    include("database/db_conection.php");//make connection here

                                                    $sql = mysqli_query($dbcon, "SELECT code,description FROM uom_lookups ");
                                                    while ($row = $sql->fetch_assoc()){	
                                                         $description=$row['description'];
														 $code=$row['code'];
                                                      echo '<option  value="'.$code.'" >'.$description.'</option>';
                                                    }
                                                    ?>
                                                </select>	
									</div>							
									</div>
																		
									
									<div class="form-row">
									<div class="form-group col-md-3">
									  <label for="inputState">Tax Method
									 </label>
									  <select id="staxmethod" onchange="getstaxrate()" class="form-control form-control-sm" name="staxmethod">
										<option selected>Select Tax Method</option>
										<option value="1">Inclusive</option>
										<option value="0">Exclusive</option>
									</select>
									</div>
							
								
									<div class="form-group col-md-3">
									            <label for="inputState">Tax Name</label>
                                                <select id="staxname" onchange="getstaxrate()" required class="form-control form-control-sm" name="staxname">
                                                    <option value="0" selected>Open Taxrate</option>
                                                    <?php 
                                                    include("database/db_conection.php");//make connection here

                                                    $sql = mysqli_query($dbcon, "SELECT taxname,taxrate FROM taxmaster ");
                                                    while ($row = $sql->fetch_assoc()){	
                                                         $staxname=$row['taxname'];
                                                         $staxrate=$row['taxrate'];
                                                        echo '<option  value="'.$staxrate.'" >'.$staxname.'</option>';
                                                    }
                                                    ?>
                                                </select>	
									</div>							
								</div>
								
								<div class="form-row">
									<div class="form-group col-md-3">
										<!-- <i class="fa fa-rupee fonts" aria-hidden="true"></i> -->
										<label>Tax Rate %<span class="text-danger">*</label></span>
										<input type="text" name="sdisptaxrate" id="sdisptaxrate" class="form-control form-control-sm"  required placeholder="Price Per Qty" autocomplete="off" readonly>
									</div>
																		
									<div class="form-group col-md-3">									
									<label>Tax Amount&nbsp;<span class="text-danger"><i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" 
									  data-trigger="focus" data-placement="top" title="The Item will be measured in terms of this uint(e.g.:Kgs,dozen,box"></i>
									 <span class="text-danger"></label>
									<input type="text" name="sdisptax" id="sdisptax" class="form-control form-control-sm" autocomplete="off" placeholder="Tax Amount" required readonly />
									 </div>
									 </div>
									 
									 <div class="form-row">
									 <div class="form-group col-md-3">
										<i class="fa fa-rupee fonts" aria-hidden="true"></i>
										<label>Actual Product Price<span class="text-danger">*</label></span>
										<input type="text" name="sproduct_price" id="sproduct_price" class="form-control form-control-sm"  required placeholder="Actual Product price" autocomplete="off" readonly />
									</div>
									<div class="form-group col-md-3">									
									<label>Final Price&nbsp;<span class="text-danger"><i class="fa fa-question-circle-o bigfonts" aria-hidden="true" data-toggle="popover" 
									  data-trigger="focus" data-placement="top" title="The Item will be measured in terms of this uint(e.g.:Kgs,dozen,box"></i>
									 <span class="text-danger"></label>
									<input type="text" name="sfinal_price" id="sfinal_price" class="form-control form-control-sm" autocomplete="off" placeholder="Price Including Tax" required readonly>
									 </div>
									</div>
																		
								   
								    <div class="form-row">
									<div class="form-group col-md-6">
									  <h5>Stock Information</h5>
									  </div>
									</div>
									
									<div class="form-row">
									<div class="form-group col-md-3">
									 <label>Initial Qty on Hand<span class="text-danger">*</label></span>
									 <input type="text" class="form-control form-control-sm" name="stockinqty" placeholder="Current Stock in quantity" required autocomplete="off">
									</div>
									 
								
									 <div class="form-group col-md-3">
									 <div class="invoice-title text-left mb-6">
									 <label>Oty in UOM</label>
									 <input type="text" class="form-control form-control-sm" name="stockinuom" placeholder="Unit of Measure, like boxes,kgs.."  required class="form-control" autocomplete="off">
									 </div>
									 </div>
									 </div>
							
									  
									  
									 <div class="form-row">
									<div class="form-group col-md-3">									  
									  <label>Low Stock Alert</label>
									  <input type="text" class="form-control form-control-sm" name="lowstockalert" placeholder="eg., 5  or 10 "  required class="form-control" autocomplete="off">
									</div>
									
									<div class="form-group col-md-3">
									<label for="inputState">As of Date</label>									
									  <input type="date" class="form-control form-control-sm"  name="stockasofdate" value="<?php echo date("Y-m-d");?>">		
									</div>
									</div>
									
									<div class="form-row">
									<div class="form-group col-md-6">
									  <label for="inputState">Handler</label>
									  <select id="taxrate" onchange="onusername(this)" class="form-control form-control-sm" name="handler">
                                                    <option selected>Select Username</option>
                                                    <?php 
                                                    include("database/db_conection.php");//make connection here

                                                    $sql = mysqli_query($dbcon, "SELECT username FROM userprofile ORDER by id ASC");
                                                    while ($row = $sql->fetch_assoc()){	
                                                        echo $username=$row['username'];
                                                        echo '<option onchange="'.$row[''].'" value="'.$username.'" >'.$username.'</option>';
                                                    }
                                                    ?>
                                                </select>
									  </div>
									  </div>
									  
									
									<div class="form-row">
									<div class="form-group col-md-6">
									  <h5>Notes Information</h5>
									  </div>
									</div>
									
								
									
									<div class="form-row">
									<div class="form-group col-md-6">
									 <label>Add Notes</label></span>
									  <textarea rows="2" class="form-control editor" id="notes" name="notes" placeholder="add product/price/stock related notes here"></textarea>
									</div> 
								</div>
									
							
									
									<div class="form-row">
								    <div class="form-group text-right m-b-12">
                                                       <input type="hidden" name="id" >
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
	<!-- BEGIN Java Script for this page -->
<script>
	function gettaxrate(){
		var taxrate = document.getElementById('taxname').value;
		var taxmethod = document.getElementById('taxmethod').value;
		var price   = document.getElementsByName('priceperqty')[0].value;
		var product_price = 0;
		
		//alert(taxrate+"---"+price);
		if(taxrate == "" || taxrate == null){
			taxrate = 0;
		}
		if(price == "" || price == null ){
			price = 0;
		}
		calcPrice   = (price - ( price * taxrate / 100 )).toFixed(2);
		percentagedval = (parseFloat(price)-parseFloat(calcPrice)).toFixed(2);
		
		if(taxmethod=='1'){
			product_price = price-percentagedval;
			
		}else{
			product_price = price;
			price = parseFloat(price)+parseFloat(percentagedval);
		}
		
		$('#disptaxrate').val(taxrate);
		$('#disptax').val(percentagedval);
		
		$('#final_price').val(price);
		$('#product_price').val(product_price);
		
		//alert("Percentage="+percentagedval);
	}
	$('document').ready(function(){
		
	});
</script>

<script>
	function getstaxrate(){
		var staxrate = document.getElementById('staxname').value;
		var staxmethod = document.getElementById('staxmethod').value;
		var sprice   = document.getElementsByName('salespriceperqty')[0].value;
		var sproduct_price = 0;
		
		//alert(taxrate+"---"+price);
		if(staxrate == "" || staxrate == null){
			staxrate = 0;
		}
		if(sprice == "" || sprice == null ){
			sprice = 0;
		}
		calcPrice   = (sprice - ( sprice * staxrate / 100 )).toFixed(2);
		percentagedval = (parseFloat(sprice)-parseFloat(calcPrice)).toFixed(2);
		
		if(staxmethod=='1'){
			sproduct_price = sprice-percentagedval;
			
		}else{
			sproduct_price = sprice;
			sprice = parseFloat(sprice)+parseFloat(percentagedval);
		}
		
		$('#sdisptaxrate').val(staxrate);
		$('#sdisptax').val(percentagedval);
		
		$('#sfinal_price').val(sprice);
		$('#sproduct_price').val(sproduct_price);
		
		//alert("Percentage="+percentagedval);
	}
	$('document').ready(function(){
		
	});
</script>
							
									
	<?php include('footer.php');?>

