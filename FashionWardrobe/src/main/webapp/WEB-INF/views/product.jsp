<%@include file="header.jsp" %>
<div class="container">
<h2>${sessionScope.Error} 
 <c:set var="Error" value="" scope="session"/></h2>
 <c:set var="page" value="product" scope="session"/> 
<hr>
    <form:form method="POST" action="add/product" modelAttribute="product" enctype="multipart/form-data">
                 <form:input path="productId" hidden="true"/>
                  <div class="form-group">
                    <label for="productName">Product Name</label>
                      <form:input type="text" class="form-control" path="productName" placeholder="Enter Product Name" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="productName"/>
                  </div>
                  <div class="form-group">
                    <label for="productDesc">Product Description</label>
                      <form:input type="text" class="form-control" path="productDesc" placeholder="Enter Product Description" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="productDesc"/>
                  </div>
                  <div class="form-group">
                    <label for="productPrice">Product Price</label>
                      <form:input type="text" class="form-control" path="productPrice" placeholder="Enter Product Price"/>
                      
                  </div>
                   <div class="form-group">
                    <label for="productQauntity">Product Quantity</label>
                      <form:input type="text" class="form-control" path="productQauntity" placeholder="Enter Product Quantity" />
                      
                  </div>
                   <div class="form-group">
                    <label for="productDiscount">Product Discount</label>
                      <form:input type="text" class="form-control" path="productDiscount" placeholder="Enter Product Discount" />
                     
                  </div>
                  <div class="form-group">
                      <form:select path="category.categoryName"  class="form-control" items = "${listCategory}" itemValue="categoryName" itemLabel= "categoryName">
                      </form:select>
                  </div>
                  <div class="form-group">
                    <form:select path="subcategory.subCategoryName"  class="form-control" items = "${listsubCategory}" itemValue="subCategoryName" itemLabel= "subCategoryName">
                      </form:select>
                  </div>
                  <div class="form-group">
                    <form:select path="supplier.companyName"  class="form-control" items = "${listSupplier}" itemValue="companyName" itemLabel= "companyName">
                      </form:select>
                  </div>
         
                  <div class="form-group">
                    <label for="image">Upload Image</label>
                      <form:input class="form-control" path="productImage" type="file"/>
                  </div>
                  <button type="submit" class="btn btn-primary">Submit</button>
      </form:form>
<hr>

    <div class="container">
        <div class="row">
	       <div class="col-xs-12">
               <h4>Product List</h4>
<div>
<label>Search</label>
<input type="text" ng-model="test"/>
</div>
                         <div class="table-responsive">
                    <table id="mytable" class="table table-hover" >
          <thead>
                       <th ng-click="sort('productId')">ProductId
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
                      
                       <th>Product Image</th>
                       <th>Product Enable/Disable</th>
                       <th>Total Price</th>
                       <th>Manage</th>
                    </thead>
                    <tbody>
                    
                     <tr ng-repeat="x in resultValue=(abc | filter: test) | orderBy:sortKey:reverse">
                        <td>{{x.productId}}</td>
                        <td>{{x.productName}}</td>
                        <td>{{x.productPrice}}</td>
                        <td>{{x.productQauntity}}</td>
                        <td>{{x.productDiscount}}</td>
                        <td>{{x.date}}</td>
                        
                        <td><img src="resources/images/product{{x.productId}}.jpg" width="100" height="100"></td>
                        <td>{{x.enabled}}</td>
                        <td>Rs. {{x.productPrice * x.productQauntity}}</td>
                        <td>
      <a href ="editProduct-{{x.productId}}"><span class="glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></span></a>
      <a href ="deleteProduct-{{x.productId}}"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" title="Delete"></span></a>
      <a href="viewfullproduct-{{x.productId}}"><span class="glyphicon glyphicon-eye-open" data-toogle="tooltip" title="View Product"></span></a>
      <a href="productspec-{{x.productId}}"><span class="fa fa-plus-circle" data-toogle="tooltip" title="Add Product Specification"></span></a>
       <a href="editProdSpec-{{x.productId}}"><span class="glyphicon glyphicon-edit" data-toogle="tooltip" title="Edit Product Specification"></span></a>
      
       <a href="enableproduct-{{x.productId}}"><span class="fa fa-exchange" data-toogle="tooltip" title="Toggle Product"></span></a>
       
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
                     <td>Grand Total:</td>
                     <td>  Rs {{resultValue | totalSumPriceQty:'productQauntity':'productPrice'}}</td>
                     <td></td>
                     </tr>
				   </tbody>
                   </table>
                   
</div>
</div>
</div>
</div>
</div>
<script>
var app = angular.module('myApp', []).filter('totalSumPriceQty', function () {
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
    $scope.abc = ${stringProduct};
   
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