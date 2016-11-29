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
             <script src="resources/js/dirPagination.js"></script>
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
                   
                      <li><a href="home"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                      <li><a href="#"><i class="fa fa-info-circle" aria-hidden="true"></i> About</a></li>
                      <li><a href="contactUs"><i class="fa fa-address-book" aria-hidden="true"></i> Contact</a></li>
                      <li id="navbar-col1">

                         <a class="btn btn-default btn-outline btn-circle1 collapsed"  data-toggle="collapse" href="#nav-collapse1" aria-expanded="false" aria-controls="nav-collapse1">Categories</a>
                      </li>
                    </ul>

                    <!--  HERE FOREACH LOOP FOR CATEGORIES          -->

                    <ul class="collapse nav navbar-nav nav-collapse" id="nav-collapse1">
                    
                    <c:forEach var="category" items="${listCategory}">
                    
                      <li><a href="productdisplay?search=${category.categoryName}"><c:out value="${category.categoryName}"/></a></li>
                   </c:forEach>
<!--                    <li id="navbar-col2"> -->
<!--                     <a class="btn btn-default btn-outline btn-circle1 collapsed"  data-toggle="collapse" href="#nav-collapse2" aria-expanded="false" aria-controls="nav-collapse2">SubCategories</a> -->
                    
<!--                       </li> -->
                    </ul>
<!--                     <ul class="collapse nav navbar-nav nav-collapse" id="nav-collapse2"> -->
<%--                     <c:forEach var="subcategory" items="${listsubCategory}"> --%>
                    
<%--                       <li><a href="productdisplay?search=${subcategory.subCategoryName}"><c:out value="${subcategory.subCategoryName}"/></a></li> --%>
<%--                    </c:forEach> --%>
<!--                     </ul> -->


                  </div>
                  <!-- /.navbar-collapse -->
                  
                </div>
                <!-- /.container -->
              </nav>
              <!-- /.navbar -->

              <!-- Second navbar for sign in -->
              <nav class="navbar navbar-default" style="margin-top:0px;">
                <div class="container">
                


                  <!-- Collect the nav links, forms, and other content for toggling -->

                  <ul class="nav navbar-nav navbar-right">
                  <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
                    <li>
                      <a href="cartList"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Cart</a>
                    </li>
                  
                     
                    <li>
                      <a href="wishList"><i class="fa fa-heart" aria-hidden="true"></i> Wishlist</a>
                    </li>
                  
                    </sec:authorize>
                     <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                          <li><a href="admin"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Admin Panel</a>
                          </li>
                    </sec:authorize> 
                    <sec:authorize access="hasRole('ROLE_USER')">
                           <li><a href="userpanel"><i class="fa fa-user-circle-o" aria-hidden="true"></i> User Profile</a></li>
                           
                    </sec:authorize>
                         <sec:authorize access="hasRole('ROLE_SUPPLIER')">
                      <li><a href="supplierPanel"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Supplier Panel</a></li>
                      
                      </sec:authorize> 
                    
                      <li><a href="perform_logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                      <sec:authorize access="hasAnyRole('ROLE_SUPPLIER','ROLE_ADMIN')">
                      <li><a href="home">Welcome,${pageContext.request.userPrincipal.name}</a></li>
                      </sec:authorize>
                       <sec:authorize access="hasRole('ROLE_USER')">
                      <li class="dropdown">
          <a href="home" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome,${pageContext.request.userPrincipal.name} <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li>
                      <a href="cartList"><i class="fa fa-shopping-cart" aria-hidden="true"></i> My Cart</a>
                    </li>
                    <li role="separator" class="divider"></li>
             <li>
                      <a href="wishList"><i class="fa fa-heart" aria-hidden="true"></i> My Wishlist</a>
                    </li>
                    <li role="separator" class="divider"></li>
             <li>
                             <a href="orderList"><i class="fa fa-list" aria-hidden="true"></i> My Order History</a>
             </li>
            
          </ul>
        </li>
             </sec:authorize>       
                      </c:if>
                      
                      
                      <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li>
                      <a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a>
                    </li>
                    <li>
                      <a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a>
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
    			paramName: "subCategoryName",
    			delimiter: ",",
    		   transformResult: function(response) {

    			return {
    			  //must convert json to javascript object before process
    			  suggestions: $.map($.parseJSON(response), function(item) {

    			      return { value: item.subCategoryName, data: item.subCategoryId };
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

          
            
            
      
