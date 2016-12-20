<%@include file="header.jsp" %>
<div class="container">
<form:form method="POST" action="updateSupplierDetails" modelAttribute="userDetails">
<form:input path="userId" hidden="true"/>
<form:input path="cartId" hidden="true"/>
<div class="form-group">
                    <label for="userName">Username</label>
                    <form:input path="username" type="text" class="form-control" readonly="true"/>
                     
</div>
<div class="form-group">
                    <label for="password">Password<span style="color:red;"> *</span></label>
                  <form:input type="password" class="form-control" path="password" placeholder="Enter password"/>
                      
</div>
<div class="form-group">
                    <label for="email_id">Email_Id<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="emailId" placeholder="Enter email_id" />
                      
</div>
<div class="form-group">
                    <label for="firstName">First Name<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="firstname" placeholder="Enter First Name" />
                      
</div>
<div class="form-group">
                    <label for="lastName">Last Name<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="lastname" placeholder="Enter Last Name" />
                      
</div>
<div class="form-group">
                    <label for="contact_no">Contact Number<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="contactno" placeholder="Enter Contact Number" />
                      
</div>
<div class="form-group">
<label for="alternate_no">Alternate Contact Number:</label>
<form:input type="text" class="form-control" path="alternateContactno" placeholder="Enter Alternate Contact Number(Optional)"/>
</div>
<a href="supplierPanel"><button name ="cancel" type="submit" class="btn btn-warning"><i class="fa fa-arrow-circle-o-left" aria-hidden="true"></i> Back</button></a>
<button name ="submit" type="submit" class="btn btn-success"><i class="fa fa-check-circle-o" aria-hidden="true"></i> Submit</button>
</form:form>
</div>

<%@include file="footer.jsp" %>