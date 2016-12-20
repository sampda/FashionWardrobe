<%@include file="header.jsp" %>

 <div class="container">
<div class="form-signin" style="max-width:700px;">
  ${sessionScope.Error} <c:set var="Error" value="" scope="session"/>
<h4>Add Subcategory</h4>  
 <hr>

 
<form:form method="POST" action="addsubCategory" modelAttribute="subcategory">

<form:input path="subCategoryId" hidden="true"/>
                  <div class="form-group">
                    <label for="subCategoryName">Subcategory Name<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="subCategoryName" placeholder="Enter SubCategory Name" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="subCategoryName"/>
                  </div>
                  <div class="form-group">
                    <label for="subCategoryDesc">Subcategory Description<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="subCategoryDesc" placeholder="Enter SubCategory Description" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="subCategoryDesc"/>
                  </div>
                   <div class="form-group">
                      <label for="CategoryName">Category Name<span style="color:red;"> *</span></label>
                      <form:select path="category.categoryName"  class="form-control" items = "${listCategory}" itemValue="categoryName" itemLabel= "categoryName">
                      </form:select>
                  </div>
                  <button type="submit" class="btn btn-primary pull-right">Submit</button>
                  
</form:form>
</div>
<hr>
</div>

 <div class="container"> 
 <h4>SUBCATEGORY LIST</h4> 
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
            <option>25</option>  
            
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
                       
                       <th ng-click="sort('subCategoryId')">#
<span class="glyphicon sort-icon" ng-show="sortKey=='subCategoryId'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>                       
                       </th>
                       <th ng-click="sort('subCategoryName')">SubCategoryName
<span class="glyphicon sort-icon" ng-show="sortKey=='subCategoryName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>           
                       <th ng-click="sort('subCategoryDesc')">SubCategoryDesc
<span class="glyphicon sort-icon" ng-show="sortKey=='subCategoryDesc'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>                      
                       </th>
                       <th ng-click="sort('categoryId')">CategoryId
<span class="glyphicon sort-icon" ng-show="sortKey=='categoryId'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>                       
                      </th>
                       <th></th>
                    </thead>
                    <tbody>
    <tr dir-paginate="x in abc | filter: test | orderBy:sortKey:reverse| itemsPerPage: maxsize" pagination-id="Product">
                        <td>{{x.subCategoryId}}</td>
  					    <td>{{x.subCategoryName}}</td>
 					    <td>{{x.subCategoryDesc}}</td>
 					    <td>{{x.categoryId}}</td>
					    <td>
					    <a class="btn btn-primary btn-circle" href="editSubCategory-{{x.subCategoryId}}" data-toggle="tooltip" data-placement="bottom" title="Edit">
      		 <i class="glyphicon glyphicon-edit"></i></a>
      	<a class="btn btn-primary btn-circle" href="deleteSubCategory-{{x.subCategoryId}}" data-toggle="tooltip" data-placement="bottom" title="Delete">
      		 <i class="glyphicon glyphicon-remove"></i></a>
      
                       </td>
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
       $scope.abc = ${subCategoryjson};
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