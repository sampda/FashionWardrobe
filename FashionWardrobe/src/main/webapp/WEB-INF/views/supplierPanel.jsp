<%@include file="header.jsp" %>
<c:set var="page" value="supplierPanel" scope="session"/>
<div class="container">
   <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-default">
        <div class="panel-heading">  <h4 style="margin-top: 10px;;margin-bottom: 15px;">User Profile</h4></div>
            <div class="panel-body2">
                 <div class="box box-info">
                      <div class="box-body">
         				  <div class="col-sm-12">
                                  <h4 style="color:#01579B;">${pageContext.request.userPrincipal.name}</h4>
                          </div>
            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">
           <div class="col-sm-5 col-xs-6 tital">Username:</div><div class="col-sm-7 col-xs-6 ">{{abc.username}}</div>
     
     <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >Password:</div><div class="col-sm-7">{{abc.password}}</div>
     
     
    <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >First Name:</div><div class="col-sm-7">{{abc.firstname}}</div>
    
    <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >Last Name:</div><div class="col-sm-7">{{abc.lastname}}</div>
    
    <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >EmailId:</div><div class="col-sm-7">{{abc.emailId}}</div>
    
    <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >Contact No:</div><div class="col-sm-7">{{abc.contactno}}</div>
           
          </div><!-- /.box-body -->
           </div>  <!-- /.box -->
        </div> 
        <div class="panel-footer">
                        <a href="supplierEdit" data-original-title="Edit" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="home" data-original-title="Confirm" data-toggle="tooltip" type="button" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-ok"></i></a>
                      
                    </div>
    </div>
</div>  
 




   <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-default">
        <div class="panel-heading">  <h4 style="margin-top: 10px;;margin-bottom: 15px;">Supplier Details</h4></div>
            <div class="panel-body2">
                 <div class="box box-info">
                      <div class="box-body">
         				 
            <div class="clearfix"></div>
          	
           <div class="col-sm-5 col-xs-6 tital " >Company Name:</div><div class="col-sm-7 col-xs-6 ">{{getSupplier.companyName}}</div>
           
	<div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >Supplier Description:</div><div class="col-sm-7">{{getSupplier.supplierDescription}}</div>
     
     <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >Company Url:</div><div class="col-sm-7">{{getSupplier.companyUrl}}</div>
     
     <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >State:</div><div class="col-sm-7 col-xs-6 ">{{getSupplier.state}}</div>
     
	
     <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >City:</div><div class="col-sm-7">{{getSupplier.city}}</div>
     
     
    <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >District:</div><div class="col-sm-7">{{getSupplier.district}}</div>
    
    <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >Landmark:</div><div class="col-sm-7">{{getSupplier.landmark}}</div>
    
    <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >Address:</div><div class="col-sm-7">{{getSupplier.address}}</div>
    
    <div class="clearfix"></div>
<div class="bot-border"></div>
<div class="col-sm-5 col-xs-6 tital " >Pincode:</div><div class="col-sm-7">{{getSupplier.pincode}}</div>
           
          </div><!-- /.box-body -->
           </div>  <!-- /.box -->
        </div> 
        <div class="panel-footer">
                                <a href="editSupplier" data-original-title="Edit" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="home" data-original-title="Confirm" data-toggle="tooltip" type="button" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-ok"></i></a>
                      
                    </div>
    </div>
</div>

 <div class="row">
	       <div class="col-md-6 col-md-offset-3">
	       <c:set var="page" value="supplierPanel" scope="session"/>
 <form:form method="POST" action="add/product" modelAttribute="product" enctype="multipart/form-data">
                 <form:input path="productId" hidden="true"/>
                  <div class="form-group">
                    <label for="productName">Product Name</label>
                      <form:input type="text" class="form-control" path="productName" placeholder="Enter Product Name" maxlength="255"/>
                  </div>
                  <div class="form-group">
                    <label for="productDesc">Product Description</label>
                      <form:input type="text" autocomplete="off" class="form-control" path="productDesc" placeholder="Enter Product Description" maxlength="255"/>
                  </div>
                  <div class="form-group">
                    <label for="productPrice">Product Price</label>
                      <form:input type="text" class="form-control" path="productPrice" placeholder="Enter Product Price"/>
                  </div>
                   <div class="form-group">
                    <label for="productQuantity">Product Quantity</label>
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
                    <form:select path="supplier.companyName"  class="form-control" itemLabel= "companyName">
                    <form:option value="{{getSupplier.companyName}}" label="{{getSupplier.companyName}}"/>
                      </form:select>
                  </div>
         
                  <div class="form-group">
                    <label for="image">Upload Image</label>
                      <form:input class="form-control" path="productImage" type="file"/>
                  </div>
                  <button type="submit" class="btn btn-primary">Submit</button>
      </form:form>
      </div>
      </div>
 
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
                    
                     <tr dir-paginate="x in resultValue=(getProduct | filter: test) | orderBy:sortKey:reverse | itemsPerPage: maxsize" pagination-id="Product">
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
      
      <a href="viewfullproduct-{{x.productId}}"><span class="glyphicon glyphicon-eye-open" data-toogle="tooltip" title="View Product"></span></a>
      <a href="productspec-{{x.productId}}"><span class="fa fa-plus-circle" data-toogle="tooltip" title="Add Product Specification"></span></a>
       <a href="editProdSpec-{{x.productId}}"><span class="glyphicon glyphicon-edit" data-toogle="tooltip" title="Edit Product Specification"></span></a>
      
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
                     <td> Grand Total: </td>
                     <td> Rs {{resultValue | totalSumPriceQty:'productQauntity':'productPrice'}}</td>
                     </tr>
				   </tbody>
                   </table>
                   
</div>

 <dir-pagination-controls  class="pull-right" max-size="5" pagination-id="Product" direction-links="true" boundary-links="true">
                </dir-pagination-controls>
                   
</div>


 
<script>

var app = angular.module('myApp', ['angularUtils.directives.dirPagination']).filter('totalSumPriceQty', function () 
		{
    return function (data, key1, key2) 
    {
       
        if (typeof (data) === 'undefined' && typeof (key1) === 'undefined' && typeof (key2) === 'undefined') 
        {
            return 0;
        }
        var sum = 0;
        try
        {
           for (var i = 0; i < data.length; i++) 
           {
            sum = sum + (parseInt(data[i][key1]) * parseInt(data[i][key2]));
           }
        }
        
        catch(e)
        {
        	return 0;
        }
        return sum;
    }
});    
 app.controller('myCtrl', function($scope,$filter) 
		 {
	 $scope.abc = ${stringuserDetails};
	   $scope.getSupplier = ${stringsupplierDetails};
	   $scope.getProduct = ${stringproductDetails};
	   
   
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