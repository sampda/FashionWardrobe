<%@include file="header.jsp" %>
 
 <div class="container"> 
 <h4>CART LIST</h4> 
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
                    <table id="mytable" class="table table-hover">
                    <thead>
                      <th ng-click="sort('productName')">Name
<span class="glyphicon sort-icon" ng-show="sortKey=='productName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       <th ng-click="sort('productPrice')">Price
<span class="glyphicon sort-icon" ng-show="sortKey=='productPrice'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       <th ng-click="sort('productQuantity')">Quantity
<span class="glyphicon sort-icon" ng-show="sortKey=='productQuantity'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       <th ng-click="sort('productDiscount')">Discount
<span class="glyphicon sort-icon" ng-show="sortKey=='productDiscount'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       
                       <th>Product Image</th>
                       <th>Total Price</th>
                       <th></th>
                    </thead>
                    <tbody>
<tr dir-paginate="x in resultValue=(cartList | filter: test) | orderBy:sortKey:reverse | itemsPerPage: maxsize" pagination-id="Product">
                        
                        <td>{{x.productName}}</td>
                        <td>{{x.productPrice}}</td>
                        <td>{{x.productQuantity}}</td>
                        <td>{{x.productDiscount}}</td>
                        

                        <td><img src="resources/images/product{{x.productId}}.jpg" width="200" height="200"></td>
                        <td>
                        <div ng-if="x.productDiscount == 0">Rs. {{x.productPrice * x.productQuantity}}</div>
                        <div ng-if="x.productDiscount != 0">Rs. {{x.productDiscount * x.productQuantity}}</div>
                        </td>
                        <td>
     
      <a href ="deleteCartItem-{{x.cartItemId}}"><i class="fa fa-trash-o fa-2x" data-toggle="tooltip" title="Delete"></i></a>
                       </td>
                     </tr>
                     <tr>
                     <td><a href="home" class="btn btn-lg btn-primary"><i class="fa fa-shopping-basket"></i> Continue Shopping</a></td>
                     
                     <td></td>
                     <td></td>
                     <td></td>
                     
                      <td>Grand Total:</td>
                     <td>  Rs {{resultValue | totalSumPriceQty:'productQuantity':'productPrice':'productDiscount'}}</td>
                     
                    
                     <td>
                     <div ng-if="resultValue != ''"><a href="checkout" class="btn btn-lg btn-primary"><i class="fa fa-credit-card"></i> Checkout</a></div>
                    
      </td>
                     
                     </tr>
				   </tbody>
                   </table>
                   
     <dir-pagination-controls  class="pull-right" max-size="5" pagination-id="Product" direction-links="true" boundary-links="true">
                </dir-pagination-controls>
                
                </div>
</div>
<script>
var app = angular.module('myApp', ['angularUtils.directives.dirPagination']).filter('totalSumPriceQty', function () {
    return function (data, key1, key2, key3) {
        
        if (typeof (data) === 'undefined' && typeof (key1) === 'undefined' && typeof (key2) === 'undefined'  && typeof (key3) === 'undefined') {
            return 0;
        }
        var sum = 0;
        for (var i = 0; i < data.length; i++) 
        {
        	if(parseInt(data[i][key3]) == 0)
        		{
        		sum = sum + (parseInt(data[i][key1]) * parseInt(data[i][key2]));
        		}
        	else
        		{
        		sum = sum + (parseInt(data[i][key1]) * parseInt(data[i][key3]));
        	
        		}
            
        }
        return sum;
    }
});    
 app.controller('myCtrl', function($scope,$filter) 
		 {
	 $scope.cartList = ${cartList};
   
    $scope.sort = function(keyname) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
      };
      
   
});


 </script>
<%@include file="footer.jsp" %>
