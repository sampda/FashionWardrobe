<%@include file="header.jsp" %>
<div class="container">
    <div class="row">
    <div class="col-xs-12 col-sm-10 col-md-6 col-sm-offset-1 col-md-offset-3" style="margin-bottom:20px;">
        <button type="button" class="btn btn-primary pull-right" onClick="printDiv()">PRINT</button>
    </div>    
        <br/>
        <div class="well col-xs-12 col-sm-10 col-md-6 col-sm-offset-1 col-md-offset-3" id="DivIdToPrint">
             <div class="row">
              
                <div class="text-center">
                    <h1 style="color:#01579B;">Receipt</h1>
                </div>
               
                <table class="table" style="background-color:white;margin-top:25px;">
                    <thead>
                        <tr >
                            <th style="background-color:white;color:#01579B;">Product</th>
                            <th style="background-color:white;color:#01579B;">#</th>
                            <th class="text-center" style="background-color:white;color:#01579B;">Price</th>
                            <th class="text-center" style="background-color:white;color:#01579B;">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <tr ng-repeat="x in abc">
                            <td class="col-md-3"><em>{{x.productName}}</em></td>
                            <td class="col-md-1" style="text-align: center">{{x.productQuantity}}</td>
                            <td class="col-md-1 text-center"><i class="fa fa-inr"></i> {{x.productPrice}}</td>
                            <td class="col-md-1 text-center"><i class="fa fa-inr"></i> {{x.productPrice * x.productQuantity}}</td>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right"><strong>Grand Total: </strong></td>
                            <td class="text-left text-danger"><strong><i class="fa fa-inr"></i>{{getTotal()}} </strong></td>
                        </tr>
                      
                    </tbody>
                </table>
                <a href="home"><button type="button" class="btn btn-primary btn-lg btn-block">
                    Continue Shopping  <span class="glyphicon glyphicon-chevron-right"></span>
                </button></a>
            </div>
        </div>
    </div>
</div>
<script>
var app = angular.module('myApp', []);  
 app.controller('myCtrl', function($scope,$filter) 
		 {
    $scope.abc = ${orderPlaced};
  
   
      $scope.getTotal = function(){
    	    var total = 0;
    	    for(var i = 0; i < $scope.abc.length; i++){
    	        var x = $scope.abc[i];
    	        total += (x.productPrice * x.productQuantity);
    	    }
    	    return total;
    	}
  
   
});

 function printDiv()
 {
 var divToPrint=document.getElementById('DivIdToPrint');
 var newWin=window.open('','Print-Window','width=400,height=400,top=100,left=100');
 newWin.document.open();
     newWin.document.write('<html><head><style>#in {display:none}</style><body   onload="window.print()">'+divToPrint.innerHTML+'</body></html>');
 newWin.document.close();
 setTimeout(function(){newWin.close();},10);

 };

</script>
<%@include file="footer.jsp" %>