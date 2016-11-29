<%@include file="header.jsp" %>
<div class="container">
<h4>Confirm Shipping Address</h4>
<form:form modelAttribute="shippingAddress">
<div class="form-group">
                    <label for="state">State</label>
                      <input type="text" class="form-control" name="userName" placeholder="${shippingAddress.state}" readonly/>
</div>
<div class="form-group">
                    <label for="city">City</label>
                      <input type="text" class="form-control" name="email_id" placeholder="${shippingAddress.city}" readonly/>
</div>
<div class="form-group">
                    <label for="district">District</label>
                      <input type="text" class="form-control" name="firstName" placeholder="${shippingAddress.district}" readonly/>
</div>
<div class="form-group">
                    <label for="landmark">Landmark</label>
                      <input type="text" class="form-control" name="lastName" placeholder="${shippingAddress.landmark}" readonly/>
</div>

<div class="form-group">
                    <label for="address">Address</label>
                      <input type="text" class="form-control" name="contactNo" placeholder="${shippingAddress.address}" readonly/>
</div>
<div class="form-group">
                    <label for="pincode">Pincode</label>
                      <input type="text" class="form-control" name="contactNo" placeholder="${shippingAddress.pincode}" readonly/>
</div>
<button name="_eventId_edit" type="submit" class="btn btn-warning"><i class="fa fa-pencil-square" aria-hidden="true"></i> Edit</button>
<button name ="_eventId_cancel" type="submit" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Cancel</button>
<button name ="_eventId_submit" type="submit" class="btn btn-success"><i class="fa fa-check-square" aria-hidden="true"></i> Submit</button>
</form:form>
</div>

<%@include file="footer.jsp" %>