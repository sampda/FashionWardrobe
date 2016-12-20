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
            <script src="resources/js/angular-ui.min.js"></script>
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
  <nav class="navbar navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-toggle collapsed" data-target="#navbar" data-toggle="collapse">
                <i class="fa fa-chevron-down faa-vertical animated"></i>
            </a>
            
            <a href="home" tabindex="0" class="navbar-brand">
                <i class="fa fa-lg faa-pulse faa-slow animated"><img src="resources/images/dress1.png" width="30px" height="30px"> Fashion Wardrobe</i>
                
                
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="hidden-sm">
                    <a href="home" class="faa-parent animated-hover">
                       <i class="fa fa-fw fa-lg fa-home faa-tada faa-fast"></i>Home
                    </a>
                </li>
                <li class="hidden-sm">
                    <a href="aboutUs" class="faa-parent animated-hover">
    	               <i class="fa fa-fw fa-lg fa-quote-left faa-tada faa-fast"></i>About Us
                    </a>
                </li>
                <li class="hidden-sm">
                     <a href="contactUs" class="faa-parent animated-hover">
                      <i class="fa fa-fw fa-lg fa-map-marker faa-tada faa-fast" aria-hidden="true"></i>Contact
                     </a>
                </li>
                
                	<li class="dropdown mega-dropdown hidden-xs" id="megamenu_button">
                	 <a href="productdisplay?search=" class="dropdown-toggle faa-parent animated-hover" data-toggle="dropdown">
    	               <i class="fa fa-fw fa-lg fa-th faa-tada faa-fast"></i>Collection
    	               <span class="fa fa-caret-down"></span>
                    </a>
                   				
				<ul class="dropdown-menu mega-dropdown-menu">
					<c:forEach var="category" items="${listCategory}">					
					<li class="col-sm-4">
						<ul>
							<li class="dropdown-header"><a href="productdisplay?search=${category.categoryName}" style="color:#01579B;"><strong>${category.categoryName}</strong></a></li>
							<c:forEach var="subcategory" items="${category.subCategory}">
							<li><a href="productdisplay?search=${subcategory.subCategoryName}" style="font-size:15px;">${subcategory.subCategoryName}</a></li>
							</c:forEach>
														
						</ul>
					</li>
					</c:forEach>
				</ul>				
			</li>
                
            </ul>
            <ul class="nav navbar-nav navbar-right">
             <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
                   <li>
                      <a href="cartList" class="faa-parent animated-hover">
                      <i class="fa fa-fw fa-lg fa-shopping-cart faa-tada faa-fast" aria-hidden="true"></i>Cart
                      </a>
                  </li>
                  <li>
                      <a href="wishList" class="faa-parent animated-hover">
                      <i class="fa fa-fw fa-lg fa-heart faa-tada faa-fast" aria-hidden="true"></i>Wishlist
                      </a>
                    </li>
                 </sec:authorize>
                
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li>
                    <a href="register" class="faa-parent animated-hover">
	                   <i class="fa fa-fw fa-lg fa-sign-in faa-tada faa-fast"></i>Sign Up
                    </a>
                </li>
                <li>
                    <a href="login" class="faa-parent animated-hover">
	                   <i class="fa fa-fw fa-lg fa-sign-in faa-tada faa-fast"></i>LogIn
                    </a>
                </li>
                
                
                </c:if>
                 
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li>
                          <a href="perform_logout">
                          <i class="fa fa-sign-out" aria-hidden="true"></i> Logout
                          </a>
                    </li>
                    
                    <li class="dropdown">
                          <a href="home" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome,${pageContext.request.userPrincipal.name} 
                           <span class="caret"></span>
                          </a>
                      <ul class="dropdown-menu">
                   
                          <li>
                          <a href="supplierRequest">
                          <i class="fa fa-user" aria-hidden="true"></i> Supplier Request
                          </a>
                          </li>
                          
                          <li>
                          <a href="admin">
                          <i class="fa fa-user" aria-hidden="true"></i> Admin Panel
                          </a>
                          </li>
                           </ul>
                    </li>  
                           
                    </sec:authorize> 
                   <sec:authorize access="hasRole('ROLE_SUPPLIER')">
                      <li>
                      <a href="supplierPanel">
                      <i class="fa fa-user" aria-hidden="true"></i> Supplier Panel
                      </a>
                      </li>
                       <li>
                       <a href="perform_logout">
                       <i class="fa fa-sign-out" aria-hidden="true"></i> Logout
                       </a>
                       </li>
                   </sec:authorize> 
                    <sec:authorize access="hasRole('ROLE_USER')">
                      <li>
                      <a href="cartList">
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i> My Cart  <span class="fa faa-flash faa-slow animated badge color">${sessionScope.cartListNo}</span>
                      </a>
                      </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_SUPPLIER')">
                          <li>
                          <a href="home">Welcome,${pageContext.request.userPrincipal.name}</a>
                          </li>
                    </sec:authorize>
                       <sec:authorize access="hasRole('ROLE_USER')">
                      <li class="dropdown">
                          <a href="home" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome,${pageContext.request.userPrincipal.name} 
                           <span class="caret"></span>
                          </a>
                      <ul class="dropdown-menu">
                   
                    <li>
                    <a href="userpanel">
                    <i class="fa fa-user" aria-hidden="true"></i> User Profile
                    </a>
                    </li>
                    <li role="separator" class="divider"></li>
                    <li>
                      <a href="wishList"><i class="fa fa-heart" aria-hidden="true"></i> My Wishlist</a>
                    </li>
                    <li role="separator" class="divider"></li>
                    <li>
                             <a href="orderList"><i class="fa fa-list" aria-hidden="true"></i> My Order History</a>
                    </li>
                     <li role="separator" class="divider"></li>
                    <li><a href="perform_logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                     </ul>
                </li>
             </sec:authorize>       
                      </c:if>
           
            </ul>
        </div>
    </div>
       
