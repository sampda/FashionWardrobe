<%@include file="header.jsp" %>
<div class="container">
<h2>${sessionScope.Error} 
 <c:set var="Error" value="" scope="session"/></h2> 
 <hr>

<form:form method="POST" action="add/supplier" modelAttribute="supplier">
<form:input path="supplierId" hidden="true"/>
                   <div class="form-group">
                    <label for="companyName">Company Name</label>
                      <form:input type="text" class="form-control" path="companyName" placeholder="Enter Company Name" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="companyName"/>
                  </div>
                  <div class="form-group">
                    <label for="supplierDescription">Supplier Description</label>
                      <form:input type="text" class="form-control" path="supplierDescription" placeholder="Enter Supplier Description" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="supplierDescription"/>
                  </div>
                  <div class="form-group">
                    <label for="city">City</label>
                      <form:input type="text" class="form-control" path="city" placeholder="Enter City" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="city"/>
                  </div>
                  <div class="form-group">
                    <label for="state">State</label>
                      <form:input type="text" class="form-control" path="state" placeholder="Enter State" maxlength="255"/>
                     <form:errors cssStyle="color:red;" path="state"/>
                  </div>
                  <div class="form-group">
                    <label for="pincode">Pincode</label>
                      <form:input type="text" class="form-control" path="pincode" placeholder="Enter Pincode"/>
                    <form:errors cssStyle="color:red;" path="pincode"/>
                  </div>
                  <div class="form-group">
                    <label for="district">District</label>
                      <form:input type="text" class="form-control" path="district" placeholder="Enter District" maxlength="255"/>
                     <form:errors cssStyle="color:red;" path="district"/>
                  </div>
                  <div class="form-group">
                    <label for="landmark">Landmark</label>
                      <form:input type="text" class="form-control" path="landmark" placeholder="Enter Landmark" maxlength="255"/>
                    <form:errors cssStyle="color:red;" path="landmark"/>
                  </div>
                  <div class="form-group">
                    <label for="address">Address</label>
                      <form:input type="text" class="form-control" path="address" placeholder="Enter Address" maxlength="255"/>
                     <form:errors cssStyle="color:red;" path="address"/>
                  </div>
                  <div class="form-group">
                    <label for="companyUrl">Company Url</label>
                      <form:input type="text" class="form-control" path="companyUrl" placeholder="Enter Company Url" maxlength="255"/>
                    
                  </div>
<button type="submit" class="btn btn-primary">Submit</button>
</form:form>

<hr>

<div style="overflow-x:auto;">
    <div class="container">
        <div class="row">
	       <div class="col-md-12">
               <h4>Supplier List</h4>
               <div>
<label>Search</label>
<input type="text" ng-model="test"/>
</div>
               <div class="table-responsive">
                    <table id="mytable" class="table table-bordred table-striped" bgcolor="#00FF00">
                    <thead>
                       <th ng-click="sort('supplierId')">SupplierId
<span class="glyphicon sort-icon" ng-show="sortKey=='supplier_id'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('companyName')">Company Name
<span class="glyphicon sort-icon" ng-show="sortKey=='companyName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('city')">City
<span class="glyphicon sort-icon" ng-show="sortKey=='city'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('state')">State
<span class="glyphicon sort-icon" ng-show="sortKey=='state'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('pincode')">Pincode
<span class="glyphicon sort-icon" ng-show="sortKey=='pincode'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('district')">District
<span class="glyphicon sort-icon" ng-show="sortKey=='district'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('landmark')">Landmark
<span class="glyphicon sort-icon" ng-show="sortKey=='landmark'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('address')">Address
<span class="glyphicon sort-icon" ng-show="sortKey=='address'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th ng-click="sort('companyUrl')">Company Url
<span class="glyphicon sort-icon" ng-show="sortKey=='companyUrl'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
</th>
<th>MANAGE</th>
                    </thead>
                    <tbody>
                    <tr ng-repeat="x in abc | filter: test | orderBy:sortKey:reverse">
      <td>{{x.supplierId}}</td>
      <td>{{x.companyName}}</td>
      <td>{{x.city}}</td>
      <td>{{x.state}}</td>
      <td>{{x.pincode}}</td>
      <td>{{x.district}}</td>
      <td>{{x.landmark}}</td>
      <td>{{x.address}}</td>
      <td>{{x.companyUrl}}</td>
      
      <td>
      <a href ="editSupplier-{{x.supplierId}}"><span class="glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></span></a>
      <a href ="deleteSupplier-{{x.supplierId}}"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" title="Delete"></span></a>
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
<script>
var app = angular.module('myApp', []);
 app.controller('myCtrl', function($scope) 
		 {
    $scope.abc = ${supplierjson};
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