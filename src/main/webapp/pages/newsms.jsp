<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2-bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2.css" rel="stylesheet"/>				
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/js/select2.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#focusedInput").select2({tags:[${broevi}], placeholder: "Insert a number" });
			})	
		</script>
		
		<title>Send Message</title>
	</head>

	<body>
		
		<jsp:include page="header.jsp"/>
		
			<div style="width: 800px; margin-top:50px; margin-left: 20px;" class="well">
			
				<ul class="nav nav-tabs">
  					<li><a href="${pageContext.request.contextPath}/recived">Примени пораки</a></li>
 					<li><a href="${pageContext.request.contextPath}/sent">Пратени пораки</a></li>
 					<li class="active"><a href="#">Нова порака</a></li>
 				</ul>
				
				<div style="margin-top: 20px; height: 360px">				
				<form:form method="POST" commandName="sms2" 
				action="${pageContext.request.contextPath}/newsms">
				
				<div style="width:500px">					
						
						<div style="float: top; width:350px">
						
							<p style="float: left" align="right">До:</p>
							<form:input width="300px" class="form-control" 
							id="focusedInput" path="conTo" />	
													
						</div>
						
						<div style="float: top; width:500px; margin-top: 20px">						
							<form:textarea class="form-control" rows="10" path="content" />							
						</div>			
									
						<div style="float: top; width:500px; margin-top: 6px">	
							<p style="float: left; width:400px">${message}</p>						
							<input style="float:right" class="btn btn-primary btn-lg active" 
							type="submit" value="Прати" />
						</div>					
				</div>
				</form:form>
				
				
				</div>
				
				<div>
		</body>
		
</html>