</nav>

 <nav class="navbar navbar-fixed-top" id="search_navbar" style="margin-top:50px;  z-index: 990;">
<div class="container">
  <form class="navbar-form" role="search">
        <div class="input-group" style="width:100%">
            <input type="text" class="form-control" onkeypress="enterfunction(event)" ng-model="display" id="search" placeholder="Search..">
            <div class="input-group-btn">
                <span class="btn btn-sm"><i onclick="filterredirect()" id="search_button" class="fa fa-search" style="font-size: 20px;color:#01579B;"></i></span>
            </div>
        </div>
   </form>
  </div>             
  </nav>             
      <script type="text/javascript">


    	(function(){

    		  $('#itemslider').carousel({ interval: 3000 });
    		}());

    		(function(){
    		  $('.carousel-showmanymoveone .item').each(function(){
    		    var itemToClone = $(this);

    		    for (var i=1;i<6;i++) {
    		      itemToClone = itemToClone.next();


    		      if (!itemToClone.length) {
    		        itemToClone = $(this).siblings(':first');
    		      }


    		      itemToClone.children(':first-child').clone()
    		        .addClass("cloneditem-"+(i))
    		        .appendTo($(this));
    		    }
    		  });
    		}());


    	$(function(){$('[data-toggle="popover"]').popover()});

    	
    	
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
        
        $(function(){
      	    $("#megamenu_button").hover(            
      	            function() {
      	                $('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
      	                $(this).toggleClass('open');
      	                $('b', this).toggleClass("caret caret-up");                
      	            },
      	            function() {
      	                $('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
      	                $(this).toggleClass('open');
      	                $('b', this).toggleClass("caret caret-up");                
      	            });
      	    });
      	   
             var url=window.location.href.split('?')[0];
        if(url=="http://localhost:8080/FashionWardrobe/reg")
      	  {
      	            	      
      	       $("#megamenu_button").hide();
      	  };

      	var app = angular.module('myApp', []);
        
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
        


      </script>  
          

           
<div class="wrapper" style="margin-top:150px">    

          
            
            
      
