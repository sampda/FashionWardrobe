<%@include file="header.jsp" %>
<div class="container">
<hr>
<div ng-app="myApp" ng-controller="myCtrl">
<div style="overflow-x:auto;">
    <div class="container">
        <div class="row">
	       <div class="col-md-12">
               <h4>User List</h4>
<div>
<label>Search</label>
<input type="text" ng-model="test"/>
</div>

 <div class="table-responsive">
                    <table id="mytable" class="table table-bordred table-striped" bgcolor="#00FF00">
                    <thead>
<tr>
<th ng-click="sort('userId')">UserId
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
<tr ng-repeat="x in abc | filter: test | orderBy:sortKey:reverse">
      <td>{{x.userId}}</td>
      <td>{{x.username}}</td>
      <td>{{x.enabled}}</td>
      <td><a href ="enableuser-{{x.userId}}" class="btn btn-info">Enable/Disable</a></td>
</tr>
</tbody>
</table>
</div>
</div>
<script>
var app = angular.module('myApp', []);
 app.controller('myCtrl', function($scope) {
    $scope.abc = ${stringUser};
    $scope.sort = function(keyname) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
      }
 });
 
 
</script> 
</div>
</div>
</div>
</div>
</div>

<%@include file="footer.jsp" %>