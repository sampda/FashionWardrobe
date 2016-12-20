<%@include file="header.jsp" %>
<div class="container">

<form:form method="POST" action="updateShipping" modelAttribute="shippingAddress">
<div class="form-signin" style="max-width:600px;">
<h4>Shipping Details</h4>
<hr>
<form:input path="shippingId" hidden="true"/>
<div class="form-group">
                    <label for="state">State<span cssclass="red">*</span></label>
                      <form:input type="text" class="form-control" path="state" placeholder="Enter State" maxlength="255"/>
               
</div>
<div class="form-group">
                    <label for="city">City<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="city" placeholder="Enter City" maxlength="255"/>
                 
</div>
<div class="form-group">
                    <label for="district">District<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="district" placeholder="Enter District" maxlength="255"/>
                 
</div>
<div class="form-group">
                    <label for="landmark">Landmark<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="landmark" placeholder="Enter Landmark" maxlength="255"/>
                  
</div>

<div class="form-group">
                    <label for="address">Address<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="address" placeholder="Enter Address" maxlength="255"/>
                  
</div>
<div class="form-group">
                    <label for="pincode">Pincode<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="pincode" placeholder="Enter pincode" maxlength="255"/>
                
</div>

<a href="userpanel"><button type="submit" class="btn btn-warning"><i class="fa fa-arrow-circle-o-left" aria-hidden="true"></i> Back</button></a>
<button type="submit" class="btn btn-success"><i class="fa fa-check-circle-o" aria-hidden="true"></i> Submit</button>
</div>
</form:form>
</div>

<%@include file="footer.jsp" %>