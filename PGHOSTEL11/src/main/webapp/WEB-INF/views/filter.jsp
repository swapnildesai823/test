<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/taglibs/image.tld" prefix="ui"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Filter_Search</title>
<meta charset="utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet" />     
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" /><!-- this is for the filter.etc icons-->
 <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<style>
	.ui-autocomplete { font-size: 10px; }
	
}
</style>
<!-- this script for the API-->
        <!--API script ends here-->
        <!--this for the img-->
		<style>
		.carousel-content {
  position: absolute;
  bottom: 10%;
  left: 5%;
  z-index: 20;
  color: white;
  text-shadow: 0 1px 2px rgba(0,0,0,.6);
}<!--this for the img end here-->
		
		
		</style>
        <style>

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

.carousel-content {
  position: absolute;
  bottom: 10%;
  left: 5%;
  z-index: 20;
  color: white;
  text-shadow: 0 1px 2px rgba(0,0,0,.6);
}

 </style>
</head>
<body >
		<nav class="navbar navbar-default navbar-inverse" role="navigation" style="background-color:rgb(243,210,230)">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="showHome"><b>Diva Stays</b></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
     
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<div class="col-md-12">
								Login via
								<div class="social-buttons">
									<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
									<a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
								</div>
                                or
								 <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <label class="sr-only" for="exampleInputEmail2">Email address</label>
											 <input type="email" name="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required>
										</div>
										<div class="form-group">
											 <label class="sr-only" for="exampleInputPassword2">Password</label>
											 <input type="password" name="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
                                             <div class="help-block text-right"><a href="">Forget the password ?</a></div>
										</div>
										<div class="form-group">
											 <button type="submit" class="btn btn-primary btn-block">Sign in</button>
										</div>
										<div class="checkbox">
											 <label>
											 <input type="checkbox"> keep me logged-in
											 </label>
										</div>
								 </form>
							</div>
							<div class="bottom text-center">
								New here ? <a href="showUserReg"><b>Join Us</b></a>
							</div>
					 </div>
				</li>
			</ul>
        </li>
        <li><a href="showHelp">Help</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
<hr>

  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
     <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>
 
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav navbar-right">
      
        <li>
          <a href="#" ><span class="fa fa-filter" aria-hidden="true"  data-toggle="modal" data-target="#myModal">&nbsp;<b><span>Filter</b></span></a>
          
          
     
          		
     </li>
    
        <li><a href="#"><span class="fa fa-sort" aria-hidden="true"  data-toggle="modal" data-target="#myModal1">&nbsp;<b>Sort</b></span></a></li>
   <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
<!-- Modal content-->
  <form action="sortPrice" role="form">
      <div class="modal-content" style="background-color:rgb(243,210,230)">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Refine Your Search</h4>
                          <div class="panel-body">
            		      <div class="list-group" style="background-color:white)">
                    	<div class="radio">
                    	<div>
                      <label><input type="radio" name="priceSort" value="lowTohigh">? ?  Price - Low To High</label>
                    	</div>
                    	<div class="radio">
                      <label><input type="radio" name="priceSort" value="highToLow">? ?  Price - High To Low</label>
                    	</div>
                            
           <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal">Apply</button>
        </div>
                      
                    
	</div>
  </div>
    </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><!--main nav closed-->

