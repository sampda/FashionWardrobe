<%@include file="header.jsp" %>

<!-- <div class="container-fluid" style="background-color: #01579B; height:100px;"> -->
<!-- <center>     -->
<!--   <a href="categories" class="btn btn-info buttonaddon" role="button">Category</a> -->
<!--   <a href="subCategory" class="btn btn-info buttonaddon"  role="button">Subcategory</a> -->
<!--   <a href="supplier" class="btn btn-info buttonaddon" role="button">Supplier</a> -->
<!--   <a href="product" class="btn btn-info buttonaddon" role="button">Product</a> -->
<!--   <a href="usermanage" class="btn btn-info buttonaddon" role="button">User</a>  </center> -->
<!--     </div> -->
<div class="container">
    <div class="row">
        <div class="col-md-6">
       
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-bookmark"></span> Quick Shortcuts</h3>
                </div>
                <div class="panel-body1">
                    <div class="row">
                        <div class="col-xs-6 col-md-6">
                          <a href="categories" class="btn btn-info btn-lg" role="button"><span class="glyphicon glyphicon-list-alt"></span> <br/>Category</a>
                          <a href="subCategory" class="btn btn-warning btn-lg" role="button"><span class="glyphicon glyphicon-bookmark"></span> <br/>Subcategory</a>
                          <a href="supplier" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-signal"></span> <br/>Supplier</a>
                        </div>
                        <div class="col-xs-6 col-md-6">
                        <a href="product" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Product</a>
                          <a href="usermanage" class="btn btn-success btn-lg" role="button"><span class="glyphicon glyphicon-user"></span> <br/>Users</a>
                          <a href="home" class="btn btn-success btn-lg" role="button"><span class="glyphicon glyphicon-globe"></span><br/> Website</a>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
    </div>
</div>


<%@include file="footer.jsp" %>