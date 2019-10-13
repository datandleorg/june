<?php
include('header.php');
include('workers/getters/functions.php');
include('generic_modal.php');

function payment_status($payment_status,$newdate,$po_payterm,$grn_date){
    $curdate=strtotime($newdate);
    $mydate=strtotime('+'.$po_payterm.' day', strtotime($grn_date));

    if($curdate > $mydate)
    {
        return 'Overdue';
    }
}
?>

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
                        <h1 class="main-title float-left"> Stock Inward Report</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">Stock Inward Report</li>
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
                            <h3><i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i><b>&nbsp;Stock Inward Report </b></h3>
                        </div>

                        <div class="card-body">

                            <!-- Start coding here -->
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                        <span id="po_reports_div"></span>
                                                
                                                <div class="form-group col-md-6 px-0 mt-2">
                                                    <select id="compcode" 
                                                    onchange="redirectTo(this)" class="form-control form-control-sm select2"  
                                                    required name="orgid" required autocomplete="off">
                                                        <option value="">Select Company Filter</option>
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
                                       
                                    </div>
                                    
                                    <table id="po_reports" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                            <th>Company Code</th>												
                                            <th>Item Code</th>												
                                                <th>Item Name</th>
                                                <th>Item Cost</th>
                                                <th>Taxrate</th>	
                                                <th>Price</th>
                                                <th>Stock on Hand</th>
                                                <th>Stock Value</th>
                                                <th>UOM</th>												
                                                <th>Created By</th>	
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php

                                            $sql = "SELECT p.*,c.*
													FROM purchaseitemaster p, (select orgid as orgid from comprofile union select custid as orgid from customerprofile) as c
													WHERE p.status = '1'";
                                            $sql.= $orgidUrl!==''  ? " AND p.orgid='".$orgidUrl."' AND c.orgid=p.orgid " : " AND c.orgid=p.orgid ";
                                            $sql.="ORDER BY p.id DESC;";    


                                            $result = mysqli_query($dbcon,$sql);
                                            if ($result->num_rows > 0){
                                                while ($row =$result-> fetch_assoc()){
                                                    echo '<tr>';
                                                    echo '<td>' .$row['orgid'] . '</td>';
                                                    echo '<td>' .$row['itemcode'] . '</td>';
                                                    echo '<td>'.$row['itemname'].' </td>';
                                                    echo '<td>'.$row['itemcost'].' </td>';
                                                    echo '<td>'.$row['taxrate'].' </td>';
                                                    echo '<td>'.$row['taxableprice'].' </td>';
                                                    echo '<td>'.$row['stockinqty'].' </td>';
                                                    echo '<td>'.$row['stockinqty']*$row['taxableprice'].' </td>';

                                                    echo '<td>'.$row['uom'].' </td>';													
                                                    echo '<td>'.$row['handler'].' </td>';
                                                    echo ' </tr>';  
                                                }
                                            }
                                            ?>


                                        </tbody>
                                        <tfoot>
                                            <tr>
                                            <th></th>
                                            <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>


                        </div>
                    </div><!-- end card-->

                </div>
            </div>
        </div>
    </div>
</div>




<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script>

    $(document).ready(function() {

 
        var printhead = 'Stock Inward';
        var excel_printhead = 'Stock Inward';
        var table = $('#po_reports').DataTable( {
            lengthChange: false,
            "footerCallback": function ( row, data, start, end, display ) {
                var api = this.api(), data;
                var intVal = function ( i ) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
                };
                var grossval = api
                .column( 7 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 ).toFixed(2);


                $( api.column( 0 ).footer() ).html('Total');
                $( api.column( 7 ).footer() ).html(grossval);
              
            },
            buttons: [
                {
                    extend: 'print',
                    title: '',
                    text: '<span class="fa fa-print"></span>',
                    footer: true ,
                    customize: function ( win ) {
                        $(win.document.body)
                            .css( 'font-size', '10pt' )
                            .prepend(
                            '<p><img src="<?php echo $baseurl;?>assets/images/dhirajLogo.png" style="width:50px;height:50px;" /></p><p class="lead text-center"><b>Stock Inward</b><br/></p></div>'
                        );

                        $(win.document.body).find( 'table' )
                            .addClass( 'compact' )
                            .css( 'font-size', 'inherit' );
                    }
                }, 
                {
                    extend: 'excel',
                    text:'<span class="fa fa-file-excel-o"></span>',
                    title:'Stock Inward', footer: true,
                    messageTop: ''   

                },
                {
                    extend: 'pdf',
                    text:'<span class="fa fa-file-pdf-o"></span>',
                    title:'Stock Inward', footer: true,
                    messageTop: ''   

                },
                {
                    extend: 'colvis',
                    text:'Show/Hide', footer: true 
                }
            ]
        } );


        table.buttons().container()
            .appendTo( '#po_reports_div');


    });

    function redirectTo(ele){
		 var orgid = $(ele).val();
		 var orgtype = $(ele).find('option:selected').attr('data-orgtype');
		 location.href='StockInwardReports.php?orgid='+orgid+'&orgtype='+orgtype;
	 }
</script>
<?php
include('footer.php');
?>
