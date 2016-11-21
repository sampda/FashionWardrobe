<%@include file="header.jsp" %>
<div class="container">
<form:form modelAttribute="userDetails">
<div class="form-group">
                    <label for="userName">Username</label>
                    <form:input type="text" class="form-control" path="username" placeholder="Enter UserName" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('username')}" var="err">
	                  <div><span>${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="password">Password</label>
                    <form:input type="password" class="form-control" path="password" placeholder="Enter password" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('password')}" var="err">
	                  <div><span>${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="email_id">Email_Id</label>
                    <form:input type="text" class="form-control" path="emailId" placeholder="Enter email_id" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('email_id')}" var="err">
	                  <div><span>${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="firstName">First Name</label>
                    <form:input type="text" class="form-control" path="firstname" placeholder="Enter First Name" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('firstname')}" var="err">
	                  <div><span>${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="lastName">Last Name</label>
                    <form:input type="text" class="form-control" path="lastname" placeholder="Enter Last Name" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lastname')}" var="err">
	                  <div><span>${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
                    <label for="contact_no">Contact Number</label>
                    <form:input type="text" class="form-control" path="contactno" placeholder="Enter Contact Number" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('contactno')}" var="err">
	                  <div><span>${err.text}</span></div>
                      </c:forEach><br/>
</div>
<div class="form-group">
<label for="alternate_no">Alternate Contact Number:</label>
<form:input type="text" class="form-control" path="alternateContactno" placeholder="Enter Alternate Contact Number(Optional)"/>
</div>
<button name ="_eventId_cancel" type="submit" class="btn btn-danger">Cancel</button>
<button name ="_eventId_submit" type="submit" class="btn btn-success">Submit</button>
</form:form>
</div>

<%@include file="footer.jsp" %>