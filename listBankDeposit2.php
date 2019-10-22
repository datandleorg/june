<?php include('header.php');?>
	<!-- End Sidebar -->


    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">
					
						<div class="row">
									<div class="col-xl-12">
											<div class="breadcrumb-holder">
													<h1 class="main-title float-left">List Bank Deposits</h1>
													<ol class="breadcrumb float-right">
														<li class="breadcrumb-item">Home</li>
														<li class="breadcrumb-item active">List Bank Deposits</li>
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
										<a href="addBankDeposit.php" class="btn btn-primary btn-sm"><i class="fa fa-user-plus" aria-hidden="true"></i>
										Add Bank Deposit</a></span>
										
									<h3><i class="fa fa-th-list bigfonts" aria-hidden="true"></i>&nbsp;List Bank Credits/Deposits</h3>
								</div>
								
								<div class="card-body">
									<div class="table-responsive">
									<table id="example1" class="table table-bordered table-hover display">
										<thead>
											<tr>
												  	 <tr>
												  <th >TransID</th>
													<th >Date</th>
													<th>Org ID</th>
													<th>Bank</th>
													<th>A/C No</th>
													<th>Payment Method</th>
													<th>Reference#</th>
													<th>User</th>
													<th>Amount</th>
													<th>Actions</th>
													</tr>
										</thead>										
										<tbody>
											<?php
													include("database/db_conection.php");//make connection here
													$sql = "SELECT * FROM bankdeposit ";
													$result = mysqli_query($dbcon,$sql);
													
													if ($result->num_rows > 0){
													while ($row =$result-> fetch_assoc()){
														$row_id=$row['id'];
													echo "<tr>";
													echo '<td>' . $row['transid'] . '</td>';
													echo '<td>'.$row['depositdate'].'<br /></td>';
													echo '<td>'.$row['compcode'].'</td>';													
													echo '<td>'.$row['bankname'].'</td>';
													echo '<td>'.$row['acctno'].'</td>';													
													echo '<td>'.$row['paymethod'].'</td>';
													echo '<td>'.$row['referenceno'].'</td>';													
													echo '<td>'.$row['createdby'].'</td>';
													echo '<td>'.$row['amount'].'</td>';
													
													
													
													
													echo '<td><a href="editBankDeposit.php?id=' . $row['id'] . '" class="btn btn-primary btn-sm" data-target="#modal_edit_user_5">
														<i class="fa fa-pencil" aria-hidden="true"></i></a>
													
													<a onclick="delete_record(this);" id="deletebankDeposit" data-id="' . $row_id . '" class="btn btn-danger btn-sm"  data-title="Delete">
													<i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                                                echo "</tr>";
                                            }
                                        }
                                        ?>						
                                        <script>
                                            function delete_record(x)
                                            {
                                                console.log(x);
                                                 var row_id = $(x).attr('data-id');
                                               alert(row_id);
                                                if (confirm('Confirm delete')) {
                                                  window.location.href = 'deleteBankDeposit.php?id='+row_id;
                                               }
                                            }
											 </script>
									</tbody>
									</table>
									
									</div>
									
								</div>		
							
							</div><!-- end card-->			
							</div>

<?php include('footer.php');?>