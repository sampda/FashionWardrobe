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
                         <form:select path="productSize"  multiple="true" class="form-control">
                           <form:option value="S" label="S"/>
                           <form:option value="L" label="L"/>
                           <form:option value="XL" label="XL"/>
                           <form:option value="XXL" label="XXL"/>
                      </form:select>
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
