
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2-bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2.css" rel="stylesheet"/>
		
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/js/select2.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/insertNumber" method="post">
		
	<div class="container" style="margin-top: 50px; margin-left: 70px;">
    <div class="row">
        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"> Најавете со телефонскиот број </h3>
                    <div class="checkbox pull-right">
                        <label>
                            <input type="checkbox" name="checked"/> запомни
                        </label>
                    </div>
                </div>
                <div style="height: 120px" class="panel-body">
                    <form role="form">
                    <div class="form-group">
                        <label for="cardNumber">
                            Телефонски број</label>
                        <div class="input-group">
                        	<input type="text" name="number" class="form-control" placeholder="Вашиот телефонски број"
                                required autofocus />                       
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        </div>
                        <p style="margin-top: 12px">${message}</p>
                    </div>
                    
                    </form>
                </div>
            </div>
            
            <br/>
            <input class="btn btn-success btn-lg btn-block" type="submit" value="Продолжи">
        </div>
    </div>
</div>
		
</form>

</body>
</html>
