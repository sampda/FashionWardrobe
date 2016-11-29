<%@include file="header.jsp" %>
<div class="container">
<h4>Shipping Details</h4>
<form:form method="POST" action="updateShipping" modelAttribute="shippingAddress">
<form:input path="shippingId" hidden="true"/>
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
                      <form:input type="text" class="form-control" path="district" placeholder="Enter District" maxlength="255"/>
                 
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
                      <form:input type="text" class="form-control" path="pincode" placeholder="Enter pincode" maxlength="255"/>
                
</div>

<a href="userpanel"><button type="submit" class="btn btn-warning"><i class="fa fa-arrow-circle-o-left" aria-hidden="true"></i> Back</button></a>
<button type="submit" class="btn btn-success"><i class="fa fa-check-circle-o" aria-hidden="true"></i> Submit</button>
</form:form>
</div>

<%@include file="footer.jsp" %>