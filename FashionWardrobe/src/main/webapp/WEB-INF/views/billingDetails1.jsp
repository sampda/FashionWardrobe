<%@include file="header.jsp" %>
<div class="container">
<h4>Billing Details</h4>
<form:form modelAttribute="billingAddress">
<div class="form-group">
                    <label for="state">State</label>
                      <form:input type="text" class="form-control" path="state" placeholder="Enter State" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('state')}" var="err">
	<div><span>${err.text}</span></div>
</c:forEach><br />
</div>
<div class="form-group">
                    <label for="city">City</label>
                      <form:input type="text" class="form-control" path="city" placeholder="Enter City" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('city')}" var="err">
	<div><span>${err.text}</span></div>
</c:forEach><br />
</div>
<div class="form-group">
                    <label for="district">District</label>
                      <form:input type="text" class="form-control" path="district" placeholder="Enter District" maxlength="255" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('district')}" var="err">
	<div><span>${err.text}</span></div>
</c:forEach><br />
</div>
<div class="form-group">
                    <label for="landmark">Landmark</label>
                      <form:input type="text" class="form-control" path="landmark" placeholder="Enter Landmark" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lanmark')}" var="err">
	<div><span>${err.text}</span></div>
</c:forEach><br />
</div>

<div class="form-group">
                    <label for="address">Address</label>
                          <form:input type="text" class="form-control" path="address" placeholder="Enter Address" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('address')}" var="err">
	<div><span>${err.text}</span></div>
</c:forEach><br />
</div>
<div class="form-group">
                    <label for="pincode">Pincode</label>
                      <form:input type="text" class="form-control" path="pincode" placeholder="Enter pincode" />
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('pincode')}" var="err">
	<div><span>${err.text}</span></div>
</c:forEach><br />
</div>

<button name ="_eventId_submit" type="submit" class="btn btn-warning">Submit</button>
<button name ="_eventId_cancel" type="submit" class="btn btn-warning">Cancel</button>
</form:form>
</div>

<%@include file="footer.jsp" %>