<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html lang="en">

<head>
    <jsp:include page="header.jsp"/>   
</head>

<body  <%
        	if(request.getAttribute("msg")!=null)
				out.println("onload=\"showModal()\"");
		%>
>

	<jsp:include page="navbar.jsp"/>

    <div class="container">

        <jsp:include page="carousel.jsp"/>
        
        <hr>
              
        <!-- Register -->
        
        
        <div class="container">
        
										
		
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-0 col-md-offset-0">
				<form method="post" action="${pageContext.request.contextPath}/game/register">
					<h2>Регистрација<small> бесплатна регистрација</small></h2>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">						
						<div class="form-group">								
		                	<input type="text" name="first_name" id="first_name" class="form-control input-lg" 
		                    <%
					        	if(request.getAttribute("first_name")!=null)
									out.println("value="+request.getAttribute("first_name")+"");
							%>
		                    placeholder="име" tabindex="1" required>
						</div>
						</div>
						
						<div class="col-xs-6 col-sm-6 col-md-6">							
						<div class="form-group">
								<input type="text" name="last_name" id="last_name" class="form-control input-lg " 
								 
								 <%
					        	if(request.getAttribute("last_name")!=null)
									out.println("value="+request.getAttribute("last_name")+"");
								%>								
								placeholder="презиме" tabindex="2" required>
						</div>
						</div>
					</div>
					
					<div class="form-group">
						<input type="text" name="usernameF" id="usernameF" class="form-control input-lg" 
						
						<%
					    	if(request.getAttribute("usernameF")!=null)
								out.println("value="+request.getAttribute("usernameF")+"");
						%>
						placeholder="корисничко име" tabindex="3" required>
					</div>
					
					<div class="form-group">
						<input type="email" name="email" id="email" class="form-control input-lg" 
						
						<%
					    	if(request.getAttribute("email")!=null)
								out.println("value="+request.getAttribute("email")+"");
						%>
						placeholder="емаил" tabindex="4" required>
					</div>
					
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">							
						<div class="form-group">
							<input type="password" name="password" id="password" class="form-control input-lg" 
							placeholder="лозинка" tabindex="5" required>
						</div>
						</div>
						
						<div class="col-xs-6 col-sm-6 col-md-6">							
							<div class="form-group">							  
								<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" 
								placeholder="потврди ја лозинката" tabindex="6" required>
							</div>
						</div>
					</div>
					
					<!-- dropdown OMILEN ZANR 
					
					
					<div class="form-group">
						<select name="game_type" id="game_type" class="form-control input-lg" tabindex="7">
						    <option default>Избери омилен жанр</option>
		                    <option >1</option>
		                    <option >2</option>
		                    <option >3</option>
					    </select>
					</div>
						-->		
										
					<div class="row">
						<div class="col-xs-3 col-sm-3 col-md-3">
							<span class="button-checkbox">
								<button type="button" class="btn" data-color="info" tabindex="7">Се согласувам</button>
		                        <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
							</span>
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9">
							 Со кликање на <strong class="label label-primary">Регистрирај се</strong>, се согласуваш со Правилата и условите на оваа страна, како и користење на Cookie.
						</div>
					</div>
					
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<input type="submit" value="Регистрирај се" name="register" class="btn btn-primary btn-block btn-lg" tabindex="7">
						</div>						
					</div>
				</form> 
			</div>
		
		
		
		
		</div>
		
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
        
        
        <hr>

<jsp:include page="footer.jsp"/>       
        

    </div>
    <!-- /.container -->

    

</body>

<script type="text/javascript">
function showModal(){
	$("#modal").modal('show');
}
</script>


<script type="text/javascript">

$(function () {
    $('.button-checkbox').each(function () {

    	 // Setup drop down menu
		  $('.dropdown-toggle').dropdown();
		 
		  // Fix input element click problem
		  $('.dropdown input, .dropdown label').click(function(e) {
		    e.stopPropagation();
		  });

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
            }
        }
        init();
    });
});



</script>

</html>
