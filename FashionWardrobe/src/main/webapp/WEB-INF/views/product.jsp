<%@include file="header.jsp" %>
<div class="container">
<div class="form-signin" style="max-width:700px;">

  ${sessionScope.Error}
   <c:set var="Error" value="" scope="session"/>
  <c:set var="page" value="product" scope="session"/>

<h4>Add Product</h4>  
 <hr>

    <form:form method="POST" action="add/product" modelAttribute="product" enctype="multipart/form-data">
                 <form:input path="productId" hidden="true"/>
                  <div class="form-group">
                    <label for="productName">Product Name<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="productName" placeholder="Enter Product Name" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="productName"/>
                  </div>
                  <div class="form-group">
                    <label for="productDesc">Product Description<span style="color:red;"> *</span></label>
                      <form:input type="text" autocomplete="off" class="form-control" path="productDesc" placeholder="Enter Product Description" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="productDesc"/>
                  </div>
                  <div class="form-group">
                    <label for="productPrice">Product Price<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="productPrice" placeholder="Enter Product Price"/>
                      
                  </div>
                   <div class="form-group">
                    <label for="productQauntity">Product Quantity<span style="color:red;"> *</span></label>
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
                  <button type="submit" class="btn btn-primary pull-right">Submit</button>
                  
      </form:form>
      </div>
<hr>
</div>

<div class="container"> 
 <h4>PRODUCT LIST</h4> 
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
                      
                       <th>Product Image</th>
                        <th ng-click="sort('enabled')">Product Enable/Disable
<span class="glyphicon sort-icon" ng-show="sortKey=='enabled'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                      
                      
                       <th>Total Price</th>
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
                        
                        <td><img src="resources/images/product{{x.productId}}.jpg" width="100" height="100"></td>
                        <td>{{x.enabled}}</td>
                        <td>Rs. {{x.productPrice * x.productQauntity}}</td>
                        <td>
                        
                        <a class="btn btn-primary btn-circle" href="editProduct-{{x.productId}}" data-toggle="tooltip" data-placement="bottom" title="Edit">
      		 <i class="glyphicon glyphicon-edit"></i></a>
      		 
      	<a class="btn btn-primary btn-circle" href="deleteProduct-{{x.productId}}" data-toggle="tooltip"  title="Delete">
      		 <i class="glyphicon glyphicon-remove"></i></a>
      <a class="btn btn-primary btn-circle" href="viewfullproduct-{{x.productId}}" data-toggle="tooltip"  title="View">
      		 <i class="glyphicon glyphicon-eye-open"></i></a>
      <a class="btn btn-primary btn-circle" href="productspec-{{x.productId}}" data-toggle="tooltip" title="Add Specification">
      		 <i class="fa fa-plus-circle"></i></a>
      <a class="btn btn-primary btn-circle" href="editProdSpec-{{x.productId}}" data-toggle="tooltip"  title="Edit Specification">
      		 <i class="glyphicon glyphicon-edit"></i></a>
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
                     <td>Grand Total:</td>
                     <td>  Rs {{resultValue | totalSumPriceQty:'productQauntity':'productPrice'}}</td>
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