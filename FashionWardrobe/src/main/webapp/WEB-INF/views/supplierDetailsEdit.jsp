<%@include file="header.jsp" %>
<div class="container">

<form:form method="POST" action="updateSupplier" modelAttribute="supplier">
<form:input path="supplierId" hidden="true"/>
<div class="form-group">
                    <label for="companyName">Company Name</label>
                      <form:input type="text" class="form-control" path="companyName" placeholder="Enter Company Name" maxlength="255"/>
                      
                  </div>
<div class="form-group">
                    <label for="supplierDescription">Supplier Description</label>
                      <form:input type="text" class="form-control" path="supplierDescription" placeholder="Enter Supplier Description" maxlength="255"/>
                      
                  </div>
                  <div class="form-group">
                    <label for="city">City</label>
                      <form:input type="text" class="form-control" path="city" placeholder="Enter City" maxlength="255"/>
                      
                  </div>
                  <div class="form-group">
                    <label for="state">State</label>
                      <form:input type="text" class="form-control" path="state" placeholder="Enter State" maxlength="255"/>
                     
                  </div>
                  <div class="form-group">
                    <label for="pincode">Pincode</label>
                      <form:input type="text" class="form-control" path="pincode" placeholder="Enter Pincode" />
                    
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
                    <label for="companyUrl">Company Url</label>
                      <form:input type="text" class="form-control" path="companyUrl" placeholder="Enter Company Url" maxlength="255"/>
                    
                  </div>

<a href="supplierPanel"><button name ="back" type="submit" class="btn btn-warning"><i class="fa fa-arrow-circle-o-left" aria-hidden="true"></i> Back</button></a>
<button type="submit" class="btn btn-success"><i class="fa fa-check-circle-o" aria-hidden="true"></i> Submit</button>
</form:form>
</div>

<%@include file="footer.jsp" %>