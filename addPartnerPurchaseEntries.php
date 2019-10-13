<?php include('header.php');?>
<?php

$entryType = "";
if(isset($_GET['entrytype'])){$entryType = $_GET['entrytype'];}

$orgidUrl = "";
if(isset($_GET['orgid'])){ $orgidUrl = $_GET['orgid']; } 
?>
	<!-- End Sidebar -->

    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">

					
										<div class="row">
					<div class="col-xl-12">
							<div class="breadcrumb-holder">
								<h1 class="main-title float-left"><i class="fa fa-shopping-basket bigfonts">Partner Entries Data Input Form</i></h1>
                                    <ol class="breadcrumb float-right">
									<a  href="index.php"><li class="breadcrumb-item">Home</a>
										<li class="breadcrumb-item active"> Partner Entries</li>
                                    </ol>
                                    <div class="clearfix"></div>
                            </div>
					</div>
			</div>
            <!-- end row -->


			
			<div class="row">
			
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-8">						
						<div class="card mb-3">
							<div class="card-header">
								<p>Add Partner Entries </p>
							</div>
								
							<div class="card-body p-4">
								
								<form id="add_partnerentries_form" autocomplete="off" enctype="multipart/form-data" method="post">
								

									<div class="form-row">
                                     <div class="form-group col-md-6">
                                        <label for="inputState">Select Partner<i class="text-danger">*</i></label>
                                        <select data-entry="<?php echo $entryType;?>"
                                        
                                        <?php if(isset($_GET['action']))
                                         {
                                            echo  $_GET['action']=="edit" ? 'readonly class="form-control form-control-sm" ' : 'class="form-control form-control-sm select2';
                                         }else{
                                             echo ' class="form-control form-control-sm select2"  ';
                                         }
                                        ?>  
                                        id="pe_orgid" name="pe_orgid"
                                        onchange="redirectTo(this.name)"
                                        required required autocomplete="off">
                                              <option selected>--Select Partner--</option>
                                            <?php
                                            $sql = mysqli_query($dbcon,"SELECT custid as orgid,custname as orgname FROM customerprofile where custype='Partner' ");
                                            while ($row = $sql->fetch_assoc()){	
                                                $orgid=$row['orgid'];
                                                $orgname=$row['orgname'];
                                                if($orgidUrl!='' && $orgidUrl===$orgid){
													echo '<option selected data-orgname="'.$orgname.'" value="'.$orgid.'" >'.$orgname.' </option>';
												}else{
													echo '<option data-orgname="'.$orgname.'" value="'.$orgid.'" >'.$orgname.' </option>';
												}
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
								 
                                    

                                <table  class="table table-hover small-text" id="tb">
                                    <tr class="tr-header">
                                        <th width="40%">Item Details</th>
                                        <th width="20%">Qty</th>
                                        <th width="30%">Unit</th>
                                        <th width="10%"><a href="javascript:void(0);" 
                                        style="font-size:18px;" id="addMore" title="Add More Person">
                                         <span class="fa fa-plus-circle"></span></a></th>
 
                                    </tr>
                                    <tr>
                                        <td>
                                            <select onChange="setUom('purchaseitemaster',this)" name="itemcode" class="form-control form-control-sm itemcode" id="item_select">
                                                <option value="" selected>Select Raw materials</option>
                                                <?php 
                                            include("database/db_conection.php");//make connection here
                                       
                                             $sql = "SELECT itemcode,concat(itemcode,'-',itemname) as itemname FROM purchaseitemaster p where p.orgid='".$orgidUrl."' ";            
                                  
                                             $exe = mysqli_query($dbcon,$sql);
                                            while ($row = $exe->fetch_assoc()){	
                                                 $itemcode=$row['itemcode'];
                                                 $itemname=$row['itemname'];
                                                 
                                                echo  $orgidUrl!='' ? '<option data-item="'.$itemname.'"  value="'.$itemcode.'" >'.$itemname.' </option>' : '';

                                            }
                                            ?>
                                            </select>
                                        </td>

                                        <td><input id="qty" type="text" name="qty" placeholder="Qty" data-id="" class="form-control form-control-sm qty"></td>                                        <td>
                                        <select class="form-control form-control-sm amount" id="uom" name="uom" style="line-height:1.5;">
                                            <option value="" selected>Open Unit</option>
                                            <?php 
                                            $sql = mysqli_query($dbcon, "SELECT * FROM uom ");
                                            while ($row = $sql->fetch_assoc()){	
                                                echo '<option  value="'.$row['code'].'">'.$row['description'].'</option>';
                                            }
                                            ?>
                                        </select>
                                        </td>
                                        <td><a href='javascript:void(0);'  class='remove'><span class='fa fa-trash'></span><b></b></a></td>
                                    </tr>
                                </table>

                                
								<div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputState">Handler</label>
                                        <?php 
                                        //session_start();
                                        include("database/db_conection.php");
                                        $userid = $_SESSION['userid'];
                                        $sq = "select username from userprofile where id='$userid'";
                                        $result = mysqli_query($dbcon, $sq) or die(mysqli_error($dbcon));
                                        //$count = mysqli_num_rows($result);
                                        $rs = mysqli_fetch_assoc($result);
                                        ?>
                                        <input type="text" class="form-control form-control-sm" name="pe_handler" readonly class="form-control form-control-sm" value="<?php echo $rs['username']; ?>" required />

                                    </div>
                                </div>

	
									<div class="form-row">
								    <div class="form-group text-right m-b-10">
                                                       &nbsp;<button class="btn btn-primary" name="submit" type="submit">
                                                            Submit
                                                        </button>
                                                        <button type="reset" name="cancel" class="btn btn-secondary m-l-5" onclick="location.href='listProductRawItems.php'">Cancel
                                                        </button>
                                                    </div>
													</div>
													
								</form>
							<!--div style="color:green; font-weight:700;"><?php echo $itemNotFound;?></div-->
			           	    <!--div style="color:red; font-weight:700;"><?php echo $itemfound;?></div-->
								
								</div>
								</div>
								</div>
								
								
								
		      </div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

    </div>
	<!-- END content-page -->
	
    


</div>
<!-- END main -->


<script>
    var page_action = "<?php if(isset($_GET['action'])){ echo $_GET['action']; } ?>";
    var page_table = "<?php if(isset($_GET['type'])){ echo $_GET['type']; } ?>";
    var page_pe_code = "<?php if(isset($_GET['pe_code'])){ echo $_GET['pe_code']; } ?>";

    var error = false;

        $('#addMore').on('click', function() {
            var data = $("#tb tr:eq(1)").clone(true).appendTo("#tb");
            data.attr("id",);
            data.find("input").val('');
        });

        $(document).on('click', '.remove', function() {
            var trIndex = $(this).closest("tr").index();
            if(trIndex>1) {
                $(this).closest("tr").remove();
                rowitem.update_math_vals('po');
            } else {
                alert("Sorry!! Can't remove first row!");
            }
        });

        function redirectTo(select){
            redirectOrgid = $('#'+select).val();

            if(page_action!==""){
                location.href="addPartnerPurchaseEntries.php?pe_code="+page_pe_code+"&action="+page_action+"&type="+page_table+"&orgid="+redirectOrgid;
            }else{
                location.href="addPartnerPurchaseEntries.php?orgid="+redirectOrgid;
            }
        }


        if(page_action=="edit"){
            var edit_data = Page.get_edit_vals(page_pe_code,page_table,"pe_code");
            set_form_data(edit_data);

            $("#cancel-form").click(function(){
                if(page_action=="edit"){
                  location.href="listProductRawItems.php";
                }
            });
        }

        function setUom(table,ele){
            var itemCode = $(ele).val();
            var itemData = Page.get_edit_vals(itemCode,table,"itemcode");
            $(ele).closest('tr').find('#uom').val(itemData.stockinuom);
        }
           
        function set_form_data(data){

            $.each(data, function(index, value) {

                if(index=="id"||index=="rw_code"){
                }else if(index=="pe_items"){
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
                    $('#tb tr').eq(r+1).find('#item_select').val(po_items_json[r].item);
                    $('#tb tr').eq(r+1).find('#qty').val(po_items_json[r].qty);
                    $('#tb tr').eq(r+1).find('#uom').val(po_items_json[r].uom);

                }
        }

        $("form#add_partnerentries_form").submit(function(e){
        e.preventDefault();


        var rowCount = $('#tb tr').length;
        var pe_items = [];

        for(i=1;i<rowCount;i++){ 
            var item_select = $('#tb tr').eq(i).find('#item_select').val();
            var itemname = $('#tb tr').eq(i).find('#item_select').find(":selected").attr('data-item');
            var uom = $('#tb tr').eq(i).find('#uom').val();
            var qty = $('#tb tr').eq(i).find('#qty').val();

            pe_items_ele = {
                item:item_select,
                itemname:itemname,
                uom:uom,
                qty:qty
            }; 

            pe_items.push(pe_items_ele);
        }

        var $form = $("#add_partnerentries_form");
        var data = getFormData($form);

        function getFormData($form){
            var unindexed_array = $form.serializeArray();
            var indexed_array = {};

            $.map(unindexed_array, function(n, i){
                if(n['name']=="itemcode"||n['name']=="qty"||n['name']=="uom"){

                }else{
                    indexed_array[n['name']] = n['value'];
                }
            }); 

            return indexed_array;
        }

        data.pe_items = JSON.stringify(pe_items);

        var compname = $('#pe_orgid option:selected').attr('data-orgname');
        var orgid = $('#pe_orgid').val();


        if(!error){
                    $.ajax ({
                    url: 'workers/setters/save_partnerentries.php',
                    type: 'post',
                    data: {array : JSON.stringify(data),
                    compname:compname,
                    orgid:orgid,
                    pe_code:page_pe_code,
                    action:page_action?page_action:"add",table:"partnerentries"},
                    dataType: 'json',
                    success:function(response){
                        if(response.status){
                          location.href="listPartnerPurchaseEntries.php";
                        }
                    }

                });
        }else{
            alert("errors found");
        }


        });
</script>

<?php include('footer.php');?>
