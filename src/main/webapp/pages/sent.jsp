<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
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
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Пратени пораки</title>
	</head>	
	
	<body>
		
		<jsp:include page="header.jsp" />
			<div style="width: 940px; margin-top:50px; margin-left: 20px;" class="well">
				<ul class="nav nav-tabs">
  						 <li ><a href="${pageContext.request.contextPath}/recived">Примени пораки</a></li>
 						 <li class="active"><a href="#">Пратени пораки</a></li>
 						 <li><a href="${pageContext.request.contextPath}/newsms">Нова порака</a></li>
 				</ul>
				<div>			
			<div >		
			<table class="table table-hover table-bordered" style="margin-top: 20px">
			<thead>
				<tr style="background-color: #8fbf8f;">
					
					<th width="15%">До корисник</th>
					<th width="15%">Содржина</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${sent}">
						<c:forEach var="con" items="${item.conTo}">
						<tr>
							<td><a href="${pageContext.request.contextPath}/chosen/${con.phoneNum}">${con.name}</a></td>
							<td>${item.content}</td>
						</tr>
						</c:forEach>
					</c:forEach>
			</tbody>
		</table>
		</div>
				
				</div>
				
				<div>
		</body>
</html>