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
<link href="Amoeba/assets/vendor/bootstrap-icosns/bootstrap-icons.css" rel="stylesheet">
<link href="Amoeba/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="Amoeba/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Template Main CSS File -->
<link rel="stylesheet" type="text/css" href="/css/style.css?v=12">
<!--<meta name="viewport" content ="width=1000,user-scalable=yes" />-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
 <script src="http://code.jquery.com/jquery-1.10.2.js"
        type="text/javascript"></script>
    <script src="js/app-ajax.js" type="text/javascript"></script>
</head>
<body align="center" class="body1">
<div class="container2">
	
	
	
	<form class="signUp"  action="./studentLogin1" onsubmit="passCheck();return false;" method="post" autocomplete="off">
		<h3>Insert the Passcode</h3>
		<p>Please enter the passcode</br>
that has been sent to your mail.</p>
		 <input class="w100" id="passcode" name="passcode" value="" type="password" placeholder="Insert Passcode" required="" />
		 
		 <input id="passwd" value="<%=request.getAttribute("passwd") %>" name="passwd" style="display:none;">
		 <input id="emailId" value="<%=request.getAttribute("emailId")%>" name="emailId" style="display:none;">
		 <input id="name" value="<%=request.getAttribute("name")%>" name="name" style="display:none;">
		 <input id="degree" value="<%=request.getAttribute("degree")%>" name="degree" style="display:none;">
		 <input id="campus" value="<%=request.getAttribute("campus")%>" name="campus" style="display:none;">
		 <input id="year" value="<%=request.getAttribute("year")%>" name="year" style="display:none;">
		 <input id="pass1" value="<%=request.getAttribute("pass1")%>" name="pass1" style="display:none;">
		 
		 <div id="message1" name="message1" style="color:red;" ></div>
		<div id="message" name="message" style="color:red;" ><%! String stat="false"; %> <% String stat = (String) request.getAttribute("stat"); %> 
		<% if(stat=="true"){out.print(request.getAttribute("message"));} %></div>
		<button class="form-btn sx back1" type="button">Back</button>
		<button class="form-btn dx" type="submit">Sign Up</button>
	</form>
	
	
</div>

<script>
function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);	
if ( window.history.replaceState ) {
window.history.replaceState( null, null, window.location.href );
}
$(".back1").click(function(){
	
	window.location.replace("studentReg.jsp");
});

function passCheck(){
 var pass1 = document.getElementById("passcode").value;
 var pass2 = document.getElementById("passwd").value;


 if(pass1!=pass2){
		document.getElementById("message1").innerHTML = "Passcode doesn't match";
		
}

	
	else{
	
var actionStr = "/studentLogin1";  
	document.formName.action = actionStr ;
document.formName.submit();
	
	}
	}
	</script>


</body>
</html>
