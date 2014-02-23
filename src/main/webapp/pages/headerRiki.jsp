<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>

<div class="container-fluid well span6">
	<div class="row-fluid" style="height: 80px">
		
		<div style="float: right">
			<c:if test="${pageContext.request.userPrincipal.authenticated}">
				Најавени сте како: <b>${pageContext.request.userPrincipal.principal.username}</b> 
				<a href="${pageContext.request.contextPath}/j_spring_security_logout">одјава</a>
			</c:if>
		</div>
		
		<div>
		<h6>Моментално има ${numUsers} активни корисници</h6>
		</div>
		
        <div class="span8">        
            <h4>${ contact.name }</h4>
            <h6>Салдо: ${ saldo }</h6>
            
        </div>        
     </div>
</div>


