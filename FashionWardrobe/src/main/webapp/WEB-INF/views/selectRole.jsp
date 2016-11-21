<%@include file="header.jsp" %>
<div class="container">
<form:form modelAttribute="userRole">
<form:radiobutton path="roleId" value="1"  onclick="showHide()" checked="true"/>Buyer
<form:radiobutton path="roleId" value="3"  onclick="showHide()"/>Seller
<div class="form-group">
<button name ="_eventId_cancel" type="submit" class="btn btn-danger">Cancel</button>
<button name ="_eventId_submitshipping"  id="shipping" type="submit" class="btn btn-info">Register For Buyer</button>
<button name ="_eventId_submitsupplier"  id="supplier" type="submit" class="btn btn-info">Register For Supplier</button>
</div>
</form:form>
</div>

<script type="text/javascript">
$("#supplier").hide();
showHide();

function showHide()
{
    $('input[type="radio"]').click(function(){
        if($(this).attr("value")=="1"){
            $("#shipping").show();
            $("#supplier").hide();
        }
        else
        	{
        	$("#supplier").show();
            $("#shipping").hide();
        	}
       
    });
}


</script>
<%@include file="footer.jsp" %>