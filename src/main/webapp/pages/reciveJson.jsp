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
		
		
		<title>Send Message</title>
	</head>

	<body>
		
		<jsp:include page="header.jsp"/>
		
		<div style="width: 800px; margin-top:50px; margin-left: 20px;" class="well">
			<ul class="nav nav-tabs">
	  			<li class="active"><a href="#">Admin</a></li> 					
			</ul>
			<div>				
				
				<table>				
					<tbody>
						<tr>
							<td>Од:</td>
							<td style="width:300px"><input class="form-control"  id="confrom" required="required"/></td>
						</tr>
						<tr>
							<td>До</td>
							<td><input class="form-control" id="conto" required="required"/></td>
						</tr>
						<tr>							
							<td></td>
							<td><textarea class="form-control" rows="10" id="content" required="required"/></textarea></td>
						</tr>						
						<tr>
							<td><input id="kopce" name="kopce" value="Send" type="button" class="btn btn-primary btn-lg active" ></input></td>
							<td><p style="margin-left: 20px; margin-top: 10px" id="success"></p></td>
						</tr>
					</tbody>
				</table>
		<script type="text/javascript">
			$(document).ready(function() {
								
				function formToJSON() {  
					   return JSON.stringify({
						    "conFrom" : $('#confrom').val(),
						    "conTo" : [ $('#conto').val() ],
						    "content" : $('#content').val()					    
					   })				
				};
				
				$( "#kopce" ).click(function() {
					$.ajax({
						   type : "POST",
						   url : "${pageContext.request.contextPath}/reciveJson",
						   contentType : "application/json",
						   data : formToJSON(),
						   dataType : 'json',
						   success : function(data){
							   if(data.status==0){
								   $("#success").html("Пораката не успеа да се прати.");
							   }
							   else{
								   $("#success").html("Пораката е успешно пратена.");
							   }								   
						   }
						  });
					});	
				
			});
		</script>
				
				
		</div>
		
		<div>
		</body>
		
</html>