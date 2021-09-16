<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">



<title>EQ CLUB</title>
<meta content="" name="description">
<meta content="" name="keywords">
<link href="favicon.png" rel="icon">
<link href="favicon.png" rel="apple-touch-icon">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Lato:400,300,700,900" rel="stylesheet">
<link href="http://fonts.cdnfonts.com/css/blackboard" rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="Amoeba/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Amoeba/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="Amoeba/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="Amoeba/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Template Main CSS File -->
<link rel="stylesheet" type="text/css" href="css/style.css?v=11">
<!--<meta name="viewport" content ="width=1000,user-scalable=yes" />-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
 <script src="http://code.jquery.com/jquery-1.10.2.js"
        type="text/javascript"></script>
    <script src="js/app-ajax.js" type="text/javascript"></script>
</head>
<body class="body1">
<div class="container2">
	
	<div style="margin-top:-20px;margin-left:170px;margin-bottom:20px;"><div class="logo me-auto">
<h1 style="font-size:240%;"><a href="index.jsp" style="text-decoration: none;color: #2A2965">EQ CLUB</a></h1></div></div>
		
	<!--<form class="signUp"  action="./studentLogin" onsubmit="passCheck();return false;" method="post" autocomplete="off">
		<p id="h">Create Your Account<p>
		<p>Please fill in the details and a strong password </p>
		<div><input id="name" name="name" class="w100" type="name" placeholder="Your Full Name" required="" autocomplete='off' /></div>
		<div><input id="emailId" name="emailId" class="w100" type="email" placeholder="Insert eMail" required="" autocomplete='off' /></div>
		<div><input id="degree" name="degree" class="w100" type="text" placeholder="Your Degree and branch(eg. B.E. CSE)" required="" autocomplete='off' /></div>
		<div><input id="year" name="year" type="text" placeholder="Which Year?" required="" autocomplete='off' /></div>
		<div><select align="center"; id="campus" name="campus" type="text"  required="" autocomplete='off' ><option align="center" value="" disabled selected hidden >Choose your campus</option>
  <option value="CEG">CEG</option>
  <option value="ACT">ACT</option>
  <option value="SAP">SAP</option>
  <option value="MIT">MIT</option></select></div>
		<div><input id="pass1" name="pass1" value="" type="password" placeholder="Insert Password" required="" /></div>
		<div><input id="pass2" name="pass2" value="" type="password" placeholder="Verify Password" required="" /></div>
		<div id="message" name="message" style="color:red;" ></div>
	
		<div><button class="form-btn sx log-in" type="button">Log In</button></div>
		<div><button class="form-btn dx" type="submit">Sign Up</button></div>
	</form> -->
		
	
	 
		
	<form  class="signIn" action="./adminLog" method="post" autocomplete="off">
	
		<p id="h" style="margin-top:90px;margin-bottom:70px;">Welcome</br>Admin !</p>
		
		<input id="email" name="email" type="email" placeholder="Insert username" autocomplete='off' required="" />
		<input id="password" name="password" type="password" placeholder="Insert Password" required="" />
		
		<div id="message" name="message" style="color:red;" ><%! String stat="false"; %> <% String stat = (String) request.getAttribute("stat"); %> 
		<% if(stat=="true"){out.print(request.getAttribute("message"));} %></div> 
		
		<!-- <button class="form-btn sx back" type="button">Sign Up</button> -->
		<div align="center";><button class="form-btn1 dx" type="submit">Log In</button></div>
	</form>
		
</div>

<script>
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);
	
	</script>


</body>
</html>