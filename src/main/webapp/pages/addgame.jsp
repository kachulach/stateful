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

	<div class="row">
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-0 col-md-offset-0">	    					  							
			<form method="post" action="${pageContext.request.contextPath}/game/addgame">
			<!-- од upload на слика   class="fileinput fileinput-new" data-provides="fileinput" enctype="multipart/form-data"  -->
				<h2>Внес на нова игра<small> во база на податоци</small></h2>
				<hr class="colorgraph">
				<div class="form-group">
					<input type="text" name="name" id="name" class="form-control input-lg" 
					placeholder="име" tabindex="1" required></input>		            
				</div>
				
				<div class="form-group">
					<textarea class="form-control input-lg" name="description" id="description" 
					rows="4" my="params" placeholder="опис" tabindex="2" required></textarea>
				</div>
				
				<div class="form-group">
					<input type="text" name="price" id="price" class="form-control input-lg"
					placeholder="цена" tabindex="3" required>		            
				</div>
								
				<div class="form-group">					
<!-- 					<select name="game_type" id="game_type" class="form-control" tabindex="5"> -->
<!-- 						    <option default>Избери омилен жанр</option> -->
<!-- 		                    <option>1</option> -->
<!-- 		                    <option>2</option> -->
<!-- 		                    <option>3</option> -->
<!-- 					</select> -->
					<input type="text" name="gameType" id="gameType" class="form-control input-lg"
					placeholder="тип на игра" tabindex="4" required>	
				</div>
				
				<div class="form-group">
					<input type="text" name="picLocation" id="picLocation" class="form-control input-lg"
					placeholder="локација на сликата" tabindex="5" required>		            
				</div>

				<!-- todo: upload picture -->
			    <div class="form-group">
			    
<!-- 			    	  <span class="btn btn-default btn-file btn-lg"> -->
<!-- 						  <span class="fileinput-new">Одбери слика</span> -->
<!-- 						  <span class="fileinput-exists">Смени ја сликата</span> -->
<!-- 						  <input type="file" name="file"> -->
<!-- 					  </span> -->
<!-- 					  <span class="fileinput-filename"></span> -->
<!-- 					  <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">&times;</a>					   -->
			    </div>
			    
			    <!-- todo: upload picture for CAROUSEL -->
			    <div class="form-group">
<!-- 			    <h2><small>Координати за отсекување на сликата (за carousel)</small></h2> -->
<!-- 			    <input type="text" name="x" id="x" class="form-control input-lg" placeholder="x" style="width:49%;float:left;margin-right:2%">	 -->
<!-- 			    <input type="text" name="y" id="y" class="form-control input-lg" placeholder="y" style="width:49%">		     -->
			    </div>


				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-md-6">
					<input type="submit" name="submit" value="Внеси" class="btn btn-primary btn-block btn-lg" tabindex="6">
					</div>					
				</div>
			</form>
			
			<!-- Modal -->
			<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			  <div class="modal-dialog">
			    <div class="modal-content">
			    
			      <div class="modal-header" style="background-color: #101010;">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color: #999;">Порака</h4>
			      </div>
			      
			      	<div class="modal-body">${msg}</div>
			      
			      <div class="modal-footer">
			        <button id="close" type="button" class="btn btn-primary" data-dismiss="modal">Затвори</button>		        	        
			      </div>
			      
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal --> 

						
		</div>
	</div>

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

