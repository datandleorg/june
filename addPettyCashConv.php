
<!-- Modal -->
<div class="modal fade" id="pettyCashConvModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Petty Cash Conversion </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
               <div class="d-flex justify-content-between">
               <div class="p-2">Current Petty Cash Balance : </div>
               <div class="p-2">{{comprofile.petty_cash_bal}}</div>
               </div>

               <div class="d-flex justify-content-between">
               <div class="p-2">Current Undeposited Cash Balance : </div>
               <div class="p-2">{{comprofile.cash_on_hand}}</div>
               </div>

               <div class="d-flex justify-content-between align-items-center">
               <div class="p-2">
               <div class="form-group">
                 <label for="">Enter Amount to be converted</label>
                 <input type="text"
                   class="form-control" name="conv_amt" id="conv_amt" ng-model="conv_amt"  aria-describedby="helpId" placeholder="">
                 <!-- <small id="helpId" class="form-text text-muted">Help text</small> -->
               </div>      
               <div class="form-group">
                 <label for=""></label>
                 <textarea class="form-control" name="conv_remarks" id="conv_remarks"  ng-model="conv_remarks" name="" id="" rows="3"></textarea>
               </div> 
            </div>
               <div class="p-2"><button type="button" class="btn btn-primary" ng-click="convertToPettyCash()">Convert to Petty Cash</button></div>
               </div>

            </div>
        </div>
    </div>
</div>
