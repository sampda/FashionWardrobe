<%@include file="header.jsp" %>

<div class="container">
        <div class="row">
	       <div class="col-md-12">
               <h4>Cart Item List</h4>
<hr>
               <div class="table-responsive">
                    <table id="mytable" class="table table-bordred table-striped" bgcolor="#00FF00">
                    <thead>
                      
                       <th>ProductName</th>
                       <th>ProductPrice</th>
                       <th>ProductQuantity</th>
                       <th>ProductDiscount</th>
                       <th>Order Date</th>
                       <th>Product Image</th>
                       <th>Manage</th>
                    </thead>
                    <tbody>
                     <tr>
                        
                        <td>{{cartitem.productName}}</td>
                        <td>{{cartitem.productPrice}}</td>
                        <td>{{cartitem.productQuantity}}</td>
                        <td>{{cartitem.productDiscount}}</td>
                        <td>{{cartitem.orderDate}}</td>
                        <td><img src="resources/images/product{{cartitem.productId}}.jpg" width="200" height="200"></td>
                        <td>
      <a href ="checkout"><i class="fa fa-credit-card fa-2x"  data-toggle="tooltip" title="Checkout"></i></a>
      <a href ="deleteCartItem-{{cartitem.cartItemId}}"><i class="fa fa-trash-o fa-2x" data-toggle="tooltip" title="Delete"></i></a>
                       </td>
                     </tr>
                     
				   </tbody>
                   </table>
                   
</div>
</div>
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
