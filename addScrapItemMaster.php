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
								<h1 class="main-title float-left"><i class="fa fa-shopping-basket bigfonts">Scrap materials Data Input Form</i></h1>
                                    <ol class="breadcrumb float-right">
									<a  href="index.php"><li class="breadcrumb-item">Home</a>
										<li class="breadcrumb-item active"> Scrap materials</li>
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
								<p>Add Scrap materials </p>
							</div>
								
							<div class="card-body p-4">
								
								<form id="add_scrapmaterial_form" autocomplete="off" enctype="multipart/form-data" method="post">
								
                                    <div class="form-row">
                                        <div class="form-group col-md-10">

                                        <label for="">Select Entry Type</label>
                                        <select name="entrytype"
                                         id="entrytype"
                                         <?php if(isset($_GET['action']))
                                         {
                                            echo  $_GET['action']=="edit" ? 'readonly class="form-control form-control-sm" ' : 'class="form-control form-control-sm select2';
                                         }else{
                                             echo ' class="form-control form-control-sm select2"  ';
                                         }
                                        ?> 
                                         data-orgid="<?php echo $orgidUrl!=="" ? '"'.$orgidUrl.'"' :  "" ?>"
                                         onchange="redirectTo(this.name);">
                                                <option value="">Select Type</option>
                                                <option value="self" <?php if($entryType!="" && $entryType=="self"){ echo "selected"; } ?> >Self</option>
                                                <option value="outsourced" <?php if($entryType!="" && $entryType=="outsourced"){ echo "selected"; } ?> >Outsourced</option>
                                                
                                        </select>
                                        </div>
                                    </div>

									<div class="form-row">
                                    <div class="form-group col-md-10">
                                        <label for="inputState">Assign Company<i class="text-danger">*</i></label>
                                        <select data-entry="<?php echo $entryType;?>"
                                        
                                        <?php if(isset($_GET['action']))
                                         {
                                            echo  $_GET['action']=="edit" ? 'readonly class="form-control form-control-sm" ' : 'class="form-control form-control-sm select2';
                                         }else{
                                             echo ' class="form-control form-control-sm select2"  ';
                                         }
                                        ?>  
                                        id="scrap_orgid" name="scrap_orgid"
                                        onchange="redirectTo(this.name)"
                                        required required autocomplete="off">
                                              <option selected>--Select Company--</option>
                                            <?php
                                           if($entryType!=""){
                                            $sql = $entryType=="outsourced" ? mysqli_query($dbcon,"SELECT custid as orgid,custname as orgname FROM customerprofile where custype='Partner' ") : mysqli_query($dbcon,"SELECT * FROM comprofile");
                                            while ($row = $sql->fetch_assoc()){	
                                                $orgid=$row['orgid'];
                                                $orgname=$row['orgname'];
                                                if($orgidUrl!='' && $orgidUrl===$orgid){
													echo '<option selected data-orgname="'.$orgname.'" value="'.$orgid.'" >'.$orgname.' </option>';
												}else{
													echo '<option data-orgname="'.$orgname.'" value="'.$orgid.'" >'.$orgname.' </option>';
												}
                                            }
                                        }
                                            ?>
                                        </select>
                                    </div>
                                </div>
								 
                                 <!---
                                                                             onkeypress="checkForItemName();" 
                                            onkeyup="checkForItemName();" 

                                 -->
									
                                
                                <div class="form-row">
                                        <div class="form-group col-md-10">
                                            <label>Scrap Item Name<span class="text-danger">*</span></label>
                                            <input type="text"
                                            onkeyup="checkForProduct(this.value)"
                                            onkeypress="checkForProduct(this.value)"
                                            class="form-control form-control-sm" name="scrap_itemname" id="scrap_itemname"
                                            placeholder="Scrap Name" required class="form-control" autocomplete="off" />
                                            <small id="itemNameHelpText" style="display:none;" class="form-text text-danger">Scrap name already exists</small>
                                        </div>
                                </div>

                                <div class="form-row">

                                    <div class="form-group col-md-10">
                                        <label for="inputState">Scrap Source Item<i class="text-danger">*</i></label>
                                        <select id="scrap_from_itemcode" 
                                        onChange="setUom('purchaseitemaster',this)"
                                        required name="scrap_from_itemcode" autocomplete="off"
                                        <?php if(isset($_GET['action']))
                                         {
                                            echo  $_GET['action']=="edit" ? 'readonly class="form-control form-control-sm" ' : 'class="form-control form-control-sm select2';
                                         }else{
                                             echo ' class="form-control form-control-sm select2"  ';
                                         }
                                        ?>  
                                        >
                                            <option value="" selected>-Select Purchase Itemname-</option>
                                            <?php 
                                            include("database/db_conection.php");//make connection here
                                             $sql = "SELECT itemcode,concat(itemcode,'-',itemname) as itemname,itemname as item FROM purchaseitemaster p where p.orgid='".$orgidUrl."'";    

                                             $exe = mysqli_query($dbcon,$sql);
                                            while ($row = $exe->fetch_assoc()){	
                                                 $itemcode=$row['itemcode'];
                                                 $itemname=$row['itemname'];
                                                echo '<option data-itemname="'.$row['item'].'" value="'.$itemcode.'" >'.$itemname.' </option>';
                                             }
                                            ?>
                                        </select>

                                    </div>
								</div>

                                
                                <p><b>Scrap Ratio </b> (Scrap Qty to Purchased Item Qty) </p>
                                <div class="form-row p-3">
                                     
                                    <div class="form-group col-md-2">
                                        <label for="inputState">Qty</label>
                                        <input type="text" placeholder="Qty"
                            
                                        name="scrap_qty" id="scrap_qty" 
                                        class="form-control form-control-sm"> 
                                    </div>

                                    <div class="form-group col-md-2 mr-2" style="border-right:1px solid #f2f2f2;">
                                    <label>Unit</label>
                                    <select id="scrap_uom"  
                                 
                                    class="form-control form-control-sm"
                                     name="scrap_uom">
                                            <option value="">Open Unit</option>
                                            <?php 
                                            $sql = mysqli_query($dbcon, "SELECT * FROM uom");
                                            while ($row = $sql->fetch_assoc()){	

                                                echo '<option  value="'.$row['code'].'">'.$row['description'].'</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>

                                    
                                    <div class="form-group col-md-2 ml-2">
                                        <label for="inputState">Qty</label>
                                        <input type="text" placeholder="Qty"
                               
                                        name="scrap_from_qty" id="scrap_from_qty" 
                                        class="form-control form-control-sm"> 
                                    </div>

                                    <div class="form-group col-md-2">
                                    <label>Unit</label>
                                    <select id="scrap_from_uom"  
                                     readonly
                                    class="form-control form-control-sm"
                                     name="scrap_from_uom">
                                            <option value="">Open Unit</option>
                                            <?php 
                                            $sql = mysqli_query($dbcon, "SELECT * FROM uom");
                                            while ($row = $sql->fetch_assoc()){	

                                                echo '<option  value="'.$row['code'].'">'.$row['description'].'</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>


                                </div>

                        
                                    
								<div class="form-row">
                                    <div class="form-group col-md-8">
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
                                        <input type="text" class="form-control form-control-sm" name="handler" readonly class="form-control form-control-sm" value="<?php echo $rs['username']; ?>" required />

                                    </div>
                                </div>

	
									<div class="form-row">
								    <div class="form-group text-right m-b-10">
                                                       &nbsp;<button class="btn btn-primary" name="submit" type="submit">
                                                            Submit
                                                        </button>
                                                        <button type="reset" name="cancel" class="btn btn-secondary m-l-5" onclick="location.href='listScrapItemMaster.php'">Cancel
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
    var page_scrap_itemcode = "<?php if(isset($_GET['scrap_itemcode'])){ echo $_GET['scrap_itemcode']; } ?>";

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
            var entryType = "";
            var redirectOrgid = "";

            if(select=="entrytype"){
                 entryType = $('#'+select).val();
                 redirectOrgid = $('#'+select).attr('data-orgid');
            }else{
                 entryType = $('#'+select).attr('data-entry');
                 redirectOrgid = $('#'+select).val();
            }
            console.log(entryType,redirectOrgid,page_action,'page_action');

            if(page_action!==""){
                location.href="addScrapItemMaster.php?rw_code="+page_rw_code+"&action="+page_action+"&type="+page_table+"&entrytype="+entryType+"&orgid="+redirectOrgid;
            }else{
                location.href="addScrapItemMaster.php?entrytype="+entryType+"&orgid="+redirectOrgid;
            }
        }


        function checkForProduct(itemnameEle){
         var scrap_itemname = $('#scrap_itemname').val();
         var cond = {};
         cond['scrap_itemname'] = scrap_itemname;

         var edit_data = Page.get_vals_by_condition("scrapinventory",cond);

         if(edit_data.scrap_from_itemcode!=undefined){
            $('#itemNameHelpText').show();
            error = true;
         }else{
            $('#itemNameHelpText').hide();
            error = false;
         }
       }


        if(page_action=="edit"){
            var edit_data = Page.get_edit_vals(page_scrap_itemcode,page_table,"scrap_itemcode");
            console.log(edit_data);
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
            $('#scrap_from_uom').val(itemData.stockinuom);
        }
           
        function set_form_data(data){

            $.each(data, function(index, value) {

                if(index=="id"||index=="rw_code"){
                }else{
                    $('#'+index).val(value);
                }
            }); 
        }


        $("form#add_scrapmaterial_form").submit(function(e){
        e.preventDefault();


        var $form = $("#add_scrapmaterial_form");
        var data = getFormData($form);

        function getFormData($form){
            var unindexed_array = $form.serializeArray();
            var indexed_array = {};

            $.map(unindexed_array, function(n, i){
                    indexed_array[n['name']] = n['value'];
            }); 

            return indexed_array;
        }

      
        data.scrap_from_itemname = $('#scrap_from_itemcode option:selected').attr('data-itemname');
        data.scrap_inventory_uom = $('#scrap_uom').val();
        var compname = $('#scrap_orgid option:selected').attr('data-orgname');

        console.log(error);
        if(!error){
                    $.ajax ({
                    url: 'workers/setters/save_scrapitems.php',
                    type: 'post',
                    data: {array : JSON.stringify(data),
                    scrap_itemcode:page_scrap_itemcode,
                    action:page_action?page_action:"add",table:"scrapinventory",
                    scrap_orgid:data.scrap_orgid,
                    compname: compname },
                    dataType: 'json',
                    success:function(response){
                        if(response.status){
                          location.href="listScrapItemMaster.php";
                        }
                    }

                });
        }else{
            alert("errors found");
        }


        });
</script>

<?php include('footer.php');?>
