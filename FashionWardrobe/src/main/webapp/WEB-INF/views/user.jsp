<%@include file="header.jsp" %>
<div class="container"> 
 <h4>USER LIST</h4> 
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
<tr>
<th ng-click="sort('userId')">#
<span class="glyphicon sort-icon" ng-show="sortKey=='userId'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('username')">username
<span class="glyphicon sort-icon" ng-show="sortKey=='username'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('enabled')">enabled
<span class="glyphicon sort-icon" ng-show="sortKey=='enabled'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th>Enable|Disable</th>
</tr>
</thead>
<tbody>
<tr dir-paginate="x in abc | filter: test | orderBy:sortKey:reverse| itemsPerPage: maxsize" pagination-id="Product">
      <td>{{x.userId}}</td>
      <td>{{x.username}}</td>
      <td>{{x.enabled}}</td>
      <td>
      <a class="btn btn-primary btn-circle" href="enableuser-{{x.userId}}" data-toggle="tooltip" title="Enable/Disable">
      		 <i class="fa fa-exchange"></i></a>
      
     
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
 app.controller('myCtrl', function($scope) {
    $scope.abc = ${stringUser};
    $scope.sort = function(keyname) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
      }
 });
 
 $(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip({
	    	placement : 'bottom'
	    	}); 
	});

</script> 


<%@include file="footer.jsp" %>