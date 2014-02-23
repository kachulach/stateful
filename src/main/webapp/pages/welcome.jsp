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
    
    	<jsp:include page="carousel.jsp"/>       

        <hr>
        
        	<div class="col-lg-3 col-md-6 hero-feature">
        		<div class="thumbnail">
                    <img src="">
                    <div class="caption" style="width:245px; height:210px">
                    <h3 style="width:227px; height:52px">name</h3>
                    	<h4>price</h4>
                        <p>description</p>
                        <p><a href="" class="btn btn-primary">Купи</a>  
                        <a rel="popover" id="" class="proba btn btn-default">Повеќе инфо</a>
                        </p>
                    </div>
                </div>
            </div>
			<p id="" value="" hidden></p>
        	<p id="" value="" hidden></p>

        <hr>

<jsp:include page="footer.jsp"/> 

    
    <!-- /.container -->

    

</body>

<script type="text/javascript">

	$('.carousel').carousel({
	  interval: 5000
	})

	var showRegModal = "<?php echo $data["showRegModal"]; ?>";
	var showLogginRegModal = "<?php echo $data["showLogginRegModal"]; ?>";

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

		if(showRegModal || showLogginRegModal){
			$('#regModal').modal('show');			
		}


		$('#log-in').click(function(){

			$('.dropdown-toggle').dropdown('toggle');

		})			
				
	})
	
	


    
</script>



</html>

