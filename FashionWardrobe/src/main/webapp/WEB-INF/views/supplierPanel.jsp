<%@include file="header.jsp" %>
<div class="container">
<a href="product" class="btn btn-primary btn-primary"><span class="glyphicon glyphicon-plus-sign"></span> Add Product</a>

   <div class="col-md-7 ">
      <div class="panel panel-default">
        <div class="panel-heading">  <h4 >User Profile</h4></div>
            <div class="panel-body2">
                 <div class="box box-info">
                      <div class="box-body">
         				  <div class="col-sm-12">
                                  <h4 style="color:#00b1b1;">${pageContext.request.userPrincipal.name}</h4>
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
                        <a href="registrationform" data-original-title="Edit" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="home" data-original-title="Confirm" data-toggle="tooltip" type="button" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-ok"></i></a>
                      
                    </div>
    </div>
</div>  
 




   <div class="col-md-7 ">
      <div class="panel panel-default">
        <div class="panel-heading">  <h4 >Supplier Details</h4></div>
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
                                <a href="confirmShippingDetails" data-original-title="Edit" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="home" data-original-title="Confirm" data-toggle="tooltip" type="button" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-ok"></i></a>
                      
                    </div>
    </div>
</div>  
</div>

    <script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function($scope) 
   		 {
       $scope.abc = ${stringuserDetails};
       $scope.getSupplier = ${stringsupplierDetails};
      
   		 });
    
    $(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip({
	    	placement : 'top'
	    	}); 
 });
              </script> 
       


<%@include file="footer.jsp" %>