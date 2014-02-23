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
	                    
	                    
	                    
	                    <li class="list-group-item">
	                            <div class="checkbox">
	                                
	                                <label name="checkbox" value="">
	                                    game details
	                                </label>
	                                <label style="color:#C3BEBE;" name="checkbox" value="">
	                                     game type
	                                </label>
	                                
	                                <div class="pull-right action-buttons">
	                                <a href="">
	                                <span class="glyphicon glyphicon-pencil">
	                                </span></a>
	                                <a href="" class="trash">
	                                <span class="glyphicon glyphicon-trash">
	                                </span></a>
	                                
	                            	</div>
	                                
	                                
	                            </div>
	                            
	                        </li>
	                        
	                        <li class="list-group-item">
	                            <div class="checkbox">
	                                
	                                <label name="checkbox" value="">
	                                    game details
	                                </label>
	                                <label style="color:#C3BEBE;" name="checkbox" value="">
	                                     game type
	                                </label>
	                                
	                                <div class="pull-right action-buttons">
	                                <a href="">
	                                <span class="glyphicon glyphicon-pencil">
	                                </span></a>
	                                <a href="" class="trash">
	                                <span class="glyphicon glyphicon-trash">
	                                </span></a>
	                                
	                            	</div>
	                                
	                                
	                            </div>
	                            
	                        </li>
	                        
	                    </ul>
	                </div>
	                <div class="panel-footer">
	                    <div class="row">
	                        <div class="col-md-6">
	                            <h6>
	                                Вкупно игри <span class="label label-info">size</span></h6>
	                        </div>
	                        <div class="col-md-6">
	                            <ul class="pagination pagination-sm pull-right">
	                                	                                
	                                <li><a href="">«</a></li>
	                                
									<li class="active"><a href="javascript:void(0)">1<span class="sr-only">(current)</span></a></li>
	                                			
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
	        
	        <!-- Change -->
			<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-0 col-md-offset-0">
		    					  				<!-- од upload на слика                                                              -->
				<form role="form" method="post" class="fileinput fileinput-new" data-provides="fileinput" enctype="multipart/form-data">
					<h2 style="margin-top:12px;">Промена во игра<small> во базата на податоци</small></h2>
					<hr class="colorgraph">
	
					<input name="id" style="display:none;" value=""	>
	
					<div  class="form-group">						
					<input type="text" name="name" id="name" class="form-control input-lg" 
					placeholder="" tabindex="1">
					</div>
					
					<div  class="form-group">
						<textarea class="form-control input-lg" name="description" id="description" rows="4"					
						 tabindex="2">
						 </textarea>
					</div>
					
					<div  class="form-group">
						<input type="text" name="price" id="price" class="form-control input-lg" tabindex="3">
					</div>
					
					<div class="form-group"> 
					<input type="text" name="num_avail" id="num_avail" class="form-control input-lg" placeholder="Залиха">		    
			   		</div>
					
					<div class="form-group">					
						<select name="game_type" id="game_type" class="form-control" tabindex="4">
							    <option default>Избери омилен жанр</option>
			                    <option>1</option> 	    
			                     <option>2</option> 	 
			                      <option>3</option> 	                 
						</select>
					</div>
	
				    <div class="form-group">
				    
				    	  <span class="btn btn-default btn-file btn-lg">
							  <span class="fileinput-new">Одбери слика</span>
							  <span class="fileinput-exists">Смени ја сликата</span>
							  <input type="file" name="file">
						  </span>
						  
						  <span class="fileinput-filename"></span>
						  <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">&times;</a>					  
				    
				    </div>
				    
				    <div class="form-group">
				    <h2><small>Координати за отсекување на сликата (за carousel)</small></h2>
				    <input type="text" name="x" id="x" class="form-control input-lg" placeholder="x" style="width:49%;float:left;margin-right:2%">	
				    <input type="text" name="y" id="y" class="form-control input-lg" placeholder="y" style="width:49%">		    
				    </div>
	
	
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-md-6"><input type="submit" name="submit" value="Внеси" class="btn btn-primary btn-block btn-lg" tabindex="5"></div>
						<div class="col-xs-6 col-md-6"><a class="btn btn-primary btn-block btn-lg" href="">Откажи</a><!-- <a class="btn btn-primary btn-block btn-lg" href="http://localhost/laravel/index.php/deletegame?page=">Откажи</a> --></div>
													
					</div>
				</form>
							
			</div>
			<!-- /Change -->

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
