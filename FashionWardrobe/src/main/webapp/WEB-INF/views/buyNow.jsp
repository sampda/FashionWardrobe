<%@include file="header.jsp" %>
<div class="container"> 
  
  <div class="table-responsive">
                    <table id="mytable" class="table table-hover">
                    <thead>
                    
                       <th>Name</th>
                       <th>Price</th>
                       <th>Quantity</th>
                       <th>Discount</th>
                       <th>Total Price</th>
                      
                       <th>Product Image</th>
                       
                      
                    </thead>
                    <tbody>
                    <tr>
                        
                        <td>{{cartitem.productName}}</td>
                        <td>{{cartitem.productPrice}}</td>
                        <td>{{cartitem.productQuantity}}</td>
                        <td>{{cartitem.productDiscount}}</td>
                         <td>
                        <div ng-if="cartitem.productDiscount == 0">Rs. {{cartitem.productPrice * cartitem.productQuantity}}</div>
                        <div ng-if="cartitem.productDiscount != 0">Rs. {{cartitem.productDiscount * cartitem.productQuantity}}</div>
                        </td>
                    
                        <td><img src="resources/images/product{{cartitem.productId}}.jpg" width="200" height="200"></td>
                        
                     </tr>
                     <tr>
                        <td>
     
     <a href="home" class="btn btn-lg btn-primary"><i class="fa fa-trash-o"></i> Delete</a>
                       </td>
                     
                     
                     <td>
                     
                     </td>
                     <td></td>
                     <td></td>
                     <td></td>
                      <td>
                     <a href="checkout" class="btn btn-lg btn-primary"><i class="fa fa-credit-card"></i> Checkout</a>
                    
                    </td>
                     
                     </tr>
				   </tbody>
                   </table>
                </div>
</div>

<script>


var app = angular.module('myApp', []);
 app.controller('myCtrl', function($scope) 
		 {
    $scope.cartitem = ${cartItemList};
		 
      
		 });
 
 </script>
<%@include file="footer.jsp" %>
