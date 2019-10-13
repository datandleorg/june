<?php include('header.php'); ?>
	<!-- End Sidebar -->
<?php
	$orgidUrl = "";
	$orgType = "";
	if(isset($_GET['orgid'])){ $orgidUrl = $_GET['orgid']; } 
	if(isset($_GET['orgtype'])){ $orgType = $_GET['orgtype']; } 

?>

    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">
					
						<div class="row">
									<div class="col-xl-12">
											<div class="breadcrumb-holder">
													<h1 class="main-title float-left">List Purchased Items</h1>
													<ol class="breadcrumb float-right">
														<li class="breadcrumb-item">Home</li>
														<li class="breadcrumb-item active">List Purchased Items</li>
													</ol>
													<div class="clearfix"></div>
											</div>
									</div>
						</div>
						<!-- end row -->
						<div class="row">
				
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">						
							<div class="card mb-3">
								<div class="card-header">
								
										
											<span class="pull-right">
										<a href="addPurchaseItemMaster.php" class="btn btn-primary btn-sm"><i class="fa fa-user-plus" aria-hidden="true"></i>
										Add Purchase Item</a></span>
								
									<h3><i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i><b> List Purchased Items </b></i></h3>
								</div>

								<div class="form-row px-3 py-2">
                                    <div class="form-group col-md-4">
                                        <label for="inputState">Filter By Company<i class="text-danger">*</i></label>
                                        <select id="compcode" 
										onchange="redirectTo(this)" class="form-control form-control-sm select2"  
										required name="orgid" required autocomplete="off">
                                            <option value="">Select Company</option>
                                            <?php 
											include("database/db_conection.php");//make connection here
											 $sql = "SELECT id as oid, orgid as orgid,concat(orgid,'-',orgname) as orgname,'self' as orgtype FROM comprofile
                                            UNION SELECT id as oid, custid as orgid,concat(custid,'-',custname) as orgname,'outsourced' as orgtype FROM customerprofile 
											WHERE custype='Partner'
										    ORDER BY oid ASC;
											";
                                            $exe = mysqli_query($dbcon,$sql); 
                                            while ($row = $exe->fetch_assoc()){	
                                                 $orgid=$row['orgid'];
												 $orgname=$row['orgname'];
												 $orgtype=$row['orgtype'];
												if($orgidUrl!='' && $orgidUrl===$orgid){
													echo '<option data-orgtype="'.$orgtype.'" selected  value="'.$orgid.'" >'.$orgname.' </option>';
												}else{
													echo '<option data-orgtype="'.$orgtype.'" value="'.$orgid.'" >'.$orgname.' </option>';

												}

                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>

								<div class="card-body">
									<div class="table-responsive">
									<table id="example1" class="table table-bordered table-hover display">
										<thead>
											<tr>
												<th>Company</th>
												<th>Item code</th>												
												<th>Item Name</th-->
												<th>Item Cost</th>
												<!--th>Taxrate></th-->	
												<!--th>Price</th-->
												<th>Stock on Hand</th>
												<th>UOM</th>
												<th>Stock Value</th>												
												<th>Created By</th>																							
												<th>Actions</th>
											</tr>
										</thead>										
										<tbody>
											<?php
													include("database/db_conection.php");//make connection here
													if($orgType=="self"){
														$sql = "SELECT p.id as id,p.*,c.*,c.orgname as orgname,c.orgid as orgid,p.handler as handler FROM purchaseitemaster p,comprofile c ";
														$sql.= $orgidUrl!=='' ? " WHERE p.orgid='".$orgidUrl."' AND p.orgid=c.orgid " :" WHERE p.orgid=c.orgid";
														$sql.= " ORDER BY p.id ASC ";

													}else if($orgType=="outsourced"){
														$sql = "SELECT p.id as id,p.*,c.*,c.custname as orgname,c.custid as orgid,p.handler as handler FROM purchaseitemaster p,customerprofile c ";
														$sql.= $orgidUrl!==''  ? " WHERE p.orgid='".$orgidUrl."' AND p.orgid=c.custid " : " WHERE p.orgid=c.custid";
														$sql.= " ORDER BY p.id ASC ";

													}else{
														$sql = "select p.id as id,p.entrytype,p.itemcost,p.itemcode,c.orgname,c.orgid,p.itemname,p.stockinqty,p.stockinuom,p.taxableprice
														,p.handler from purchaseitemaster p, comprofile c where p.orgid=c.orgid
														union 
														select p.id as id,p.entrytype,p.itemcost,p.itemcode,cus.custname,cus.custid,p.itemname,p.stockinqty,p.stockinuom,p.taxableprice
														,p.handler from purchaseitemaster p, customerprofile cus where p.orgid=cus.custid";
														$sql.= " ORDER BY id ASC ";
													}
                                                    
                      
													$result = mysqli_query($dbcon,$sql);
													if ($result->num_rows > 0){
													while ($row =$result-> fetch_assoc()){
													echo "<tr>";
													echo '<td>' .$row['orgid'] . ' - '.$row['orgname'].'</td>';
													echo '<td>' .$row['itemcode'] . '</td>';
													echo '<td>'.$row['itemname'].' </td>';
													echo '<td>'.$row['itemcost'].' </td>';
													echo '<td>'.$row['stockinqty'].' </td>';
													echo '<td>'.$row['stockinuom'].' </td>';
													//echo '<td>'.$row['taxableprice'].' </td>';
													
													echo '<td>'.$row['stockinqty']*$row['taxableprice'].' </td>';

													//echo '<td>'.$row['uom'].' </td>';													
													echo '<td>'.$row['handler'].' </td>';
													
													echo '<td><a href="addPurchaseItemMaster.php?entrytype='.$row['entrytype'].'&itemcode=' . $row['itemcode'] . '&type=purchaseitemaster&action=edit" class="btn btn-primary btn-sm" data-target="#modal_edit_user_5">
														<i class="fa fa-pencil" aria-hidden="true"></i></a>
													
													<a href="javascript:deleteRecord_8(' . $row['id'] . ');" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete">
													<i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
													echo "</tr>";
													}
													}
													?>						
															<script>


															function deleteRecord_8(RecordId)
															{
																if (confirm('Confirm delete')) {
																	window.location.href = 'deletePurchaseItemMaster.php?id='+RecordId;
																}
															}
													</script>
														
									</tbody>
									</table>
									</div>
									
								</div>														
							</div><!-- end card-->			
							</div>

<script>
     function redirectTo(ele){
		 console.log($(ele).val());
		 var orgid = $(ele).val();
		 var orgtype = $(ele).find('option:selected').attr('data-orgtype');
		 location.href='listPurchaseItemMaster.php?orgid='+orgid+'&orgtype='+orgtype;
	 }

</script>


<?php include('footer.php'); ?>