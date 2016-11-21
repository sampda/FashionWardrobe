<%@include file="header.jsp" %>

<div class="container">
	<div class="row">
    	<!-- BEGIN PRODUCTS -->
    	<div class="col-xs-3">
    	<div ng-click="sort('productPrice')">Price
<span class="glyphicon sort-icon" ng-show="sortKey=='productPrice'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
        </div>
        </div>
        <div class="col-md-4 col-xs-3">
        <div ng-click="sort('productId')">Arrival
<span class="glyphicon sort-icon" ng-show="sortKey=='productId'" ng-class="{'glyphicon-chevron-up':!reverse,'glyphicon-chevron-down':reverse}"></span>
        </div>
        </div>
        <div class="col-md-4 col-xs-3">
        <div ng-click="sort('productName')">Name
<span class="glyphicon sort-icon" ng-show="sortKey=='productName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
        </div>
        </div>
        </div>
        <div class="row">
        
        <div ng-repeat="k in abc">
        <div class="col-xs-3">
         <label><input type="checkbox" ng-click="myNewFilter(k.subCategoryname)"/> {{k.subCategoryname}}</label>
        </div>
         </div>
        </div>
        
        <div class="row">
        <hr>
  		<div ng-repeat="x in abc | filter: display | orderBy:sortKey:reverse | filter:nextFilter" class="col-md-3 col-sm-6">
    		<span class="thumbnail">
      			<a href="viewfullproduct-{{x.productId}}"><img src="resources/images/product{{x.productId}}.jpg"></a>
      			<hr>
      			<h4>{{x.productName}}</h4>
      		    <p><i class="fa fa-inr"></i> {{x.productPrice}}</p>	
      		 <a class="btn icon-btn btn-primary" href="buyNow-{{x.productId}}?userId=1" data-toggle="tooltip" data-placement="bottom" title="Buy Now">
      		 <span class="glyphicon btn-glyphicon glyphicon-credit-card img-circle text-primary"></span></a>
      	     <a class="btn icon-btn btn-primary" href="buyNow-{{x.productId}}?userId=1" data-toggle="tooltip" data-placement="bottom" title="Add To WishList">
      	     <span class="glyphicon btn-glyphicon glyphicon-heart img-circle text-primary"></span></a>
      	     <a class="btn icon-btn btn-primary" href="buyNow-{{x.productId}}?userId=1" data-toggle="tooltip" data-placement="bottom" title="Add To Cart">
      	     <span class="glyphicon btn-glyphicon glyphicon-shopping-cart img-circle text-primary"></span></a> 
    		</span>
  		</div>
  		
  		
  		<!-- END PRODUCTS -->
	</div>
</div>
<script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http, $location) {
   $scope.display=location.search.substr(8).replace(/%20/g," ");
   
   $scope.abc = ${stringFullProductEnabled};
    
   $scope.sort = function(keyname) {
       $scope.sortKey = keyname; //set the sortKey to the param passed
       $scope.reverse = !$scope.reverse; //if true make it false and vice versa
     };
     
     $scope.myFilter = [];
	    
	    $scope.myNewFilter = function(subCategoryname) {
	        var i = $.inArray(subCategoryname, $scope.myFilter);
	        if (i > -1) {
	            $scope.myFilter.splice(i, 1);
	        } else {
	            $scope.myFilter.push(subCategoryname);
	        }
	    };
	    
	    $scope.nextFilter = function(abc) {
	        if ($scope.myFilter.length > 0) {
	            if ($.inArray(abc.subCategoryname, $scope.myFilter) < 0)
	                return;
	        }
	        
	        return abc;
	    };


});

</script>

<%@include file="footer.jsp" %>
