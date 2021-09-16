<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">



<title>EQ CLUB</title>
<meta content="" name="description">
<meta content="" name="keywords">
<link href="/asset/favicon.png" rel="icon">
<link href="/asset/favicon.png" rel="apple-touch-icon">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Lato:400,300,700,900" rel="stylesheet">
<link href="http://fonts.cdnfonts.com/css/blackboard" rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="Amoeba/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Amoeba/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="Amoeba/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="Amoeba/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Template Main CSS File -->
<link rel="stylesheet" type="text/css" href="/css/style.css?v=12">
<link
     rel="stylesheet"
     href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"
   />
<!--<meta name="viewport" content ="width=1000,user-scalable=yes" />-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
 <script src="http://code.jquery.com/jquery-1.10.2.js"
        type="text/javascript"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="js/app-ajax.js" type="text/javascript"></script>
</head>
<body class="body1">
<script>
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, "mentorReg.jsp" );
}
</script>
<div class="container2">
	<%! String flag1 = "false"; %><% flag1 = (String) request.getAttribute("flag1"); %>

	<div style="margin-top:-20px;margin-left:170px;margin-bottom:20px;"><div class="logo me-auto">
<h1 style="font-size:240%;"><a href="index.jsp" style="text-decoration: none;color: #2A2965">EQ CLUB</a></h1></div></div>
		<% String state6= (String) session.getAttribute("state6"); %>
		<% String staty6= (String) request.getAttribute("state6"); %>
	<form  class="signUp"  action="./mentorReg" onsubmit="calli();return false;"  method="post" autocomplete="off">
		<h3 style="margin-top:15px;">Apply To Become Mentor</h3>
		<p style="margin-top:15px;">Please fill in the details
		</p>
		<div id="message" name="message" style="color:red;" ><%! String stat="false"; %> <% String stat = (String) request.getAttribute("stat"); %> 
		<% if(stat=="true"){out.print(request.getAttribute("message"));} %></div>
		<div class="scroll">
		<div><input id="name" name="name" class="w100" type="name" placeholder="Your Full Name" required="" autocomplete='off' /></div>
		<div><input id="emailId" name="emailId" class="w100" type="email" placeholder="Insert eMail" required="" autocomplete='off' /></div>
		<div><input id="place" name="place" class="w100" type="text" placeholder="Place of Residence" required="" autocomplete='off' /></div>
		<div style="margin-top:-5px;margin-bottom:15px;display:block;"><input id="phone" name="phone" class="w100" type="tel" placeholder="Contact no" required="" autocomplete='off' style="width:410px;" /></div>
		<div><input id="qual" name="qual" class="w100" type="text" placeholder="Your Qualification" required="" autocomplete='off' /></div>
		<div><input id="aff" name="aff" class="w100" type="text" placeholder="Affliation" required="" autocomplete='off' /></div>
		
		<div><textarea name="em" id="em" rows="2" cols="33" placeholder="Why do you think emotional intelligence is important?" required></textarea></div>
		<div><textarea name="your" id="your" rows="2" cols="33" placeholder="Please tell us about yourself" required></textarea></div>
		<div><textarea name="ment" id="ment" rows="2" cols="33" placeholder="What are the ways do you want to help your mentee?"required></textarea></div>
		<div><textarea name="emp" id="emp" rows="2" cols="33" placeholder="What are the ways do you think to increase empathy among students?" required></textarea></div>

		<div style="display:none;"><input id="phone1" name="phone1" value=""/></div>
		
		
		</div>
		<button class="form-btn sx log-in" type="button">Log In</button>
		<button class="form-btn dx" type="submit">Apply</button>
		
	</form>
		
	
	 
		<% if(flag1=="true") {%> <script>  Swal.fire('Your password has been changed succesfully. Kindly login with the new password'); </script> <% } %>
	<form   class="signIn" action="./mentLog" method="post" autocomplete="off">
	
		<p id="h" style="margin-top:90px;margin-bottom:70px;">Welcome</br>Back !</p>
		
		<input id="email" name="email" type="email" placeholder="Insert eMail" autocomplete='off' required="" />
		<input id="password" name="password" type="password" placeholder="Insert Password" required="" />
		
		<div id="message1" name="message1" style="color:red;" ><%! String state4="false"; %> <% String state4 = (String) session.getAttribute("state4"); %> <%! String state1="false"; %> <% String state1 = (String) request.getAttribute("state1"); %> 
		<% if(state1=="true"){out.print(request.getAttribute("messag1"));} %></div>
		
		<button class="form-btn sx back" type="button">Apply</button>
		<button class="form-btn dx" type="submit" >Log In</button>
	</form>
		
</div>

<script>
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
$('textarea').on('keyup', function (e) {
  if (e.keyCode === 27) {
    $(this).val('');
  }
});
function getIp(callback) {
 fetch('https://ipinfo.io?token=ebdf95eb57f4fb', { headers: { 'Accept': 'application/json' }})
   .then((resp) => resp.json())
   .catch(() => {
     return {
       country: 'us',
     };
   })
   .then((resp) => callback(resp.country));
}
      // Handle international prefixes, format phone input field
      // Uses intl-tel-input plugin
      const phoneInputField = document.querySelector("#phone");
      const phoneInput = window.intlTelInput(phoneInputField, {
		  preferredCountries: ["us", "fr", "in", "de"],
 initialCountry: "auto",
 geoIpLookup: getIp,

 utilsScript:
   "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
});

function calli(){
	
const phoneNumber = phoneInput.getNumber();
 JSON.stringify(phoneNumber);
	document.getElementById("phone1").value= phoneNumber;
	var phone2 = document.getElementById("phone1").value
	
	var actionStr = "/mentorReg?" +name +emailId+place+phone1+qual+aff+em+your+ment+emp;  
	document.formName.action = actionStr ;
document.formName.submit();


}
	
	



      const info = document.querySelector(".alert-info");
      const error = document.querySelector(".alert-error");

      function process(event) {
        event.preventDefault();
		
		
        
        info.style.display = "none";
        error.style.display = "none";

       
		
        

        
        if (phoneInput.isValidNumber()) {
         info.style.display = "";
           info.innerHTML = 'Phone number in E.164 format: <strong>${phoneNumber}</strong>'
         } else {
           error.style.display = "";
           error.innerHTML = `Invalid phone number.`
         }
      }
	  
		

      const form = document.getElementById("message");
      form.addEventListener("submit", process);

        
        

function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);
	$(".log-in").click(function(){
	$(".signIn").addClass("active-dx");
	$(".signUp").addClass("inactive-sx");
	$(".signUp").removeClass("active-sx");
	$(".signIn").removeClass("inactive-dx");
});

$(".back").click(function(){
	$(".signUp").addClass("active-sx");
	$(".signIn").addClass("inactive-dx");
	$(".signIn").removeClass("active-dx");
	$(".signUp").removeClass("inactive-sx");
});
<% if((state6=="true" ||staty6 =="true") && stat!="true"){ %> $(".signIn").addClass("active-dx");
	$(".signUp").addClass("inactive-sx");
	$(".signUp").removeClass("active-sx");
	$(".signIn").removeClass("inactive-dx");
	
	
 <% } %>


	</script>


</body>
</html>
