<%@include file="header.jsp" %>


<div class="container top" style="width:100%">
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
                        <a href="productdisplay?search=Kurtas%20&%20Kurtis"><img src="resources/images/carouselimg5.jpg" style="width:100%;max-height:500px;"></a>
                    </div>
                    <div class="item">
                        <a href="productdisplay?search=Polos%20&%20Tees"><img src="resources/images/carouselimg6.jpg" style="width:100%;max-height:500px;"></a>
                        
                    </div>
                    <div class="item">
                        <a href="productdisplay?search=Trousers%20&%20Jeans"><img src="resources/images/carouselimg7.jpg" style="width:100%;max-height:500px;"></a>
                        
                    </div>
                    <div class="item">
                       <a href="productdisplay?search=Sarees%20&%20Dress%20%20Material"><img src="resources/images/carouselimg9.jpg" style="width:100%;max-height:500px;"></a>
                        
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
     <h4>TRENDING NOW</h4>
    <div class='row'>

        <!--Boxes-->
        
        <div ng-repeat="x in abc | orderBy: 'productId':true" class="col-xs-12 col-sm-6 col-md-3">
            <div class="list-quotes" >
                
               
               
                <a href="viewfullproduct-{{x.productId}}">
                    <img src="resources/images/product{{x.productId}}.jpg" style="width:100%;height:360px;">
                    <h1>{{x.productName}} 
                    <div ng-if="x.productDiscount != 0 && x.productQauntity == 0">
                    <span class="label label-warning">Out Of Stock</span>
                    </div> 
                    <div ng-if="x.productQauntity == 0 && x.productDiscount == 0">
                    <span class="label label-warning">Out Of Stock</span>
                    </div>
                    <div ng-if="x.productQauntity != 0 && x.productDiscount != 0">
                    <span class="label label-danger">Sale!!!</span>
                    </div>
                    </h1>
                </a>
               
               
               
                
               
                    <div class="quotes">
                    <div ng-if="x.productQauntity != 0">
                    <a href="buyNow-{{x.productId}}?userId=1"><span class="glyphicon year glyphicon-credit-card" data-toggle="tooltip" data-placement="left" title="Buy Now"></span></a>
                    <a href="addCart-{{x.productId}}-1"><span class="glyphicon cat-name glyphicon-shopping-cart" data-toggle="tooltip" data-placement="right" title="Add To Cart"></span></a>
                    <div ng-if="x.productDiscount == 0">
      	          	   	<p><span class="pricing-list-v4-price-sign">  <i class="fa fa-inr"></i>{{x.productPrice}}</span>
      	          	
                       <a href="wishList-{{x.productId}}"><span class="glyphicon glyphicon-heart pull-right" data-toggle="tooltip" data-placement="left" style="z-index:99" title=" Add To Wishlist"></span></a>
                         </p>
      		      </div>
      		    <div ng-if="x.productDiscount != 0">
      		     	<p><span class="pricing-list-v4-price-sign"><i class="fa fa-inr"></i><del>{{x.productPrice}}</del> {{x.productDiscount}} ({{Math.round((((x.productPrice - x.productDiscount)/ x.productPrice) * 100))}}) % off!</span>
      		     	      	      
      		     	 <a href="wishList-{{x.productId}}"><span class="glyphicon glyphicon-heart pull-right" data-toggle="tooltip" data-placement="left" style="z-index:99" title=" Add To Wishlist"></span></a>
                         </p>
      		     	
                    
                    </div>
                    </div>
                    <div ng-if="x.productQauntity == 0">
                    <a href="buyNow-{{x.productId}}?userId=1"><span class="glyphicon year glyphicon-credit-card" data-toggle="tooltip" data-placement="left" title="Buy Now"></span></a>
                    <a href="addCart-{{x.productId}}"><span class="glyphicon cat-name glyphicon-shopping-cart" data-toggle="tooltip" data-placement="right" title="Add To Cart"></span></a>
                    
                    <div ng-if="x.productDiscount == 0">
      	          	   	<p>  <span class="pricing-list-v4-price-sign"><i class="fa fa-inr"></i>{{x.productPrice}}
      	          	   	OUT OF STOCK!!!</span>
                       <a href="wishList-{{x.productId}}"><span class="glyphicon glyphicon-heart pull-right" data-toggle="tooltip" data-placement="left" style="z-index:99" title=" Add To Wishlist"></span></a>
                         </p>
      		    </div>
      		    <div ng-if="x.productDiscount != 0">
      		     	<p><i class="fa fa-inr"></i><strike>{{x.productPrice}}</strike> {{x.productDiscount}} (-{{Math.round((((x.productPrice - x.productDiscount)/ x.productPrice) * 100))}}) % off!
      		     	      	          	   	OUT OF STOCK!!!
      		     	 <a href="wishList-{{x.productId}}"><span class="glyphicon glyphicon-heart pull-right" data-toggle="tooltip" data-placement="left" style="z-index:99" title=" Add To Wishlist"></span></a>
                         </p>
      		     	
      		    </div>
                   </div>     
                       
                </div>
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
   $scope.Math = window.Math;
		 });
		 
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});

(function(){

	  $('#itemslider').carousel({ interval: 3000 });
	}());

	(function(){
	  $('.carousel-showmanymoveone .item').each(function(){
	    var itemToClone = $(this);

	    for (var i=1;i<6;i++) {
	      itemToClone = itemToClone.next();


	      if (!itemToClone.length) {
	        itemToClone = $(this).siblings(':first');
	      }


	      itemToClone.children(':first-child').clone()
	        .addClass("cloneditem-"+(i))
	        .appendTo($(this));
	    }
	  });
	}());

</script>
<%@include file="footer.jsp" %>
