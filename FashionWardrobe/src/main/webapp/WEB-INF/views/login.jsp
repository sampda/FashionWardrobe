<%@include file="header.jsp" %>

    <form class="form-signin" method="POST" action="perform_login" style="margin-top:200px;max-width:400px;">  
     <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
      <div class="alert" style="background-color:white;color:#01579B;border-color:#01579B;"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        
        <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.
        <c:remove var = "SPRING_SECURITY_LAST_EXCEPTION" scope = "session" />
      </div>
    </c:if>
         
      <h2 class="form-signin-heading" style="color:#01579B">Login</h2>
      <hr>
      <div class="input-group">
  <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
 <input type="text" class="form-control" name="username" placeholder="Username" required maxlength="255"/>
</div>
<div class="input-group" style="margin-top:20px;">
  <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
  <input type="password" class="form-control" name="password" placeholder="Password" required/>
</div>
      
      <button style="margin-top:30px;" class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>  
		

<%@include file="footer.jsp" %>