<%@include file="header.jsp" %>
    
<div class="container">
	<div class="row">
    	<!-- BEGIN PRODUCTS -->
    	<div class="col-md-3 col-sm-3 col-xs-6">
    	<div ng-click="sort('productPrice')">
    	<button type="button" class="btn btn-primary btn-lg btn3d" style="margin-top:10px;"> Price
<span class="glyphicon sort-icon" ng-show="sortKey=='productPrice'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></button>
        </div>
        </div>
        
        <div class="col-md-3 col-sm-3 col-xs-6">
        <div ng-click="sort('productId')">
        <button type="button" class="btn btn-primary btn-lg btn3d" style="margin-top:10px;"> Arrival
<span class="glyphicon sort-icon" ng-show="sortKey=='productId'" ng-class="{'glyphicon-chevron-up':!reverse,'glyphicon-chevron-down':reverse}"></span></button>
        </div>
        </div>
        
        <div class="col-md-3 col-sm-3 col-xs-6">
        <div ng-click="sort('productName')">
        <button type="button" class="btn btn-primary btn-lg btn3d" style="margin-top:10px;"> Name
<span class="glyphicon sort-icon" ng-show="sortKey=='productName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></button>
        </div>
        </div>
        
        <div class="col-md-3 col-sm-3 col-xs-6">
        <div ng-click="sort('productDiscount')">
        <button type="button" class="btn btn-primary btn-lg btn3d" style="margin-top:10px;"> discount
<span class="glyphicon sort-icon" ng-show="sortKey=='productDiscount'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></button>
        </div>
        </div>
        
        </div>
        
        <hr>
        <div class="row">
        <p>SubCategory</p>
        <div ng-repeat="k in abc | filter: display | unique: 'subCategoryname'">
        <div class="col-xs-3">
         <label><input type="checkbox" ng-click="myNewFilter(k.subCategoryname)"/> {{k.subCategoryname}}</label>
        </div>
         </div>
        </div>
        
        <hr>
        
    <div ng-repeat="x in abc | filter: display | orderBy:sortKey:reverse | filter:nextFilter" class="col-md-3 col-sm-3 col-xs-12">
            <div class="list-quotes" >
                <!-- Recommended size 360X360 -->
                <a href="viewfullproduct-{{x.productId}}"><img src="resources/images/product{{x.productId}}.jpg" style="width:100%;height:360px;">
                
                    <h1>{{x.productName}}</h1></a>
                                  
                    
                    <div class="quotes">
                    <div ng-if="x.productQauntity != 0">
                    <a href="buyNow-{{x.productId}}?userId=1"><span class="glyphicon year glyphicon-credit-card" data-toggle="tooltip" data-placement="bottom" title="Buy Now"></span></a>
                    <a href="addCart-{{x.productId}}-1"><span class="glyphicon cat-name glyphicon-shopping-cart" data-toggle="tooltip" data-placement="right" title="Add To Cart"></span></a>
                    <div ng-if="x.productDiscount == 0">
      	          	   	<p><span class="pricing-list-v4-price-sign">  <i class="fa fa-inr"></i>{{x.productPrice}}</span>
      	          	
                       <a href="wishList-{{x.productId}}"><span class="glyphicon glyphicon-heart pull-right" data-toggle="tooltip" data-placement="left" style="z-index:99" title=" Add To Wishlist"></span></a>
                         </p>
      		    </div>
      		    <div ng-if="x.productDiscount != 0">
      		     	<p><span class="pricing-list-v4-price-sign"><i class="fa fa-inr"></i><strike>{{x.productPrice}}</strike> {{x.productDiscount}} ({{Math.round((((x.productPrice - x.productDiscount)/ x.productPrice) * 100))}}) % off!</span>
      		     	      	      
      		     	 <a href="wishList-{{x.productId}}"><span class="glyphicon glyphicon-heart pull-right" data-toggle="tooltip" data-placement="left" style="z-index:99" title=" Add To Wishlist"></span></a>
                         </p>
      		     	
                    
                    </div>
                    </div>
                    <div ng-if="x.productQauntity == 0">
                    <a href="buyNow-{{x.productId}}?userId=1"><span class="glyphicon year glyphicon-credit-card" data-toggle="tooltip" data-placement="bottom" title="Buy Now"></span></a>
                    <a href="addCart-{{x.productId}}"><span class="glyphicon cat-name glyphicon-shopping-cart" data-toggle="tooltip" data-placement="right" title="Add To Cart"></span></a>
                    
                    <div ng-if="x.productDiscount == 0">
      	          	   	<p>  <span class="pricing-list-v4-price-sign"><i class="fa fa-inr"></i>{{x.productPrice}}
      	          	   	OUT OF STOCK!!!</span>
                       <a href="wishList-{{x.productId}}"><span class="glyphicon glyphicon-heart pull-right" data-toggle="tooltip" data-placement="left" style="z-index:99" title=" Add To Wishlist"></span></a>
                         </p>
      		    </div>
      		    <div ng-if="x.productDiscount != 0">
      		     	<p><i class="fa fa-inr"></i><strike>{{x.productPrice}}</strike> {{x.productDiscount}} ({{Math.round((((x.productPrice - x.productDiscount)/ x.productPrice) * 100))}}) % off!
      		     	      	          	   	OUT OF STOCK!!!
      		     	 <a href="wishList-{{x.productId}}"><span class="glyphicon glyphicon-heart pull-right" data-toggle="tooltip" data-placement="left" style="z-index:99" title=" Add To Wishlist"></span></a>
                         </p>
      		     	
      		    </div>
                   </div>     
                       
                </div>
            </div>
        </div>  
        
</div>  		
  		
<script>
var app = angular.module('myApp', ['ui.directives','ui.filters']);
app.controller('myCtrl', function($scope, $http, $location) {
   $scope.display=location.search.substr(8).replace(/%20/g," ");
   
   $scope.abc = ${stringFullProductEnabled};
   $scope.Math = window.Math;
  
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
