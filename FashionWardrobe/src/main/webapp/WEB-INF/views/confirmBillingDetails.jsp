<%@include file="header.jsp" %>
<div class="container">
<div class="form-signin" style="max-width:600px;">
<h4>Confirm Billing Details</h4>
<hr>
<form:form modelAttribute="billingAddress">
<div class="form-group">
                    <label for="state">State</label>
                      <input type="text" class="form-control" name="userName" placeholder="${billingAddress.state}" readonly/>
</div>
<div class="form-group">
                    <label for="city">City</label>
                      <input type="text" class="form-control" name="email_id" placeholder="${billingAddress.city}" readonly/>
</div>
<div class="form-group">
                    <label for="district">District</label>
                      <input type="text" class="form-control" name="firstName" placeholder="${billingAddress.district}" readonly/>
</div>
<div class="form-group">
                    <label for="landmark">Landmark</label>
                      <input type="text" class="form-control" name="lastName" placeholder="${billingAddress.landmark}" readonly/>
</div>

<div class="form-group">
                    <label for="address">Address</label>
                      <input type="text" class="form-control" name="contactNo" placeholder="${billingAddress.address}" readonly/>
</div>
<div class="form-group">
                    <label for="pincode">Pincode</label>
                      <input type="text" class="form-control" name="contactNo" placeholder="${billingAddress.pincode}" readonly/>
</div>
<button name ="_eventId_cancel" type="submit" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Cancel</button>
<button name="_eventId_edit" type="submit" class="btn btn-warning"><i class="fa fa-pencil-square" aria-hidden="true"></i> Edit</button>

<button name ="_eventId_submit" type="submit" class="btn btn-success pull-right"><i class="fa fa-check-square" aria-hidden="true"></i> Submit</button>
</form:form>
</div>
</div>

<%@include file="footer.jsp" %>