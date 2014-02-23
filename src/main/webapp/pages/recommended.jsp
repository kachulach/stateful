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
    
    <div class="container">
        
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top:30px">
	 
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		 
		  <!-- Slider Content (Wrapper for slides )-->
		  <div class="carousel-inner">
		    <div class="item active">
		      <img src="" alt="...">
		      <div class="carousel-caption">
					description
		      </div>
		    </div>
		    <div class="item">
		      <img src="" alt="...">
		      <div class="carousel-caption">
					description
		      </div>
		    </div>
		    <div class="item">
		      <img src="" alt="...">
		      <div class="carousel-caption">
					description
		      </div>
		    </div>
		    
		  </div>
		 
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right"></span>
		  </a>
		</div>


        <hr>

        <!-- /.row -->
        
         <div class="row">
         	
         <div class="container-fluid well span6" style="width: 575px; height: 200px; float: right; margin-left: 5px;">
			<div class="row-fluid">
		        <div class="span2" style="width: 50%; float:left" >
				    <img src="" >
		        </div>
		        
		        <div class="span8" style="width: 50%; float:right">
		            <h3 style="margin-top: 0px;">name</h3>
		            <h6>game type</h6>
		            <h6>desc</h6>	            
		            <a style="float: right;" rel="popover" id="" class="proba btn btn-primary" data-placement="bottom">Повеќе инфо</a>
		            <a style="float: right; margin-right:5px" href="" class="btn btn-primary">Купи</a>
		            <p id="" value="" hidden></p>
        	 		<p id="" value="" hidden></p>
		        </div>
		        
			</div>
		</div>
         
       	</div>
        

        <hr>

<jsp:include page="footer.jsp"/>       
        

    
    <!-- /.container -->

    

</body>

<script type="text/javascript">

	function getPopContent(target) {
		var iden = "#";
		iden = iden.concat("full",target);
	    return $( iden ).attr( "value" );	    
	};
			
	function getPopTitle(target) {
		var iden = "#";
		iden = iden.concat("name",target);
	    return $( iden ).attr( "value" );
	};


	$(document).ready(function(){

		$(".proba").each(function() {
		    var $pElem= $(this);
		    $pElem.popover(
		        {
		        	template: '<div style="width:300px" class="popover special-class"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>',
		          	title: getPopTitle($pElem.attr("id")),
		          	content: getPopContent($pElem.attr("id"))
		        }
		    );
		 });

		
		  // Setup drop down menu
		  $('.dropdown-toggle').dropdown();
		 
		  // Fix input element click problem
		  $('.dropdown input, .dropdown label').click(function(e) {
		    e.stopPropagation();
		  });
	
				
	})


    
</script>



</html>

