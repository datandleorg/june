<?php
include('header.php');
include('workers/getters/functions.php');

?>

<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">

            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left"> Transactions Report</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">Transactions Report</li>
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


                            <h3><i class="fa fa-cart-plus bigfonts" aria-hidden="true"></i><b>&nbsp;Transactions Reports </b></h3>
                        </div>

                        <div class="card-body">
                            <div class="form-group row">
                               
                                <div class="col-sm-3">
                                    <div class="input-group">
                                        <input type="text" id="daterange" class="form-control form-control-sm" placeholder="Select Date Range">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" id="reset-date">
                                                <i class="fa fa-times"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                        
                                <div class="form-group col-md-3">
                                        <select required id="payment_mode" data-parsley-trigger="change"  class="form-control form-control-sm"  name="payment_mode" >
                                            <option value="">-- Select Payment Mode --</option>
                                            <option value="Cash">Cash</option>
                                            <option value="Cheque">Cheque</option>
                                            <option value="Credit Card">Credit Card</option>
                                            <option value="Bank Transfer">Bank Transfer</option>
                                            <option value="Bank Remittance">Bank Remittance</option>
                                        </select>
                                </div>

                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary btn-sm" onclick="get_cp_reports();">Run Report</button>
                                </div>
                            </div>
                            <hr/>
                            <!-- Start coding here -->
                            <div class="row">
                                <div class="col-md-12">
                                    <span id="po_reports_div"></span>
                                    <table id="po_reports" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                            <th>Id</th>
                                            <th>Trans Id</th>
                                            <th>Entry Id</th>
                                            <th>Type</th>
                                            <th>Entry Type</th>
                                                <th>Amount</th>
                                                <th>Payment Mode</th>
                                                <th>Bank</th>
                                                <th>Closing Bal</th>
                                                <th>Cash On Hand</th>
                                                <th>Petty Cash</th>
                                                <th>Status</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            if((isset($_GET['st'])&&$_GET['st']!='')||(isset($_GET['end'])&&$_GET['end']!='') ||(isset($_GET['payment_mode']))){ 

                                                $timestamp = strtotime($_GET['st']);
                                                $st = date('Y-m-d', $timestamp);
                                                $timestamp = strtotime($_GET['end']);
                                                $end = date('Y-m-d', $timestamp);

                                               $sql = "SELECT * from expenses ex where 1=1 ";
                                                if($_GET['st']!=''){
                                                    if($st==$end){
                                                        $sql.= " and ex.expense_date='$st' ";   
                                                    }else{
                                                        $sql.=" and (ex.expense_date BETWEEN '$st' AND '$end') ";   
                                                    }
                                                }

                                                if($_GET['payment_mode']!=''){
                                                    $sql.= " and ex.expense_paid_thru='".$_GET['payment_mode']."' ";   

                                                }

                                            }else{
                                                $sql = "SELECT * from transactions t order by t.trans_id asc ;";    
                                            }

                                            $result = mysqli_query($dbcon,$sql);
                                            if ($result->num_rows > 0){
                                                while ($row =$result-> fetch_assoc()){

                                                    echo '<tr>
                                                    <td>'.$row['id'].'</td>
                                                    <td>'.$row['trans_id'].'</td>
                                                    <td>'.$row['trans_row_id'].'</td>
                                                    <td>'.$row['trans_type'].'</td>
                                                    <td>'.$row['trans_entry_type'].'</td>
                                                    <td>'.$row['trans_amt'].'</td>
                                                <td>'.$row['trans_mode'].'</td>
                                                <td>'.$row['trans_bank'].'</td>
                                                <td>'.$row['total_closing_bal'].'</td>
                                                <td>'.$row['total_cash_on_hand'].'</td>
                                                <td>'.$row['total_petty_cash'].'</td>
                                                <td>'.$row['trans_status'].'</td>
                                                <td>'.$row['trans_date'].'</td>

                                            </tr>';  
                                                }
                                            }
                                            ?>


                                        </tbody>
                                        <!-- <tfoot>
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
                                            </tr>
                                        </tfoot> -->
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
   // var page_custwise = "<?php if(isset($_GET['custwise'])){ echo $_GET['custwise']; } ?>";
    var page_payment_mode = "<?php if(isset($_GET['payment_mode'])){ echo $_GET['payment_mode']; } ?>";
   var page_st = "<?php if(isset($_GET['st'])){ echo $_GET['st']; } ?>";
    var page_end = "<?php if(isset($_GET['end'])){ echo $_GET['end']; } ?>";

    $(document).ready(function() {
       // var vendor_params =[];
       // Page.load_select_options('custwise',vendor_params,'customerprofile',' Customer','custid','custname');
       $('#payment_mode').val(page_payment_mode);
        $("#reset-date").hide();

        $('#daterange').daterangepicker({
            ranges: {
                'Today': [moment(), moment()],
                'This Quarter': [moment().startOf('quarter'), moment().endOf('quarter')],
                'Last Quarter': [moment().subtract(1, 'quarter').startOf('quarter'), moment().subtract(1, 'quarter').endOf('quarter')],
                'This Year': [moment().startOf('year'), moment().endOf('year')],
                'Last Year': [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('year')],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, function(start, end, label) {
            $('#daterange').attr('readonly',true); 
            $("#reset-date").show();

        });

        if(page_end!=''){
            cb(page_st,page_end);
        }else{
            $('#daterange').val(''); 
        }

        $("#reset-date").click(function(){
            $('#daterange').val('');
            $('#daterange').attr('readonly',false); 
            $("#reset-date").hide();
        });

        var date_range = $('#daterange').val(); 

        // var cust_var = $('#custwise').val(); 
        // var cust_name_json = cust_var!=''?Page.get_edit_vals(cust_var,"customerprofile","custid"):'';
        // var cust_name = cust_name_json.custname;
        var printhead = '';
        printhead+= date_range!=''?'<p><b>Date : </b>'+date_range+'</p>':'';
        printhead+= '';
        printhead+= page_payment_mode!=''?'<p><b>Payment Mode : </b>'+page_payment_mode+'</p>':'';
        var excel_printhead = '';
        excel_printhead+= '  ';
        excel_printhead+= date_range!=''?'Date : '+date_range:'';
        excel_printhead+= '  ';
        excel_printhead+= page_payment_mode!=''?'Payment Mode : '+page_payment_mode+'':'';



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
                .column( 6 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 ).toFixed(2);

                // var taxgrossval = api
                // .column( 4 )
                // .data()
                // .reduce( function (a, b) {
                //     return intVal(a) + intVal(b);
                // }, 0 ).toFixed(2);

                // $( api.column( 0 ).footer() ).html('Total');
                // $( api.column( 6 ).footer() ).html(grossval);
                // $( api.column( 4 ).footer() ).html(taxgrossval);
                //   $( api.column( 5 ).footer() ).html(taxamt);
                //   $( api.column( 7 ).footer() ).html(netval);
                //  $( api.column( 8 ).footer() ).html(bal);

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
                            '<p><img src="<?php echo $baseurl;?>assets/images/logo.png" style="width:50px;height:50px;" /></p><p class="lead text-center"><b>Expenses Report</b><br/></p>'+printhead+'</div>'
                        );

                        $(win.document.body).find( 'table' )
                            .addClass( 'compact' )
                            .css( 'font-size', 'inherit' );
                    }
                }, 
                {
                    extend: 'excel',
                    text:'<span class="fa fa-file-excel-o"></span>',
                    title:'Expenses Report', footer: true ,
                    messageTop: excel_printhead   

                },
                {
                    extend: 'pdf',
                    text:'<span class="fa fa-file-pdf-o"></span>',
                    title:'Expenses Report', footer: true ,
                    messageTop: excel_printhead   

                },
                {
                    extend: 'colvis',
                    text:'Show/Hide', footer: true 
                }
            ]
        } );


        table.buttons().container()
            .appendTo( '#po_reports_div');

            table
            .order( [ 2, 'desc' ] )
            .draw();
    });

    function get_cp_reports(){
        var st = '';
        var end = '';

        var date_range_val = $('#daterange').val();
        if(date_range_val!=''){
            var date_range = date_range_val.replace(" ","").split('-');
            //var filter = $('#filterby').val();
            st = date_range[0].replace(" ","");
            end = date_range[1].replace(" ","");
        }
        var payment_mode = $('#payment_mode').val();
        location.href="TransactionsReports.php?st="+st+"&end="+end+"&payment_mode="+payment_mode;
    }

    function cb(start, end) {
        $('#daterange').val(start+ ' - ' + end);
        $('#daterange').attr('readonly',true); 
        $("#reset-date").show();
    }
    function ToPrint(el){
        var code= $(el).attr('data-code');
        var type= $(el).attr('data-type');
        
       // window.location.href = 'assets/customer_payment_print.php?cust_payment_id='+code+'&type='+type;
    }
</script>
<?php
include('footer.php');
?>
