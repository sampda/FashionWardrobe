<%@include file="header.jsp" %>
<div class="container">
<h2>${sessionScope.Error} 
 <c:set var="Error" value="" scope="session"/></h2> 
 <hr>
<form:form method="POST" action="addsubCategory" modelAttribute="subcategory">
<form:input path="subCategoryId" hidden="true"/>
                  <div class="form-group">
                    <label for="subCategoryName">Subcategory Name</label>
                      <form:input type="text" class="form-control" path="subCategoryName" placeholder="Enter SubCategory Name" maxlength="255"/>
                      <form:errors path="subCategoryName"/>
                  </div>
                  <div class="form-group">
                    <label for="subCategoryDesc">Subcategory Description</label>
                      <form:input type="text" class="form-control" path="subCategoryDesc" placeholder="Enter SubCategory Description" maxlength="255"/>
                      <form:errors path="subCategoryDesc"/>
                  </div>
                   <div class="form-group">
                      <label for="CategoryName">Category Name</label>
                      <form:select path="category.categoryName"  class="form-control" items = "${listCategory}" itemValue="categoryName" itemLabel= "categoryName">
                      </form:select>
                  </div>
                  <button type="submit" class="btn btn-primary">Submit</button>
</form:form>

<hr>

<div>

<div style="overflow-x:auto;">
    <div class="container">
        <div class="row">
	       <div class="col-md-12">
               <h4>Subcategory List</h4>
                             <div>
<label>Search</label>
<input type="text" ng-model="test"/>
</div>
               <div class="table-responsive">
                    <table id="mytable" class="table table-bordred table-striped" bgcolor="#00FF00">
                    <thead>
                       <th ng-click="sort('subCategoryId')">SubCategoryId
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
                       <th>MANAGE</th>
                    </thead>
                    <tbody>
                    <tr ng-repeat="x in abc | filter: test | orderBy:sortKey:reverse">
                        <td>{{x.subCategoryId}}</td>
  					    <td>{{x.subCategoryName}}</td>
 					    <td>{{x.subCategoryDesc}}</td>
 					    <td>{{x.categoryId}}</td>
					    <td>
      <a href ="editSubCategory-{{x.subCategoryId}}">
      <span class="glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></span></a>
      <a href ="deleteSubCategory-{{x.subCategoryId}}">
      <span class="glyphicon glyphicon-remove" data-toggle="tooltip" title="Delete"></span></a>
                       </td>
                     </tr>
                    
				   </tbody>
                   </table>
                   
</div>
</div>
</div>
</div>
</div>

</div>
</div>
<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function($scope) 
   		 {
       $scope.abc = ${subCategoryjson};
    });
    $scope.sort = function(keyname) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
      }
    $(document).ready(function(){
   	    $('[data-toggle="tooltip"]').tooltip({
   	    	placement : 'top'
   	    	}); 
   	});
</script>
<%@include file="footer.jsp" %>