<div class="container"><!--1)main container for filter-->
	<div class="row"><!--2)row -->
	<form class="form" role="form" method="post" action="showFilter2" accept-charset="UTF-8">
		<div class="col-md-3"><!--3)column for filter-->
        	<div class="well" style="background-color:rgb(243,210,230)"><strong>Location</strong> 
        <div class="input-group">
	   	<div class="form-group">
  			<input type="text" name="address"  placeholder="city" class="form-control" id="address" onblur="javascript: dynamicdropdown(this.value);"/>
            </div><!--form group closed-->
  		</div><!--input group closed-->
    	</div><!--well class closed-->
       <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true"><!--4)main panel start drom here-->

            <!-- first Panel start Here -->
        <div class="well" style="background-color:rgb(243,210,230)">  <!--5)class well-->
        <strong>Profession</strong> 
        
           <div class="form-group">
      		<select name="profession" id="select1" name="profession" class="form-control">
        	<option value="Student">Student</option>
  			<option value="Employee">Employee</option>
      		</select>
			</div><!--form closed -->
        
       		 <div class="form-group">
      		<label>Mother Toung</label>
       		<select id="language" name="language" class="form-control">
                              <option value="hindi">हिंदी (hindi)</option>
                              <option value="marathi">मराठी (marathi)</option>
                              <option value="english">English</option>
                              	<option value="gujrati">ગુરારથી  (gujarati)</option>
                               <option value="malayalam">മലയാളം (malayalam)</option>
                              <option value="telgu">తెలుగు  (telugu)</option>
                              <option value="tamil">தமிழ் (tamil)</option>
                              <option value="panjabi">ਪੰਜਾਬੀ (panjabi)</option>
                              <option value="kannad">ಕನ್ನಡ್ (Kannad)</option>
                              <option value="urdu">اردو (urdu)</option>
                              
                          </select>
    		</div><!--form group-->
			<div class="form-group">
      		<label>Places</label>
      	 <script type="text/javascript" language="JavaScript">
                document.write('<select name="subcategory" id="subcategory" class="form-control"><option value="">Please select Area</option></select>')
            </script>
    </div><!--form group-->
    
    	<div class="form-group">
   	   <label>Accomadation for</label>
    		  <select id="accomodation" class="form-control" name="accomodation">
        	<option value="Girls">Girls</option>
       
      	</select>
    	</div><!--form group-->
    		<div class="form-group">
      <label>Food Type</label>
      <select id="Food Type" class="form-control" name="food">
        <option value="Veg">Veg</option>
        <option value="Non-Veg">non-veg</option>
         <option value="Both">Both</option>
      </select>
    </div><!--form-group closed-->
    
    		<div class="panel panel-default"><!--panel class start for the price -->
              <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                  <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Price <span class="glyphicon glyphicon-plus pull-right" aria-hidden="true"></span>
                  </a>
                </h4>
              </div>
              
              	<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
                <div class="panel-body">
                  <div class="list-group">
                    <div class="checkbox">
                      <label><input type="radio" value="1000" name="price">Below ₹1000</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="radio" value="1500" name="price">₹1000-₹2000</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="radio" value="2500" name="price">₹2000-₹3000</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="radio" value="3000" name="price">>₹3000</label>
					</div>
              </div>
                   </div>
				 </div>
           
           
            </div><!--panel class closed for price -->
            <br>
		<div class align="center"><button type="submit" class="btn btn-info" style="">Search</button>
		</div><br>
          <button type="reset" class="btn btn-info">Reset All</button>&nbsp;&nbsp;&nbsp;
          <button type="submit" class="btn btn-info" data-toggle="modal" data-target="#myModal">Advance Filter</button>
          </form>
        <!--modal class start here for the  Adv filter-->  
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
		 <!-- Modal content-->
      	<div class="modal-content" style="background-color:rgb(243,210,230)">
       		 <div class="modal-header" style="background-color:rgb(243,210,230)">
        	  <button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title"> Refine Your Search</h4>
        	</div><!--heder closed-->
            
            <div class="modal-body" style="background-color:#006666"><!--1)main body start-->
         		<div class="panel panel-default"><!--2)main panel is satrt in the body-->
              <div class="panel-heading" role="tab" id="headingThree"><!--heading start-->
                <h4 class="panel-title" background-color:#006666>
                  <a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                    Facilities <span class="glyphicon glyphicon-plus pull-right" aria-hidden="true"></span>
                  </a>
                </h4>
              </div><!--heading closed-->
              <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree" aria-expanded="true" ><!--3)collapase class-->
                <div class="panel-body" style="background-color:#006666">
                  <div class="list-group">
                    <div class="checkbox">
                      <label><input type="checkbox" value="SwimmingPool">Swimming Pool</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="Bar">Bar</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="Gym">Gym</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="ParkingFacility">Parking Facility</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="ConfernceRoom">Confernce Room</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="WheelchairAccesible">Wheelchair Accesible</label>
                    </div>                
                    <div class="checkbox">
                      <label><input type="checkbox" value="MiniFridge">Mini Fridge</label>
                    </div>
                   
                  </div><!--list group closed-->
                  </div><!--panel body closed-->
                  </div><!--3)-->
                  </div><!--2)-->
                                    
                  
                  
                  <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingfour">
                <h4 class="panel-title">
                  <a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="true" aria-controls="collapsefour">
                    Collections <span class="glyphicon glyphicon-plus pull-right" aria-hidden="true"></span>
                  </a>
                </h4>
              </div>
              <div id="collapsefour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingfour" aria-expanded="true">
                <div class="panel-body" style="background-color:#006666">
                  <div class="list-group" style="background-color:#006666">
                    <div class="checkbox">
                      <label><input type="checkbox" value="BestforCorporate" name="collections">Best for Corporate</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="MostPopular" name="collections">Most Popular</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="ForCouples" name="collections">For Couples</label>
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="LocalCheckIn" name="collections">Local Check In</label>
                    </div>
                  </div>
                  <!-- List Group End Here -->
                </div>
              </div>
            </div>         <!-- Panel End Here -->
            </div><!--1)main body closed-->
            
           <div class="modal-footer" style="background-color:#006666">
          <button type="button" class="btn btn-success" data-dismiss="modal">Apply</button>
      	  </div>

      
		</div><!--modal-content closed-->
     </div><!--modal dialog closed-->
      </div><!--main modal closed for adv filter-->
    
 
     </div><!--5)-->
     </div><!--4)-->
     </div><!--3)-->
     
    
  <div class="col-md-9" style="height:20px">
      <c:forEach items="${house}" var="house" varStatus="itr">
 		<a href="showHouseInfo/${house.hId}"> <div class="well"  style="background-color:#006666" style="height:270px">
 		 
           <div class="row">
   				<div class="media col-md-4">
 	<h4><font color="#FF0000">Home Details</font></h4>
			
			 <table class="table small" >
       			
                <tbody height="25">
                
                          <tr>
                             <td ><h5 style="color:#000000">Accomodation For</h5></td>
                              <td><h5 style="color:#000000">${house.accomodation }</h5></td>
                          </tr>
                            <tr>
                             <td><h5 style="color:#000000">Area</h5></td>
                             <td><h5 style="color:#000000">${house.address}</h5></td>
                          </tr>
                            <tr>
                              <td><h5 style="color:#000000">Avalability</h5></td>
                              <td><h5 style="color:#000000">2 bed availble</h5></td>
                           </tr>
                              <tr>
                                <td><h5 style="color:#000000">Food Preference</h5></td>
                                <td><h5 style="color:#000000">${house.foodPreference}</h5></td>
                             </tr>
                            
                         </tbody>
                         </table>
                </div><!--col 4 is closed-->
                <div class="media col-md-8">
               		<div class="carousel-inner">
  				<div class="active item">
  				<img src="<ui:image img='${house.img1}'></ui:image>" alt="..." style="height:90px"/>
     			 <div class="carousel-content">
        			<h4><strong>${house.hId}&nbsp;${house.houseName}</strong>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<strong>${house.tenancyType}</strong></h4>
                    	</div><!--carousel content class closed-->
                    	<div class="caption">
  <p style="color:#990000">Starting from &ensp;&ensp;<strong> ${house.rent}/bed</strong></p>
        </div>

      
  
      </div><!--active item class closed-->
    </div><!--carousel inner class closed-->
  		      
      </div><!--colm 8 class  closed-->
    </div> <!--row closed-->
 </div><!--class well closed --></a>
 </c:forEach>
       <tag:paginate max="15" offset="${offset}" count="${count}"
			uri="showFilter" next="&raquo;" previous="&laquo;" />
 </div><!--colm 9 closed-->
 </div><!--2)-->
     </div><!--1)-->
        <!-- /.sidebar column end here -->
        
   

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript" ></script>
<script src="js/dynamicdropdown.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
		$(function() {
			$("#address").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "listAddress",
						data : {
							input : request.term
						},
						success : function(data) {
							response(data);
						}
					});
				}
			});
		});
	</script>
</body>
</html>