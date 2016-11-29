<%@include file="header.jsp" %>

<div class="container">
<h2 style="color:red;">${sessionScope.Error} 
 <c:set var="Error" value="" scope="session"/></h2> 
 <hr>

<form:form method="POST" action="categories" modelAttribute="category">
<form:input path="categoryId" hidden="true"/>
                  <div class="form-group">
                    <label for="categoryName">Category Name</label>
                      <form:input type="text" class="form-control" path="categoryName" placeholder="Enter Category Name" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="categoryName"/>
                  </div>
                  <div class="form-group">
                    <label for="categoryDesc">Category Description</label>
                      <form:input type="text" class="form-control" path="categoryDesc" placeholder="Enter Category Description" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="categoryDesc"/>
                  </div>
                   
                  <button type="submit" class="btn btn-primary">Submit</button>
</form:form>

<hr>
</div>

   
 <div class="container"> 
 <h4>CATEGORY LIST</h4> 
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
                     <th ng-click="sort('categoryId')">#
<span class="glyphicon sort-icon" ng-show="sortKey=='categoryId'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('categoryName')">CategoryName
<span class="glyphicon sort-icon" ng-show="sortKey=='categoryName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('categoryDesc')">CategoryDesc
<span class="glyphicon sort-icon" ng-show="sortKey=='categoryDesc'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th>MANAGE</th>
                    </thead>
                    <tbody>
<tr dir-paginate="x in abc | filter: test | orderBy:sortKey:reverse | itemsPerPage: maxsize" pagination-id="Product">
                        
                       <td>{{x.categoryId}}</td>
      <td>{{x.categoryName}}</td>
      <td>{{x.categoryDesc}}</td>
      <td>
      
      <a class="btn btn-primary btn-circle" href="editCategory-{{x.categoryId}}" data-toggle="tooltip" data-placement="bottom" title="Edit">
      		 <i class="glyphicon glyphicon-edit"></i></a>
      	<a class="btn btn-primary btn-circle" href="delete-{{x.categoryId}}" data-toggle="tooltip" data-placement="bottom" title="Delete">
      		 <i class="glyphicon glyphicon-remove"></i></a>
      
      </td>
                     </tr>
                    
				   </tbody>
                   </table>
                   
     <dir-pagination-controls  class="pull-right" max-size="5" pagination-id="Product" direction-links="true" boundary-links="true">
                </dir-pagination-controls>
                
                </div>
</div>


<script>
var app = angular.module('myApp', ['angularUtils.directives.dirPagination']);
 app.controller('myCtrl', function($scope) 
		 {
    $scope.abc = ${categoriesjson};
		 
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