<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>

<title>Игри</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/heroic-features.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.0.1-p7/css/bootstrap.min.css">

<script src="${pageContext.request.contextPath}/js/bootstrap-filestyle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-carousel.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.0.1-p7/js/bootstrap.min.js"></script>

<!-- load angular -->
<script src="${pageContext.request.contextPath}/js/angular/angular.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>

<script>

$(document).ready(function(){
	
	  // Setup drop down menu
	  $('.dropdown-toggle').dropdown();
	 
	  // Fix input element click problem
	  $('.dropdown input, .dropdown label').click(function(e) {
	    e.stopPropagation();
	  });	
	
})

</script>