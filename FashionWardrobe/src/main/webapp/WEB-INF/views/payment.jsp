<%@include file="header.jsp" %>

<div class="container">
 <div class="form-signin" style="max-width:600px;">
  <h4>Payment Details</h4>                      
  <hr>
                        <!-- Name -->
                        <form:form>
                        <div class="form-group">
                            <label class="control-label" for="username">Card Holder's Name<span style="color:red;"> *</span></label>

                            <div class="controls">
                                <input type="text" id="username" name="username" placeholder="Enter Card Holder's Name" class="form-control">
                            </div>
                        </div>

                        <!-- Card Number -->
                        <div class="form-group">
                            <label class="control-label" for="card_number">Card Number<span style="color:red;"> *</span></label>

                            <div class="controls">
                                <input type="text" id="card_number" name="card_number" placeholder="Card Number"
                                       class="form-control" >
                            </div>
                        </div>
                        <hr/>
                        <!-- Expiry-->
                        <div class="form-group">
                            <label class="control-label" for="expiry_month">Card Expiry Date<span style="color:red;"> *</span></label>

                            <div class="row">
                                <div class="col-sm-4">
                                    <select class="form-control" name="expiry_month" id="expiry_month">
                                        <option>----</option>
                                        <option value="01">Jan (01)</option>
                                        <option value="02">Feb (02)</option>
                                        <option value="03">Mar (03)</option>
                                        <option value="04">Apr (04)</option>
                                        <option value="05">May (05)</option>
                                        <option value="06">June (06)</option>
                                        <option value="07">July (07)</option>
                                        <option value="08">Aug (08)</option>
                                        <option value="09">Sep (09)</option>
                                        <option value="10">Oct (10)</option>
                                        <option value="11">Nov (11)</option>
                                        <option value="12">Dec (12)</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <select class="form-control" name="expiry_year">
                                        <option value="">-----</option>
                                        <option value="13">2013</option>
                                        <option value="14">2014</option>
                                        <option value="15">2015</option>
                                        <option value="16">2016</option>
                                        <option value="17">2017</option>
                                        <option value="18">2018</option>
                                        <option value="19">2019</option>
                                        <option value="20">2020</option>
                                        <option value="21">2021</option>
                                        <option value="22">2022</option>
                                        <option value="23">2023</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr/>
                        <div class="row">
                            <div class="col-sm-3">
                                <!-- CVV -->
                                <div class="form-group">
                                    <label class="control-label" for="password_confirm">Card CVV<span style="color:red;"> *</span></label>


                                    <input type="password" id="password_confirm"
                                           name="password_confirm" placeholder=""
                                           class="form-control">
                                </div>
                            </div>
                        </div>
                                <!-- Submit -->
                                <div class="form-group">
                               <button name="_eventId_cancel" type="submit" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Cancel</button>
                               <button name ="_eventId_submit" type="submit" class="btn btn-success pull-right"><i class="fa fa-check-square" aria-hidden="true"></i> Submit</button>
                                </div>
                            
</form:form>
</div>
    
</div>
    

<%@include file="footer.jsp" %>