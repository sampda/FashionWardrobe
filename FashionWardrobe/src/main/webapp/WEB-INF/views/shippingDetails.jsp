<%@include file="header.jsp" %>
<div class="container">

<form:form modelAttribute="shippingAddress">
<div class="form-signin" style="max-width:600px;">
<h4>Shipping Details</h4>
<div class="form-group">
                    <label for="state">State<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="state" placeholder="Enter State" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('state')}" var="err">
	<div><span style="color:red;">${err.text}</span></div>
</c:forEach><br />
</div>
<div class="form-group">
                    <label for="city">City<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="city" placeholder="Enter City" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('city')}" var="err">
	<div><span style="color:red;">${err.text}</span></div>
</c:forEach><br />
</div>
<div class="form-group">
                    <label for="district">District<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="district" placeholder="Enter District" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('district')}" var="err">
	<div><span style="color:red;">${err.text}</span></div>
</c:forEach><br />
</div>
<div class="form-group">
                    <label for="landmark">Landmark<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="landmark" placeholder="Enter Landmark" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('landmark')}" var="err">
	<div><span style="color:red;">${err.text}</span></div>
</c:forEach><br />
</div>

<div class="form-group">
                    <label for="address">Address<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="address" placeholder="Enter Address" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('address')}" var="err">
	<div><span style="color:red;">${err.text}</span></div>
</c:forEach><br />
</div>
<div class="form-group">
                    <label for="pincode">Pincode<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="pincode" placeholder="Enter pincode" maxlength="255"/>
                      <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('pincode')}" var="err">
	<div><span style="color:red;">${err.text}</span></div>
</c:forEach><br />
</div>
<button name ="_eventId_back" type="submit" class="btn btn-warning"><i class="fa fa-arrow-circle-o-left" aria-hidden="true"></i>
 Back</button>
<button name ="_eventId_submit" type="submit" class="btn btn-success pull-right">Continue <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
 </button>
 </div>
</form:form>
</div>

<%@include file="footer.jsp" %>