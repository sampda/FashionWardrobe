<%@include file="header.jsp" %>
<div class="container">
<form:form modelAttribute="userDetails">
<div class="form-signin" style="max-width:600px;">
<h4>User Details</h4>
<div class="form-group">
                    <label for="userName">Username<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="username" placeholder="Enter UserName" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('username')}" var="err">
	                  <div><span style="color:red;">${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="password">Password<span style="color:red;"> *</span></label>
                    <form:input type="password" class="form-control" path="password" placeholder="Enter password" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('password')}" var="err">
	                  <div><span style="color:red;">${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="email_id">Email_Id<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="emailId" placeholder="Enter email_id" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('emailId')}" var="err">
	                  <div><span style="color:red;">${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="firstName">First Name<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="firstname" placeholder="Enter First Name" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('firstname')}" var="err">
	                  <div><span style="color:red;">${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="lastName">Last Name<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="lastname" placeholder="Enter Last Name" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lastname')}" var="err">
	                  <div><span style="color:red;">${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="contact_no">Contact Number<span style="color:red;"> *</span></label>
                    <form:input type="text" class="form-control" path="contactno" placeholder="Enter Contact Number" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('contactno')}" var="err">
	                  <div><span style="color:red;">${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
<label for="alternate_no">Alternate Contact Number:</label>
<form:input type="text" class="form-control" path="alternateContactno" placeholder="Enter Alternate Contact Number(Optional)"/>
</div>
<button name ="_eventId_cancel" type="submit" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i>
 Cancel</button>
<button name ="_eventId_submit" type="submit" class="btn btn-success pull-right"><i class="fa fa-check-square" aria-hidden="true"></i>
 Submit</button>
</div>
</form:form>
</div>

<%@include file="footer.jsp" %>