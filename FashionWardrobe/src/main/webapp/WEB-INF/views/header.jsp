<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ page isELIgnored="false" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


          <!DOCTYPE html>
          <html>

          <head>
            <title>Fashion Wardrobe</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <script src="resources/js/jquery.min.js"></script>
            <script src="resources/js/angular.min.js"></script>
            <script src="resources/js/jquery.autocomplete.min.js"></script>	
            <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
            <script src="resources/js/bootstrap.min.js"></script>  
            <link href="resources/css/mystyle.css" rel="stylesheet" />
            <link href="resources/css/style.css" rel="stylesheet" />
             <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
            
            <link rel="icon" href="resources/images/dress1.png">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          </head>

          <body ng-app="myApp" ng-controller="myCtrl">

           
              <!-- Second navbar for categories -->
              <nav class="navbar navbar-default">
                <div class="container">
                  <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand " href="home" style="color:#ffffff"><img class="hidden-xs" src="resources/images/dress.png" width="50px" height="50px" />Fashion Wardrobe</a>
                  </div>
                  
                  <!-- Collect the nav links, forms, and other content for toggling -->
                  <div class="collapse navbar-collapse" id="navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                   
                      <li><a href="home">Home</a></li>
                      <li><a href="#">About</a></li>
                      <li><a href="#">Services</a></li>
                      <li><a href="contactUs">Contact</a></li>
                      <li id="navbar-col1">
                        <a data-toggle="collapse"  href="#nav-collapse1" aria-expanded="false" aria-controls="nav-collapse1">Categories</a>
                      </li>
                    </ul>

                    <!--  HERE FOREACH LOOP FOR CATEGORIES          -->

                    <ul class="collapse nav navbar-nav nav-collapse" id="nav-collapse1">
                    
                    <c:forEach var="category" items="${listCategory}">
                    
                      <li><a href="productdisplay?search=${category.categoryName}"><c:out value="${category.categoryName}"/></a></li>
                   </c:forEach>
                   <li id="navbar-col2" style="z-index:99;">
                        <a  data-toggle="collapse"  href="#nav-collapse2" aria-expanded="false" aria-controls="nav-collapse2">SubCategories</a>
                      </li>
                    </ul>
                    <ul class="collapse nav navbar-nav nav-collapse" id="nav-collapse2">
                    <c:forEach var="subcategory" items="${listsubCategory}">
                    
                      <li><a href="productdisplay?search=${subcategory.subCategoryName}"><c:out value="${subcategory.subCategoryName}"/></a></li>
                   </c:forEach>
                    </ul>


                  </div>
                  <!-- /.navbar-collapse -->
                  
                </div>
                <!-- /.container -->
              </nav>
              <!-- /.navbar -->

              <!-- Second navbar for sign in -->
              <nav class="navbar navbar-default" style="margin-top:0px;">
                <div class="container">
                  <!-- Brand and toggle get grouped for better mobile display -->


                  <!-- Collect the nav links, forms, and other content for toggling -->

                  <ul class="nav navbar-nav navbar-right">
<!--                    <li> -->
                   
<%--                       <form action="" class="search-form hidden-xs" style="margin-top:10px;margin-right:10px;" > --%>
<!--                         <div class="form-group has-feedback"> -->
<!--                           <label for="search" class="sr-only">Search</label> -->
<!--                           <input type="text" class="form-control" name="search" id="search" placeholder="search" > -->
<!--                           <span class="glyphicon glyphicon-search form-control-feedback"></span> -->
<!--                         </div> -->
<%--                       </form> --%>
                     
<!--                    </li> -->
                  <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ANONYMOUS')">
                    <li>
                      <a href="myCart">My Cart</a>
                    </li>
                    </sec:authorize>
                      <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ANONYMOUS')">
                  <li>
                      <a href="myWishList">My Wishlist</a>
                    </li>
                    </sec:authorize>
                     <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                          <li><a href="admin">Admin Panel</a>
                          </li>
                    </sec:authorize> 
                    <sec:authorize access="hasRole('ROLE_USER')">
                           <li><a href="userpanel-${pageContext.request.userPrincipal.name}">User Profile</a></li>
                    </sec:authorize>
                         <sec:authorize access="hasRole('ROLE_SUPPLIER')">
                      <li><a href="supplierPanel-${pageContext.request.userPrincipal.name}">Supplier Panel</a></li>
                      
                      </sec:authorize> 
                    
                      <li><a href="perform_logout">Sign Out</a></li>
                      <li><a href="home">Welcome,${pageContext.request.userPrincipal.name}</a></li>
                      </c:if>
                      
                      
                      <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li>
                      <a href="register">Sign Up</a>
                    </li>
                    <li>
                      <a href="login">Sign in</a>
                    </li>
                    </c:if>
                    
               
                  </ul>

                </div>
                <!-- /.container -->
              </nav>
              <!-- /.navbar -->
               <div class="container" style="margin-top:2px;">
                         <div class="input-group">	 
            	<input type="text" class="form-control" onkeypress="enterfunction(event)" ng-model="display" placeholder="Search.." id="search" value="">
	              <span class="input-group-btn">
	               <!-- 		         <a href="productdisplay?search={{display}}"> -->
<button onclick="filterredirect()" class="btn btn-info" id="search_button" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
	             </span>
                         </div>
                        
               </div>
      <script type="text/javascript">
      function filterredirect()
      {
      	window.location.href = "productdisplay?search="+document.getElementById('search').value;
      };
      
      function enterfunction(e)
      {
    	  if(e.keyCode==13)
    		  {
    		      window.location.href = "productdisplay?search="+document.getElementById('search').value;
    		  }
      };
      
      
      
      $(document).ready(function() {

    		$('#search').autocomplete({
    			serviceUrl: '${pageContext.request.contextPath}/getTags',
    			paramName: "categoryName",
    			delimiter: ",",
    		   transformResult: function(response) {

    			return {
    			  //must convert json to javascript object before process
    			  suggestions: $.map($.parseJSON(response), function(item) {

    			      return { value: item.categoryName, data: item.categoryId };
    			   })

    			 };

    	            }

    		 });

    	  });
      
      var url=window.location.href.split('?')[0];
      if(url=="http://localhost:8080/FashionWardrobe/reg")
    	  {
    	       $("#search").hide();
    	       $("#search_button").hide();
    	       $("#nav-collapse1").hide();
    	  }

      </script>  
      <div class="wrapper" style="margin-top:50px">    

          
            
            
      
