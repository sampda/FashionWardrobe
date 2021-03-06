<%@include file="header.jsp" %>
<div class="container">

<form:form modelAttribute="userDetails">
<div class="form-signin" style="max-width:600px;">
<h4>Confirm Your Details</h4>
<div class="form-group">
                    <label>UserName</label>
                      <input type="text" class="form-control" name="userName" placeholder="${userDetails.username}" readonly/>
</div>
<div class="form-group">
                    <label>EmailId</label>
                      <input type="text" class="form-control" name="email_id" placeholder="${userDetails.emailId}" readonly/>
</div>
<div class="form-group">
                    <label>First Name</label>
                      <input type="text" class="form-control" name="firstName" placeholder="${userDetails.firstname}" readonly/>
</div>
<div class="form-group">
                    <label>Last Name</label>
                      <input type="text" class="form-control" name="lastName" placeholder="${userDetails.lastname}" readonly/>
</div>

<div class="form-group">
                    <label>Contact number</label>
                      <input type="text" class="form-control" name="contactNo" placeholder="${userDetails.contactno}" readonly/>
</div>
<button name ="_eventId_edit" type="submit" class="btn btn-warning"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
 Edit</button>
<button name ="_eventId_submit" type="submit" class="btn btn-success pull-right"><i class="fa fa-check-circle-o" aria-hidden="true"></i>
 Submit</button>
</div>
</form:form>
</div>

<%@include file="footer.jsp" %>