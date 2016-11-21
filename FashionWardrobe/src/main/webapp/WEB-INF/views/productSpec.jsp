<%@include file="header.jsp" %>

<div class="container">

    <form:form method="POST" action="addprodspec-${productId}" modelAttribute="productSpecification">
                 <form:input path="productId" hidden="true"/>
                  <div class="form-group">
                    <label for="productBrand">Product Brand</label>
                      <form:input type="text" class="form-control" path="productBrand" placeholder="Enter Product Brand" maxlength="255"/>
                  </div>
                  <div class="form-group">
                    <label for="productColor">Product Color</label>
                      <form:input type="text" class="form-control" path="productColor" placeholder="Enter Product Color" maxlength="255"/>
                  </div>
                   <div class="form-group">
                      <label for="productFabric">Product Fabric</label>
                          <form:input type="text" class="form-control" path="productFabric" placeholder="Enter Product Fabric" maxlength="255"/>
                   </div>
                     <div class="form-group">
                      <label for="productType">Product Type</label>
                          <form:input type="text" class="form-control" path="productType" placeholder="Enter Product Type" maxlength="255"/>
                   </div>
                   <div class="form-group">
                      <label for="productSize">Product Size</label>
                          <form:input type="text" class="form-control" path="productSize" placeholder="Enter Product Size"/>
                   </div>
                   <div class="form-group">
                      <label for="productShippingCost">Product Shipping Cost</label>
                          <form:input type="text" class="form-control" path="productShippingCost" placeholder="Enter Product shipping cost"/>
                   </div>
                   <div class="form-group">
                      <label for="productDesign">Product Design</label>
                          <form:input type="text" class="form-control" path="productDesign" placeholder="Enter Product Fabric" maxlength="255"/>
                   </div>
                   <div class="form-group">
                      <label for="productWashType">Product WashType</label>
                          <form:input type="text" class="form-control" path="productWashType" placeholder="Enter Product Fabric" maxlength="255"/>
                   </div>
                   <div class="form-group">
                      <label for="productCollar">Product Collar</label>
                          <form:input type="text" class="form-control" path="productCollar" placeholder="Enter Product Fabric" maxlength="255"/>
                   </div>

                  
                  <button type="submit" class="btn btn-primary">Submit</button>
      </form:form>
      </div>

<%@include file="footer.jsp" %>
