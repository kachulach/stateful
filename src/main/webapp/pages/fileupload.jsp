<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html lang="en">

<head>
    <jsp:include page="header.jsp"/>
</head>

<body
		<%
        	if(request.getAttribute("msg")!=null)
				out.println("onload=\"showModal()\"");
		%>
>

	<jsp:include page="navbar.jsp"/>

    <div style="margin-top:100px;" class="container">
        
    <div class="container">

			<form:form method="post" enctype="multipart/form-data"
				modelAttribute="uploadedFile" action="${pageContext.request.contextPath}/game/fileupload">
				<table>
					<tr>
						<td>Upload File:</td>
						<td><input type="file" name="file" /></td>
						<td style="color: red; font-style: italic;"><form:errors
								path="file" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Upload" /></td>
						<td></td>
					</tr>
				</table>
			</form:form>

		</div>
		

<jsp:include page="footer.jsp"/>       
        

    </div>
    <!-- /.container -->

    

</body>

<script type="text/javascript">
function showModal(){
	$("#modal").modal('show');
}
</script>

</html>

