<%@include file="header.jsp" %>

<div class="container"> 
<h4>WISH LIST</h4> 
 <hr> 
     <div class="row">
       <div class="col-xs-6">
       
             <label>Search</label>
             <input type="text" ng-model="test"/>
 </div>
 
 <div class="col-xs-6">
 <div class="form-inline">
           <label>Show</label>
          <select class="form-control1" ng-model="maxsize" ng-init="maxsize=5">
            <option ng-selected="true">5</option>
            <option>10</option>
            <option>15</option>
            <option>20</option>  
          </select>
           <label>entries</label>
           
           </div>
  </div>
       
       </div>   
           <hr>  
        
  </div> 

<div class="container">
<div class="table-responsive">
                    <table id="mytable" class="table table-hover" >
                    <thead>
                       <th ng-click="sort('productName')">Name
<span class="glyphicon sort-icon" ng-show="sortKey=='productName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                     <th ng-click="sort('productPrice')">Price
<span class="glyphicon sort-icon" ng-show="sortKey=='productPrice'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       
                       <th></th>
                       <th></th>
                     <th>Image</th>
                       
                    </thead>
                    <tbody>
                     <tr dir-paginate="x in wishList | filter: test | orderBy:sortKey:reverse | itemsPerPage: maxsize" pagination-id="Product">
                        
                        <td>{{x.productName}}</td>
                        <td><i class="fa fa-inr"></i> {{x.productPrice}}</td>
                        <td>
        <a href ="addCart-{{x.productId}}-1"><i class="fa fa-shopping-cart fa-2x" data-toggle="tooltip" title="Add To Cart"></i></a></td>
     <td> <a href ="deleteWishList-{{x.wishListId}}"><i class="fa fa-trash-o fa-2x" data-toggle="tooltip" title="Delete"></i></a>
                       </td>
                        <td><img src="resources/images/product{{x.productId}}.jpg" width="200" height="200"></td>
                        
                     </tr>
                    <tr>
                    
                     <td><a href="home" class="btn btn-lg btn-primary"><i class="fa fa-shopping-basket"></i> Continue Shopping</a></td>	
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     </tr>
				   </tbody>
				   
                			   
				   
                   </table>
                   </div>
                    <dir-pagination-controls  class="pull-right" max-size="5" pagination-id="Product" direction-links="true" boundary-links="true">
                </dir-pagination-controls>
                   
</div>


<script>


var app = angular.module('myApp', ['angularUtils.directives.dirPagination']);
 app.controller('myCtrl', function($scope) 
		 {
    $scope.wishList = ${wishList};
    $scope.sort = function(keyname) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
      };
      
		 });
 
 </script>
<%@include file="footer.jsp" %>
