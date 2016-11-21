<%@include file="header.jsp" %>

    <form class="form-signin" method="POST" action="perform_login" style="margin-top:200px">       
      <h2 class="form-signin-heading" style="color:#551A8B">Login</h2>
      <input type="text" class="form-control" name="username" placeholder="Username" required maxlength="255"/>
      <input style="margin-top:10px;" type="password" class="form-control" name="password" placeholder="Password" required/>      
      
      <button style="margin-top:20px;" class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>  
		

<%@include file="footer.jsp" %>