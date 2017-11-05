<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/registrationForm.css">
</head>
<body style="background-image:url(images/formBackground.jpg)">
    <div class="main-content">
		<form class="form-basic" method="post" action="saveUser" onSubmit="return UserSubmit()">

            <div class="form-title-row">
                <h1>User Registration Form</h1>
            </div>

            <div class="form-row" style="float:left; width:50%;">
                <label>
                    <span>First name</span>
                    <input type="text" name="firstName" id="firstName" placeholder="First Name" onBlur="CheckName(); return false;" autocomplete="off" required>
                </label>
                <label>
                    <span>Contact No.</span>
                    <input type="text" name="contactNumber" id="contact" placeholder="Contact Number" onBlur="checkContactNumber();CheckPhoneNumber(); return false;" autocomplete="off" required>
                </label>
                <label>
                    <span>Aadhar Number</span>
                    <input type="text" name="aadharNumber" id="aadharNumber" placeholder="Aadhar Number" onBlur="checkAadharNumber();CheckAadhar(); return false;" autocomplete="off" required>
                </label>
                <label>
                    <span>Pincode</span>
                    <input type="text" name="pincode" id="pincode" placeholder="Pincode" onBlur="CheckPincode(); return false;" autocomplete="off" required>
                </label>
               <label>
                    <span>Country</span>
                    <select name="country" id="country" class="form-control selectpicker" required>
                       <option value="">Select Your Country</option>
                        <option value="india">India</option>
                        <option value="us">United States</option>
                        <option value="china">China</option> 
                    </select>
                </label>
                <label>
                    <span>Mother Tounge</span>
                    <select name="motherTounge" id="motherTounge" class="form-control selectpicker" required>
                          <option value="">Select Your Mother Tounge</option>
                         <option value="hindi"> हिन्दी</option>
                        <option value="marathi">मराठी</option>
                        <option value="english">English</option>
                        <option value="bengali">বাংলা</option>
                         <option value="telugu">తెలుగు</option>
                         <option value="tamil">தமிழ்</option>
                         <option value="urdu">اُردُو</option>
                          <option value="kannada">ಕನ್ನಡ</option>
                           <option value="gujrati">ગુજરાતી</option>
                            <option value="oriya">ଓଡ଼ିଆ</option>
                             <option value="malyalam">മലയാളം</option>
                              <option value="sanskrit">संस्कृतम्</option>
                               <option value="punjabi">ਪੰਜਾਬੀ</option>
                               <option value="konkani">कोंकणी</option>
                                  <option value="bhojpuri">भोजपुरी </option>
                  
                     </select>
                </label>
                  <label>
                    <span>Password</span>
                    <input type="password" name="password1" id="password1" placeholder="Password" onBlur="CheckPassword(); return false;" autocomplete="off" required>
                </label> 
                 <label>
                    <span>Profession</span>
                    <select name="profession" id="profession" class="form-control selectpicker" required>
                        <option value="">Select Your Profession</option>
                        <option value="student">Student</option>
                        <option value="employee">Employee</option>
                     </select>
                </label>
             </div>

            <div class="form-row" style="float:left; width:50%;">
                <label>
                    <span>Last name</span>
                    <input type="text" name="lastName" id="lastName" placeholder="Last Name" onBlur="CheckLastName(); return false;" autocomplete="off" required>
                </label>
                 <label>
                    <span>Email</span>
                    <input type="email" name="email" id="email" placeholder="Email" onBlur="checEmail();CheckEmail(); return false;" autocomplete="off" required>
                </label>
                <label>
                    <span>City</span>
                    <select name="city" id="city" class="form-control selectpicker" required>
                        <option value="">Select Your City</option>
                        <option value="pune">Pune</option>
                        <option value="mumbai">Mumbai</option>
                        <option value="aurangabad">Aurangabad</option>
                    </select>
                </label>
                <label>
                    <span>State</span> 
                    <select name="state" id="state" class="form-control selectpicker" required>
                          <option value="">Select Your State</option>
                          <option value="maharashtra">Maharashtra</option>
                          <option value="uttarPradesh">Uttar Pradesh</option>
                          <option value="madhyaPradesh">Madhya Pradesh</option>
                     </select>
                </label>
                <label>
                    <span>Gender</span>
                    <select name="gender" id="gender" class="form-control selectpicker" required>
                        <option value="">Select Gender</option>
                        <option value="female">Female</option>
                        <option value="male">Male</option>
                     </select>
                </label>
                <label>
                    <span>Food Preference</span>
                    <select name="foodPreference" id="foodPreference" class="form-control selectpicker" required>
                        <option value="">Select Food Preference</option>
                        <option value="veg">Veg</option>
                        <option value="non-veg">Non-Veg</option>
                        <option value="both">Both</option>
                     </select>
                </label>
                <label>
                    <span>Confirm Password</span>
                    <input type="password" name="password2" id="password2" placeholder="Confirm Password" onBlur="CheckPass(); return false;" autocomplete="off" required>
                </label>
                <label>
                    <span>Address</span>
                    <textarea name="address" id="address" placeholder="Address"  onBlur="CheckAddress(); return false;" autocomplete="off" required></textarea>
                </label>
             </div>

            <div class="form-row" style="width:50%;">
               <button type="submit" value="Submit">Submit</button>   
            </div>

					
        </form>
    </div>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
    function checEmail()
    {
    	 var email=document.getElementById( "email" ).value;
    	 $.ajax({
    			url:"checkUserMail",
    			data:{email:$("#email").val()},
    			success:function(resText){
    				if(resText!="")
    					{
    				alert(resText);
    					}
    				if(resText!=""){
    					$("#email").val("");
    					$("#email").focus();
    				}
    			}
    			
    		});
    }
    </script>
    <script>
    function checkContactNumber()
    {
    	 var contact=document.getElementById( "contact" ).value;
    	 $.ajax({
    			url:"checkContactNumber",
    			data:{contactNumber:$("#contact").val()},
    			success:function(resText){
    				if(resText!="")
    					{
    				alert(resText);
    					}
    				if(resText!=""){
    					$("#contact").val("");
    					$("#contact").focus();
    				}
    			}
    			
    		});
    }
    
    </script>
    
    <script>
    function checkAadharNumber()
    {
    	 var aadharNumber=document.getElementById( "aadharNumber" ).value;
    	 $.ajax({
    			url:"checkAadharNumber",
    			data:{aadharNumber:$("#aadharNumber").val()},
    			success:function(resText){
    				if(resText!="")
    					{
    				alert(resText);
    					}
    				if(resText!=""){
    					$("#aadharNumber").val("");
    					$("#aadharNumber").focus();
    				}
    			}
    			
    		});
    }
    
    </script>
    
    
<script src="js/registrationForm.js" type="text/javascript"></script>  
</body>
</html>