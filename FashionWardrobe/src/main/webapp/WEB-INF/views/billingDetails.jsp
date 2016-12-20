<%@include file="header.jsp" %>
<div class="container">

<form:form modelAttribute="billingAddress">
<div class="form-signin" style="max-width:600px;">
<h4>Billing Details(Optional)</h4>
<div class="form-group">
                    <label for="state">State</label>
                      <form:input type="text" class="form-control" path="state" placeholder="Enter State" maxlength="255"/>
                     
</div>
<div class="form-group">
                    <label for="city">City</label>
                      <form:input type="text" class="form-control" path="city" placeholder="Enter City" maxlength="255"/>
                      
</div>
<div class="form-group">
                    <label for="district">District</label>
                      <form:input type="text" class="form-control" path="district" placeholder="Enter District" maxlength="255" />
                     
</div>
<div class="form-group">
                    <label for="landmark">Landmark</label>
                      <form:input type="text" class="form-control" path="landmark" placeholder="Enter Landmark" maxlength="255"/>
                     
</div>

<div class="form-group">
                    <label for="address">Address</label>
                          <form:input type="text" class="form-control" path="address" placeholder="Enter Address" maxlength="255"/>
                     
</div>
<div class="form-group">
                    <label for="pincode">Pincode</label>
                      <form:input type="text" class="form-control" path="pincode" placeholder="Enter pincode" />
                      
</div>
<button name ="_eventId_back" type="submit" class="btn btn-warning"><i class="fa fa-arrow-circle-o-left" aria-hidden="true"></i>
 Back</button>
<button name ="_eventId_submit" type="submit" class="btn btn-success pull-right">Continue Or Skip <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
 </button>
</div>
</form:form>
</div>

<%@include file="footer.jsp" %>