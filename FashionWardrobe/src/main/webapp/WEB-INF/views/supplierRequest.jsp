<%@include file="header.jsp" %>
<div class="container">
<c:set var="page" value="supplierRequest" scope="session"/>

 <h4>ENABLE PRODUCT LIST</h4> 
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
                       <th ng-click="sort('productId')">#
<span class="glyphicon sort-icon" ng-show="sortKey=='productId'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       <th ng-click="sort('productName')">ProductName
<span class="glyphicon sort-icon" ng-show="sortKey=='productName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                      </th>
                       <th ng-click="sort('productPrice')">ProductPrice
<span class="glyphicon sort-icon" ng-show="sortKey=='productPrice'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       <th ng-click="sort('productQauntity')">ProductQuantity
<span class="glyphicon sort-icon" ng-show="sortKey=='productQauntity'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       <th ng-click="sort('productDiscount')">ProductDiscount
<span class="glyphicon sort-icon" ng-show="sortKey=='productDiscount'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       </th>
                       <th ng-click="sort('date')">Date
<span class="glyphicon sort-icon" ng-show="sortKey=='date'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                      <th ng-click="sort('supplierId')">Supplier Id
<span class="glyphicon sort-icon" ng-show="sortKey=='supplierId'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                      
                       <th>Product Image</th>
                        <th ng-click="sort('enabled')">Product Enable/Disable
<span class="glyphicon sort-icon" ng-show="sortKey=='enabled'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                      
                      
                       <th>Total Price</th>
                       <th></th>
                       <th></th>
                    </thead>
                    <tbody>
                    
                     <tr dir-paginate="x in resultValue=(abc | filter: test) | orderBy:sortKey:reverse| itemsPerPage: maxsize" pagination-id="Product">
                        <td>{{x.productId}}</td>
                        <td>{{x.productName}}</td>
                        <td>{{x.productPrice}}</td>
                        <td>{{x.productQauntity}}</td>
                        <td>{{x.productDiscount}}</td>
                        <td>{{x.date}}</td>
                        <td>{{x.supplierId}}</td>
                        <td><img src="resources/images/product{{x.productId}}.jpg" width="100" height="100"></td>
                        <td>{{x.enabled}}</td>
                        <td>Rs. {{x.productPrice * x.productQauntity}}</td>
                        <td>
                        
                        
      	<a class="btn btn-primary btn-circle" href="deleteProduct-{{x.productId}}" data-toggle="tooltip"  title="Delete">
      		 <i class="glyphicon glyphicon-remove"></i></a></td>
      		 <td>
      <a class="btn btn-primary btn-circle" href="enableproduct-{{x.productId}}" data-toggle="tooltip" title="Enable/Disable">
      		 <i class="fa fa-exchange"></i></a>
      
       
      </td>
      
      
                     </tr>

                   
                     
                     <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td>Grand Total:</td>
                     <td>  Rs {{resultValue | totalSumPriceQty:'productQauntity':'productPrice'}}</td>
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
var app = angular.module('myApp', ['angularUtils.directives.dirPagination']).filter('totalSumPriceQty', function () {
    return function (data, key1, key2) {
        
        if (typeof (data) === 'undefined' && typeof (key1) === 'undefined' && typeof (key2) === 'undefined') {
            return 0;
        }
        var sum = 0;
        for (var i = 0; i < data.length; i++) {
            sum = sum + (parseInt(data[i][key1]) * parseInt(data[i][key2]));
        }
        return sum;
    }
});    
 app.controller('myCtrl', function($scope,$filter) 
		 {
    $scope.abc = ${supplierRequest};
   
    $scope.sort = function(keyname) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
      };
      
   
});

$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip({
	    	placement : 'top'
	    	}); 
 });
   
</script>

<%@include file="footer.jsp" %>