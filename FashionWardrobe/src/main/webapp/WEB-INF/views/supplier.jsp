<%@include file="header.jsp" %>
<div class="container">
<div class="form-signin" style="max-width:700px;">
  ${sessionScope.Error} <c:set var="Error" value="" scope="session"/>
<h4>Add Subcategory</h4>  
 <hr>

<form:form method="POST" action="add/supplier" modelAttribute="supplier">
<form:input path="supplierId" hidden="true"/>
                   <div class="form-group">
                    <label for="companyName">Company Name<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="companyName" placeholder="Enter Company Name" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="companyName"/>
                  </div>
                  <div class="form-group">
                    <label for="supplierDescription">Supplier Description<span style="color:red;"> *</span></label>
                      <form:input type="text" autocomplete="off" class="form-control" path="supplierDescription" placeholder="Enter Supplier Description" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="supplierDescription"/>
                  </div>
                  <div class="form-group">
                    <label for="city">City<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="city" placeholder="Enter City" maxlength="255"/>
                      <form:errors cssStyle="color:red;" path="city"/>
                  </div>
                  <div class="form-group">
                    <label for="state">State<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="state" placeholder="Enter State" maxlength="255"/>
                     <form:errors cssStyle="color:red;" path="state"/>
                  </div>
                  <div class="form-group">
                    <label for="pincode">Pincode<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="pincode" placeholder="Enter Pincode"/>
                    <form:errors cssStyle="color:red;" path="pincode"/>
                  </div>
                  <div class="form-group">
                    <label for="district">District<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="district" placeholder="Enter District" maxlength="255"/>
                     <form:errors cssStyle="color:red;" path="district"/>
                  </div>
                  <div class="form-group">
                    <label for="landmark">Landmark<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="landmark" placeholder="Enter Landmark" maxlength="255"/>
                    <form:errors cssStyle="color:red;" path="landmark"/>
                  </div>
                  <div class="form-group">
                    <label for="address">Address<span style="color:red;"> *</span></label>
                      <form:input type="text" class="form-control" path="address" placeholder="Enter Address" maxlength="255"/>
                     <form:errors cssStyle="color:red;" path="address"/>
                  </div>
                  <div class="form-group">
                    <label for="companyUrl">Company Url</label>
                      <form:input type="text" class="form-control" path="companyUrl" placeholder="Enter Company Url" maxlength="255"/>
                    
                  </div>
<button type="submit" class="btn btn-primary pull-right">Submit</button>
</form:form>
</div>
<hr>
</div>

<div class="container"> 
 <h4>SUPPLIER LIST</h4> 
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
                       <th ng-click="sort('supplierId')">#
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
<th></th>
<th></th>
                    </thead>
                    <tbody>
                    <tr dir-paginate="x in abc | filter: test | orderBy:sortKey:reverse| itemsPerPage: maxsize" pagination-id="Product">
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
      <a class="btn btn-primary btn-circle" href="editSupplier-{{x.supplierId}}" data-toggle="tooltip" data-placement="bottom" title="Edit">
      		 <i class="glyphicon glyphicon-edit"></i></a></td>
      	<td><a class="btn btn-primary btn-circle" href="deleteSupplier-{{x.supplierId}}" data-toggle="tooltip" data-placement="bottom" title="Delete">
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
    $scope.abc = ${supplierjson};
    $scope.sort = function(keyname) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
      }
    
 });
 $(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip({
	    	placement : 'top'
	    	}); 
	});
</script>


<%@include file="footer.jsp" %>