<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html lang="en">

<head>
    <jsp:include page="header.jsp"/>
</head>

<body>

    <jsp:include page="navbar.jsp"/>
    
    <div style="margin-top:100px;" class="container">

    <!-- container -->          
	<div class="container">
	    <div class="row">

				<!-- List -->
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<span class="glyphicon glyphicon-list"></span>Листа на сите игри
						</div>
						<div class="panel-body">
							<ul class="list-group">
							
							<c:forEach var="game" items="${games}">							
								<li class="list-group-item">
									<div class="checkbox">
										<label name="checkbox" value=""> 
											${ game.name } </label> 
										<label style="color: #C3BEBE;" name="checkbox" value="">
											${ game.gameType } </label>

										<div class="pull-right action-buttons">
											<a href=""> <span class="glyphicon glyphicon-pencil">
											</span></a> <a href="" class="trash"> <span
												class="glyphicon glyphicon-trash"> </span></a>
										</div>
									</div>
								</li>
							</c:forEach>							

							</ul>
						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-6">
									<h6>
										Вкупно игри <span class="label label-info">size</span>
									</h6>
								</div>
								<div class="col-md-6">
									<ul class="pagination pagination-sm pull-right">

										<li><a href="">«</a></li>

										<li class="active"><a href="javascript:void(0)">1<span
												class="sr-only">(current)</span></a></li>

										<!-- <li><a href="">1</a></li> -->

										<!-- <li><a href="javascript:void(0)">»</a></li> -->
										<li><a href="">»</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /List -->



			</div>

	    
	</div>
	<!-- /.container -->


<jsp:include page="footer.jsp"/>        

    
    <!-- /.container -->
	</div>
    

</body>



</html>





</html>


<script type="text/javascript">

	$(document).ready(function(){

		  // Setup drop down menu
		  $('.dropdown-toggle').dropdown();
		 
		  // Fix input element click problem
		  $('.dropdown input, .dropdown label').click(function(e) {
		    e.stopPropagation();
		  });
	})
	
	$("input").change(function(){

	var input = [];            
    $('.quantity').each(function(){
    	input.push($(this).val());
    });
    console.log(input);
	  
	  $.ajax({
		    type : "POST",
		    url : "buygame",
		    data: { input: input },
		    dataType: 'json',
		    success: function(total){

		    	$("#total").html("Вкупно: " + total + "ден.");	

			}
		});
	})

    
	</script>
