<%@include file="header.jsp"%>

<div class="container" id="product-section" style=" margin-top:100px;">
  <div class="row">
   <div class="col-md-6">
 <img src="resources/images/product{{abc.productId}}.jpg">
   </div>
   <div class="col-md-6">
    <legend>{{abc.productName}}</legend>
    <p>{{abc.productBrand}}</p>
   </div>
  </div><!-- end row -->
 
 <hr>

			<h3>Default Tab</h3>

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
						<li>
							<a href="#tab_default_3" data-toggle="tab">
							Rate And Review </a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_default_1">
							<p>
								Product Description
							</p>
							<p>
								{{abc.productDesc}}
							</p>
							
						</div>
						<div class="tab-pane" id="tab_default_2">
							<p>
								Supplier Information
							</p>
							<p>
								{{abc.companyName}}
							</p>
							
						</div>
						<div class="tab-pane" id="tab_default_3">
							<p>
								Rate And Review
							</p>
							<p>
								
							</p>
							
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
 });
</script>


<%@include file="footer.jsp" %>
