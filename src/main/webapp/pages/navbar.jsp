<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>

<%
   //String username = session.getAttribute( "username" ).toString();   
%>

<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="container">
        
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/game/welcome">Почетна</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                
                	<li class="dropdown">
		            <a class="dropdown-toggle" href="#" data-toggle="dropdown">Игри<strong class="caret"></strong></a>
		            	<ul class="dropdown-menu">
							<li><a href=""></a></li>
		            	</ul>
		          	</li>
		          		
		          	<c:if test="${username != null && username != 'admin'}">
		          	<li><a href="${pageContext.request.contextPath}/game/recommended">Препорачани</a></li>         
                    </c:if>              
                </ul>		        
		        
		        <!-- најава -->
		        <c:if test="${username == null}">
                <ul class="nav navbar-nav" style="float:right;">	          
		          
		          <li class="dropdown">
		            <a class="dropdown-toggle" href="#" data-toggle="dropdown">Најава <strong class="caret"></strong></a>
		            <div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">		              
							
							<form method="post" action="${pageContext.request.contextPath}/game/login" accept-charset="UTF-8">
								
								<input hidden name="url" value="${pageContext.request.requestURL}">
								<input style="margin-bottom: 15px;" type="text" placeholder="Корисничко име" id="username" name="username" class="form-control input-sm">
								<input style="margin-bottom: 15px;" type="password" placeholder="Лозинка" id="password" name="password" class="form-control input-sm">
								<input style="float: left; margin-right: 10px;" type="checkbox" name="rememberme" id="rememberme" value="1">
								<label class="string optional" for="user_remember_me">Запомни ме </label>
								<input class="btn btn-primary btn-block" type="submit" name="sign-in" value="Најави се" style="margin-bottom: 15px;">	
															                               
							</form>

		            </div>
		          </li>
		        </ul>
		        </c:if>
		        
		        <!-- Одјави се -->
		        <c:if test="${username != null}">
              	<ul class="nav navbar-nav" style="float:right;">
					<li><a href="${pageContext.request.contextPath}/game/logout">Одјави се</a></li>
				</ul>
				</c:if>
				
				 <!-- Кошничка -->
				<c:if test="${username != null && username != 'admin'}  ">
              	<ul class="nav navbar-nav" style="float:right;">
					<li><a href="${pageContext.request.contextPath}/game/buygame">Кошничка</a></li>
				</ul>
				</c:if>

		        <!-- Регистрирај се -->
		        <c:if test="${username == null}">
              	<ul class="nav navbar-nav" style="float:right;">  
					<li><a href="${pageContext.request.contextPath}/game/register">Регистрирај се</a></li>
				</ul>
				</c:if>

				<!-- администратор -->
				<c:if test="${username == 'admin' }">
		        <ul class="nav navbar-nav" style="float:right;">  
		          <li class="dropdown">
		            <a class="dropdown-toggle" href="#" data-toggle="dropdown">Администратор<strong class="caret"></strong></a>
		            
						<ul class="dropdown-menu">
			              <li><a href="${pageContext.request.contextPath}/game/addgame">Додади игра</a></li>
			              <li><a href="${pageContext.request.contextPath}/game/deletegame">Избриши/Измени игра</a></li>			              
		            	</ul>

		          </li>
		        </ul>
		        </c:if>
		        
		        <!-- Има најавен -->
		        <c:if test="${username != null}">
              	<ul class="nav navbar-nav" style="float:right;">  
					<li><a href="">Најавен како ${username}</a></li>
				</ul>
				</c:if>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- /.container -->
