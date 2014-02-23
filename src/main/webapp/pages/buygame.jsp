<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
     
        
  
	<div class="container">
	<div class="row">
		<div class="col-xs-8">
			<form method="post">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<div class="row">
							<div class="col-xs-6">
								<h5><span class="glyphicon glyphicon-shopping-cart"></span> Купувачка кошничка</h5>
							</div>
							<div class="col-xs-6">
								<a onclick="func();" href="http://localhost/laravel/index.php/welcome" class="btn btn-primary btn-sm btn-block">
									 <span class="glyphicon glyphicon-share-alt"></span>Продолжи со купување
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
								
					<div class="row">
						<div class="col-xs-2"><img class="img-responsive" src="">
						</div>
						<div class="col-xs-4" style="width: 50%">
							<h4 class="product-name"><strong>name</strong></h4><h4><small>game_type</small></h4>
						</div>
						<div class="col-xs-6" style="width: 32%">
							<div class="col-xs-6 text-right">
								<h6><strong>price ден. <span class="text-muted"> x</span></strong></h6>
							</div>
							<div class="col-xs-4">
								<input name="<?php echo $i;?>" type="text" class="quantity form-control input-sm" value="">
							</div>
							<div class="col-xs-2">
								<a href="">
									<span class="glyphicon glyphicon-trash"> </span>
								</a>
							</div>
						</div>
					</div>
					<hr>
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-9">
							<h4 class="text-right"><p id="total">Вкупно: price ден.</p></h4>							
						</div>
						<div class="col-xs-3">
							<button type="submit" class="btn btn-success btn-block">
								Купи
							</button>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	
	<p id="proba"></p>
	
	</div>
	
<jsp:include page="footer.jsp"/>       

    
    <!-- /.container -->
	</div>
    

</body>



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
