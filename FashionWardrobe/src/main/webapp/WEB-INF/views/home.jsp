<%@include file="header.jsp" %>


<div class="container" style="width:100%">
    <div class="row">
        <div class="col-md-12">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="resources/images/carouselimg5.jpg" style="width:100%;max-height:500px;">
                    </div>
                    <div class="item">
                        <img src="resources/images/carouselimg6.jpg" style="width:100%;max-height:500px;">
                        
                    </div>
                    <div class="item">
                        <img src="resources/images/carouselimg7.jpg" style="width:100%;max-height:500px;">
                        
                    </div>
                    <div class="item">
                        <img src="resources/images/carouselimg8.jpg" style="width:100%;max-height:500px;">
                        
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                        href="#carousel-example-generic" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                        </span></a>
            </div>
            
        </div>
    </div>
</div>
<div id="push">
</div>

<hr>
<div class="container">
<h4>TRENDING PRODUCTS</h4>
	<div class="row">
    	<!-- BEGIN PRODUCTS -->
  		<div ng-repeat="x in abc" class="col-md-3 col-sm-6">
    		<span class="thumbnail">
      			<a href="viewfullproduct-{{x.productId}}"><img src="resources/images/product{{x.productId}}.jpg" style="width:300px;height:300px;"></a>
      			<hr>
      			<p>{{x.productName}}</p>
      		    <p class="price"><i class="fa fa-inr"></i>{{x.productPrice}}</p>	
      		 <a class="btn icon-btn btn-primary" href="buyNow-{{x.productId}}?userId=1" data-toggle="tooltip" data-placement="bottom" title="Buy Now">
      		 <span class="glyphicon btn-glyphicon glyphicon-credit-card img-circle text-primary"></span></a>
      	     <a class="btn icon-btn btn-primary" href="buyNow-{{x.productId}}?userId=1" data-toggle="tooltip" data-placement="bottom" title="Add To WishList">
      	     <span class="glyphicon btn-glyphicon glyphicon-heart img-circle text-primary"></span></a>
      	     <a class="btn icon-btn btn-primary" href="buyNow-{{x.productId}}?userId=1" data-toggle="tooltip" data-placement="bottom" title="Add To Cart">
      	     <span class="glyphicon btn-glyphicon glyphicon-shopping-cart img-circle text-primary"></span></a> 
    		</span>
  		</div>
  		
  		
  		<!-- END PRODUCTS -->
	</div>
</div>
<hr>
<div class="container">
<h4>FEATURED PRODUCTS</h4>
	<div class="row">
    	<!-- BEGIN PRODUCTS -->
  		<div class="col-md-3 col-sm-6">
    		<span class="thumbnail">
      			<img src="http://placehold.it/500x400" alt="...">
      			<h4>Product Title</h4>
      			<div class="ratings">
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                </div>
      			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
      			<hr class="line">
      			<div class="row">
      				<div class="col-md-6 col-sm-6">
      					<p class="price">$29,90</p>
      				</div>
      				<div class="col-md-6 col-sm-6">
      					<button class="btn btn-success right" > BUY ITEM</button>
      				</div>
      				
      			</div>
    		</span>
  		</div>
  		
  		<!-- END PRODUCTS -->
	</div>
</div>

<div class="container">
    			<div class="row pricing">

					<div class="col-md-4">
						<div class="well">
							<img src="http://placehold.it/500x400" style="height:200px;width:300px;">
							<hr>
							<p>4 GB Datatransfer</p>
							<hr>
							<p>4 GB Storage</p>
							<hr>
							<p><b>€ 5,99 /PM</b></p>
							<hr>
							<a href="#" class="btn btn-warning btn-block">Shop</a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="well">
							<img src="http://placehold.it/500x400" style="height:200px;width:300px;">
							<hr>
							<p>4 GB Datatransfer</p>
							<hr>
							<p>4 GB Storage</p>
							<hr>
							<p><b>€ 5,99 /PM</b></p>
							<hr>
							<a href="#" class="btn btn-danger btn-block">Shop</a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="well">
							<img src="http://placehold.it/500x400" style="height:200px;width:300px;">
							<hr>
							<p>4 GB Datatransfer</p>
							<hr>
							<p>4 GB Storage</p>
							<hr>
							<p><b>€ 5,99 /PM</b></p>
							<hr>
							<a href="#" class="btn btn-default btn-block">Shop</a>
						</div>
					</div>
					
			</div>		
</div>
<script>
$(document).ready( function() {
    $('#carousel-example-generic').carousel({
		interval:   4000
	});

});
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) 
		 {
   $scope.abc = ${stringFullProductEnabled};
		 });
		 
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});

</script>
<%@include file="footer.jsp" %>