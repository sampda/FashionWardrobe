<%@include file="header.jsp" %>
<div class="container">
<form:form modelAttribute="userRole">
<div class="form-signin" style="max-width:500px;margin-top:200px;">
<form:radiobutton path="roleId" value="1"  onclick="showHide()" checked="true"/>Buyer
<form:radiobutton path="roleId" value="3"  onclick="showHide()"/>Seller
<div class="form-group"></div>
<div class="form-group">
<button name ="_eventId_cancel" type="submit" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i>
 Cancel</button>
<button name ="_eventId_submitshipping"  id="shipping" type="submit" class="btn btn-info pull-right"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
 Register For Buyer</button>
<button name ="_eventId_submitsupplier"  id="supplier" type="submit" class="btn btn-info pull-right"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
 Register For Supplier</button>
</div>
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