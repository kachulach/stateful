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
        
        <!-- Modal -->
		<div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		    
		      <div class="modal-header" style="background-color: #101010;">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ">&times;</button>
		        <h4 class="modal-title" id="myModalLabel" style="color: #999;">Порака</h4>
		      </div>
		      
		      <div class="modal-body">
		      modal		       
		      </div>
		      
		      <div class="modal-footer">
		        <button id="close" type="button" class="btn btn-primary" data-dismiss="modal">Затвори</button>		        	        
		      </div>
		      
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		
        
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
		      <img src="${pageContext.request.contextPath}/upload/1L.jpg" alt="...">
		      <div class="carousel-caption">descr</div>
		    </div>
		    <div class="item">
		      <img src="${pageContext.request.contextPath}/upload/2L.jpg" alt="...">
		      <div class="carousel-caption">descr</div>
		    </div>
		    <div class="item">
		      <img src="${pageContext.request.contextPath}/upload/3L.jpg" alt="...">
		      <div class="carousel-caption">descr</div>
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

