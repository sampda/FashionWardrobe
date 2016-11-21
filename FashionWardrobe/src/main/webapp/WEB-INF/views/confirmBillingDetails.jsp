<%@include file="header.jsp" %>
<div class="container">

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
<button name="_eventId_edit" type="submit" class="btn btn-warning">Edit</button>
<button name ="_eventId_submit" type="submit" class="btn btn-warning">Submit</button>
<button name="_eventId_same" type="submit" class="btn btn-warning">Same As Shipping Address</button>
<button name ="_eventId_cancel" type="submit" class="btn btn-danger">Cancel</button>
</form:form>
</div>

<%@include file="footer.jsp" %>