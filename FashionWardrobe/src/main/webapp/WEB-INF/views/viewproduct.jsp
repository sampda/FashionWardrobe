<%@include file="header.jsp"%>
<div class="container-fluid">
    <nav class="navbar navbar-default navbar-xs" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  
  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li><a href="home">Home>></a></li>
      <li><a href="productdisplay?search={{abc.categoryName}}">{{abc.categoryName}}>></a></li>
      <li><a href="productdisplay?search={{abc.subCategoryname}}">{{abc.subCategoryname}}>></a></li>
      <li><a href="productdisplay?search={{abc.productName}}">{{abc.productName}}</a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
</div>
<div class="container" id="product-section">
  <div class="row">
   <div class="col-md-6 text-center">
   <img src="resources/images/product{{abc.productId}}.jpg" style="height:550px;width:400px;"/>
   
<!--  <img class="pull-right" src="resources/images/product{{abc.productId}}.jpg" style="height:500px;width:400px;"> -->
   </div>
   <div class="col-md-6">
   <h3>{{abc.productBrand}}</h3>
    <p>{{abc.productName}}</p>
    
    <div ng-if="abc.productDiscount != 0">
      <legend><i class="fa fa-inr"></i> <del>{{abc.productPrice}}</del> <span style="color:brown;">{{abc.productDiscount}}</span> <span style="color:red;">({{Math.round((((abc.productPrice - abc.productDiscount)/ abc.productPrice) * 100))}}) % off!</span></legend>
   </div>
     <div ng-if="abc.productDiscount == 0">       
    <legend><i class="fa fa-inr"></i> {{abc.productPrice}}</legend>
    </div>
   <p>Select Size</p>
   
		    <button class="btn btn-default orange-circle-button" href="">S<span class="orange-circle-greater-than"></span></button>
		     <button class="btn btn-default orange-circle-button" href="">L<span class="orange-circle-greater-than"></span></button>
		      <button class="btn btn-default orange-circle-button" href="">XL<span class="orange-circle-greater-than"></span></button>
		       <button class="btn btn-default orange-circle-button" href="">XXL<span class="orange-circle-greater-than"></span></button>
	<br><br>
	                    <div ng-if="abc.productQauntity != 0">
	
   <a id="quantityUrl" onclick="redirect()" dummyhref="addCart-{{abc.productId}}-" class="btn btn-lg btn-primary"><i class="fa fa-shopping-cart"></i> Add To Cart</a>
   <a href="buyNow-{{abc.productId}}?userId=1" class="btn btn-lg btn-primary"><i class="fa fa-credit-card"></i> Buy Now</a>
   <div class="input-group">
   <br>
         <p>Quantity To Be Added in Cart</p>
         
        <div class="form-inline">
         <input type="number" id="quantity" class="form-control input-number" value="1" min="1" max="3" maxlength="1">
          <span style="color:red;">${sessionScope.Error} <c:set var="Error" value="" scope="session"/></span>
        </div>
      </div>
 </div>
   
    <div ng-if="abc.productQauntity == 0">
      <p><strong> Out Of Stock </strong></p>
    </div>
    
    <br>
   <p>Services:</p>
  <p><i class="fa fa-circle" aria-hidden="true"></i> Cash On Delivery available</p>
  <p><i class="fa fa-circle" aria-hidden="true"></i> 30 Days Exchange Policy</p>

   </div>
  </div><!-- end row -->

 <hr>

			

			<div class="tabbable-panel">
				<div class="tabbable-line">
					<ul class="nav nav-tabs ">
						<li class="active">
							<a href="#tab_default_1" data-toggle="tab">
							Product Description </a>
						</li>
						<li>
							<a href="#tab_default_2" data-toggle="tab">
							Supplier Information </a>
						</li>
						
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_default_1">
							<pre class="color1">
{{abc.productDesc}}
Brand: {{abc.productBrand}}
Color: {{abc.productColor}}
Fabric: {{abc.productFabric}}
Type: {{abc.productType}}
Design: {{abc.productDesign}}    
Collar: {{abc.productCollar}}   
							</pre>
							
						</div>
						<div class="tab-pane" id="tab_default_2">
							<pre class="color1">
{{abc.companyName}}    
							</pre>
					
						</div>
					</div>
				</div>
			</div>

            </div>
         
<script>
var app = angular.module('myApp', []);
 app.controller('myCtrl', function($scope) 
		 {
    $scope.abc = ${productFullView};
    $scope.Math = window.Math;

 });
 
 function redirect()
 {
	if(document.getElementById('quantity').value < 1 || document.getElementById('quantity').value > 3)
		{
		window.location.href = document.getElementById('quantityUrl').getAttribute("dummyhref")+"1";
		}
	else
		{
		window.location.href = document.getElementById('quantityUrl').getAttribute("dummyhref")+""+document.getElementById('quantity').value.substring(0, 1);
		}
	
 };

//  function redirect()
//  {
// 	window.location.href = document.getElementById('quantityUrl').getAttribute("dummyhref")+document.getElementById('quantity');
//  };
 
 
//  var inputQuantity = [];
//  $(function() {
//    $(".quantity").each(function(i) {
//      inputQuantity[i]=this.defaultValue;
//       $(this).data("idx",i); // save this field's index to access later
//    });
//    $(".quantity").on("keyup", function (e) {
//      var $field = $(this),
//          val=this.value,
//          $thisIndex=parseInt($field.data("idx"),10); // retrieve the index
// //     window.console && console.log($field.is(":invalid"));
//        //  $field.is(":invalid") is for Safari, it must be the last to not error in IE8
//      if (this.validity && this.validity.badInput || isNaN(val) || $field.is(":invalid") ) {
//          this.value = inputQuantity[$thisIndex];
//          return;
//      } 
//      if (val.length > Number($field.attr("maxlength"))) {
//        val=val.slice(0, 5);
//        $field.val(val);
//      }
//      inputQuantity[$thisIndex]=val;
//    });      
//  });

</script>


<%@include file="footer.jsp" %>
