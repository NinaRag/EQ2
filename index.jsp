<%@ page import ="java.io.*"%>
<%@ page import ="java.io.File.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="art1.StudentInfo"%>
<%@page import="art1.ment"%>


<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="stylesheet" type="text/css" href="style.css?v=1">
<!--<meta name="viewport" content ="width=1000,user-scalable=yes" />-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


<script type="text/javascript">
if ( window.history.replaceState ) {
window.history.replaceState( null, null, window.location.href );
}
$(function() {
$('.wrapper').click(function() {
$('.content').toggleClass('open');
$(this).toggleClass('open');
})

})

$(function() {
$('.wrapper1').click(function() {
$('.content1').toggleClass('open');
$(this).toggleClass('open');
})

})

var load=document.getElementById("loading");
function loadfun(){
load.style.display = 'none';
}

function show(shown, hidden) {
document.getElementById(shown).style.display='block';
document.getElementById(hidden).style.display='none';
return false;
}


function openNav() {
document.getElementById("mySidenav").style.width = "300px";
}

function closeNav() {
document.getElementById("mySidenav").style.width = "0";
}
function turn(){
	var actionStr = "/SuggestAnIdea";  
	document.formName.action = actionStr ;
document.formName.submit();

}


</script>


</head>

<body >
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); %>

<%! String val1; %><% val1= (String) request.getAttribute("val1"); %>
<% if(val1=="true") {%> <script> Swal.fire('Thank you for applying. We will get back to you within 48 hours.'); </script> <% } %>
<%! String stat6="false";%>
<%! String state6="false";%>
<% state6 = "true";session.setAttribute("state6",state6);%>
<header id="header" class="fixed-top d-flex align-items-center">
<div class="container d-flex align-items-center">
<% ArrayList<StudentInfo> stu = (ArrayList<StudentInfo>) session.getAttribute("sti"); %>
<% ArrayList<ment> mtu = (ArrayList<ment>) session.getAttribute("mtu"); %>
<%! String idea; %><% idea = (String) session.getAttribute("idea"); %>
<% String idea1 = idea; %>

<%! String arti; %><% arti = (String) session.getAttribute("arti"); %>
<%! String contact = "false"; %><% contact = (String) request.getAttribute("contact"); %>

<% if(contact=="true") {%> <script>  Swal.fire('Thank you for your message. We will get back to you shortly.'); </script> <% } %>

<div class="logo me-auto">
<h1><a href="index.jsp">EQ CLUB</a></h1>

</div>
<%! String status5; %><% String status5= (String) session.getAttribute("stat5"); %>
<%! String state5; %><% String state5= (String) session.getAttribute("state5"); %>
<nav id="navbar" class="navbar">
<ul>
  <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
  <li><a class="nav-link scrollto" href="<% if (status5!="true"){ stat6 = "true";session.setAttribute("stat6",stat6); %> <%="studentReg.jsp" %> <% } if(status5=="true"){ %> <%="studentdash.jsp" %> <% } %>"><span>Take Psychometric Test</span> </a>
	
  
  <li class="dropdown"><a href="#change"><span>Get Involved</span> <i class="bi bi-chevron-down"></i></a>
	<ul>
	    </li>
<li><a href="#joc">Join Our Community</a></li>
	  <li><a href="#sai">Suggest An Idea</a></li>
	  <li><a href="#pya">Publish Your Article</a> </li>
	</ul>
  </li>
  <li><a class="nav-link scrollto" href="#waw">Workshops and Webinars</a></li>
  <li><a class="nav-link scrollto" href="#au">About Us</a></li>        
  <li><a class="nav-link scrollto" href="#foo">Contact Us</a></li>
 <li class="dropdown"><a href="#" style="display:<% if (status5!="true" || state5!="true"){ %> <%="none" %> <% } if(status5=="true" || state5=="true"){ %> <%="block" %> <% } %>"><span>My account</span> <i class="bi bi-chevron-down"></i></a>
		<ul>
			
	  <li class="nav-link scrollto"><% if(status5=="true"){ for(StudentInfo p : stu){out.println("Hello" +" "+p.getuserName());}} else if(state5=="true"){ for(ment m : mtu){out.println("Hello" +" "+m.getName());}}%></li>
	  <li><a href="<% if (status5=="true"){ %> <%="studentdash.jsp" %> <% } if(state5=="true"){ %> <%="mentordash.jsp" %> <% } %>">My dashboard</a></li>
	  <li><a href="<% if (state5=="true"){ %> <%="/logOut1" %> <% } if(status5=="true"){ %> <%="/logOut" %> <% } %>">Log out</a></li>
	 
	</ul>
  
  </li>
</ul>
<i class="bi bi-list mobile-nav-toggle"></i>
</nav><!-- .navbar -->

</div>
</header><!-- End #header -->

<!-- ======= Hero Section ======= -->
<section id="hero">
<div class="hero-container">
<h1>Welcome to EQ Club </h1>

<h2>Connecting Students And Mentors.....</h2>
<div>
<a href="#start" class="btn-get-started scrollto">Get Started</a>
<a href="<% if (state5!="true"){ %> <%="mentorReg.jsp" %> <% } if(state5=="true"){ %> <%="mentordash.jsp" %> <% } %>" class="btn-get-started scrollto" style="margin-left:80px">I am a mentor</a>
<a href="<% if (status5!="true"){ %> <%="studentReg.jsp" %> <% } if(status5=="true"){ %> <%="studentdash.jsp" %> <% } %>" class="btn-get-started scrollto" style="margin-left:80px">I am a student</a>
</div>
</div>
</section><!-- #hero -->





<div class="row">
<div class="parallax">
<div class="row" align="center" style="margin-top:3vw;">
<div >	
	<h1 id="gi" class="header" style="color:#2A265F;margin-top:30px;font-weight:600;"  >Student Corner</h1>    
</div>
<div class="container" >
<div class="row" >
<div class="cont">
<div  class="container1" style="top:130%;left:5%">
<div class="forky">
<div class="face"></div>
<div class="ear1"></div>
<div class="ear01"></div>
<div class="ear2"></div>
<div class="ear02"></div>
<div class="stripe1"></div>
<div class="stripe2"></div>
<div class="stripe3"></div>
<div class="stripe4"></div>
<div class="stripe5"></div>
<div class="stripe6"></div>
<div class="stripe7"></div>
<div class="stripe8"></div>
<div class="stripe9"></div>
<div class="nose3"></div>
<div class="nose1"></div>
<div class="nose2"></div>
<div class="eye1"></div>
<div class="eye2"></div>
<div class="board1"></div>
<div class="board2"></div>
<div class="border1"></div>
<div class="border2"></div>
<div class="border3"></div>
<div class="border4"></div>
<div class="hand1"></div>
<div class="hand2"></div>
<div class="text-block">
    <p style="font-size:35px;">Psychological Mentoring</p>
    <p style="font-size:20px;">We all have times that we feel low.Some of us will feel<br>
							   better on our own while some of us will feel better if we <br>
							   share our feelings with others. Sometimes we need <br>
							   guidance to get ourselves into the track again. When <br>
							   you feel indecisive or overwhelmed with options and <br>
							   thoughts, you shall use our service. You can choose to<br>
							   text anonymously to get guidance from our expert or<br>
							   request one on one session (free of cost) </p>
					
  </div>
</div>

</div>
</div>
<div id="start" class="cont">
<div  class="container1" style=" top:130%;left:55%">
<div class="forky">
<div class="face"></div>
<div class="ear1"></div>
<div class="ear01"></div>
<div class="ear2"></div>
<div class="ear02"></div>
<div class="stripe1"></div>
<div class="stripe2"></div>
<div class="stripe3"></div>
<div class="stripe4"></div>
<div class="stripe5"></div>
<div class="stripe6"></div>
<div class="stripe7"></div>
<div class="stripe8"></div>
<div class="stripe9"></div>
<div class="nose3"></div>
<div class="nose1"></div>
<div class="nose2"></div>
<div class="eye1"></div>
<div class="eye2"></div>
<div class="board1"></div>
<div class="board2"></div>
<div class="border1"></div>
<div class="border2"></div>
<div class="border3"></div>
<div class="border4"></div>
<div class="hand1"></div>
<div class="hand2"></div>
<div class="text-block">
    <p style="font-size:35px;">Activities and Games</p>
    <p style="font-size:20px;">It will be boring and tiresome to receive advice on<br> 
							   mental well being and it will sound too philosophical<br> 
							   for us sometimes. But we shall gain wisdom and <br>
							   improve our quality of life if we heal and reassess <br>
							   ourselves when we feel low. So what are the ways we <br>
							   could understand ourselves?We have provided <br>
							   some activities and game based tests that could help <br>
							   you. We also encourage you to suggest other activities  <br>
							   that could help students.</p>
					
  </div>
</div>
</div>
</div>
</div>
</div>

</div>	


<div id="change" class="row" align="center" style="margin-top:45vw;">
<div>	
	<h1 id="gi" class="header" style="color:#2A265F;font-weight:600;"  >Get Involved</h1>    
</div>

<div id="joc" class="courses-container" >
<div class="course">
	<div class="course-info">
		<div name="form">     
			<div id="Pagea1" style="margin-top:-20px;">
			<br><br><h2 ><b style="color:#2A265F">Join our community</b></h2>
			<a href="#" onclick="return show('Pagea2','Pagea1');">Join here</a>
				<p> <i> Ten person's one step is greater than one person's ten steps. 
				If you are interested in the topics such as EQ, psychology and have good communication skills, you are welcome to join our community. The main responsibilities will be content creating, website updation, organizing workshops and webinars, getting trained on how to make decisions during some of the common uncertain situations and how to talk with your friends when they feel low. </i>
				</p>	
			</div>

			<div id="Pagea2" style="display:none;margin-top:10px;">
			<a href="#" onclick="return show('Pagea1','Pagea2');" align="center">Back</a>
				<div >
				<div><a  class="btn btn-secondary-outline btn-lg" href="<% if (state5!="true"){ %> <%="mentorReg.jsp" %> <% } if(state5=="true"){ %> <%="mentordash.jsp" %> <% } %>" style = "margin-top:29px;color:white;background-color:#2A265F;"><div>Register As Mentor</div></a></div>
				<div><a  class="btn btn-secondary-outline btn-lg" href="<% if (status5!="true"){ %> <%="studentReg.jsp" %> <% } if(status5=="true"){ %> <%="studentdash.jsp" %> <% } %>" style = "margin-top:29px;color:white;background-color:#2A265F;"><div>Register As Student</div></a></div>
				</div>
			</div>
		</div>
	</div>
	<div class="course-preview">
		<img src="gi4.png" style="height:200px;">
	</div>
</div>
</div>


<div id="sai" class="courses-container" >
<div class="course">
	<div class="course-preview" style="padding-left:20px;">
		<img src="gi1.png" style="height:200px;">
	</div>
	
	<div class="course-info">
		<div name="form">     
			<div id="Pageb1">
			<br><br><h2><b style="color:#2A265F">Suggest an idea</b></h2>
			<a href="#" onclick="return show('Pageb2','Pageb1');">Suggest here</a>
				<p><i>The ideas are not effective unless they are implemented.
				If you have any new idea or suggestion for doing an innovative session or activity which could help our CEGians, kindly share with us. If your idea is creative enough, you will be rewarded and that idea will be implemented effectively
				</i></p>	
			</div>

			<div id="Pageb2" style="display:none">
			
			<a href="#" onclick="return show('Pageb1','Pageb2');" align="center">Back</a>
				<div >
				<h4 style="margin-top:5px;color:#2A265F;margin-bottom:6%;">Login To Suggest an idea</h2>
				<div><a  class="btn btn-secondary-outline btn-lg" href="<% if (state5!="true"){ %> <%="mentorReg.jsp" %> <% } if(state5=="true"){ %> <%="mentordash.jsp" %> <% } %>" style = "color:white;background-color:#2A265F;"><div>Register As Mentor</div></a></div>
				<div><a  class="btn btn-secondary-outline btn-lg" href="<% if (status5!="true"){ %> <%="studentReg.jsp" %> <% } if(status5=="true"){ %> <%="studentdash.jsp" %> <% } %>" style = "margin-top:29px;color:white;background-color:#2A265F;"><div>Register As Student</div></a></div>
				</div>
			</div>
			
		</div>
	</div>
</div>
<% if(idea=="true") {%> <script> Swal.fire('Thank you for suggesting an idea. We will try to implement this.'); </script> <% session.removeAttribute("idea");} %>
</div>

<div id="pya" class="courses-container" >
<div class="course">
	<div class="course-info">
		<div name="form">     
			<div id="Pagec1">
			<br><br><h2><b style="color:#2A265F">Publish your article</b></h2>
			<a href="#" onclick="return show('Pagec2','Pagec1');">Publish here</a>
			<p> <i> If you are interested in writing articles on psychology/emotional intelligence/behavorial neuroscience,
			kindly provide the drive link to access your article. After going through the review process, we will publish your article in the blog section.</i>
				</p>
					
			</div>

			<div id="Pagec2" style="display:none">
			<a href="#" onclick="return show('Pagec1','Pagec2');" align="center">Back</a>
				<div >
				<h4 style="margin-top:5px;color:#2A265F;margin-bottom:6%;">Login To Publish an article</h2>
				<div><a  class="btn btn-secondary-outline btn-lg" href="<% if (state5!="true"){ %> <%="mentorReg.jsp" %> <% } if(state5=="true"){ %> <%="mentordash.jsp" %> <% } %>" style = "color:white;background-color:#2A265F;"><div>Register As Mentor</div></a></div>
				<div><a  class="btn btn-secondary-outline btn-lg" href="<% if (status5!="true"){ %> <%="studentReg.jsp" %> <% } if(status5=="true"){ %> <%="studentdash.jsp" %> <% } %>" style = "margin-top:29px;color:white;background-color:#2A265F;"><div>Register As Student</div></a></div>
				</div>
			</div>
		</div>
	</div>
	<div class="course-preview" style="padding-left:0px;">
		<img src="gi5.png" style="height:200px;">
	</div>
</div>
<% if(arti=="true") {%> <script>  Swal.fire('Thank you for contributing. We will get back to you shortly.'); </script> <% session.removeAttribute("arti");} %>
</div>

</div>


<div id="waw" class="row" align="center" style="height:450px;margin-top:30px;margin-bottom:50px;" >
<div>	
	<h1 id="gi" class="header" style="color:#2A265F;font-weight:600;"  >Workshops and Webinars</h1>    
</div>
<div class="row">

<div class="col-md-6" >
                <img src="bg1.gif" style="height:250px;width:500px;border: 5px solid #2A265F;">
            
            
                       
        </div>

        <div class="col-md-6" style="display:inline block;" >
				
            
                <h2 style="margin-top:20px;">Coming soon..</h2>
                <p><i>Workshops and webinars are based on brain rewiring and self awareness. Some sessions will be conducted as one-one session where the expert could guide you personally and 
				help in making decisions.</i></p>
            
        </div>
      </div>
	  </div>


	
<div id="au" class="row" align="center" style="height:550px;margin-top:30px;margin-bottom:200px;" >
<div>	
	<h1 id="gi" class="header" style="color:#2A265F;font-weight:600;"  >About Us</h1>    
</div>

	<div class="card" style="top:55%;left:30%">
            <div class="imgBx">
                <img src="au4.png">
            </div>
            <div class="details">
                <h2>What we do?</h2>
                <p><i>Give platform to find the perfect solution to any problem of the student by connecting the student with the appropriate mentor to guide them. This is achieved by utilizing our vast alumni network.✨

Organize Lectures on Emotional Intelligence, life hacks, Brain hacking, Stress handling, How to learn, what to learn, mental health, Psychology and much more.✨

Train students to counsel and enable them to  counsel their fellow CEGians.

The most important part is *We listen*.♥️</i></p>
            </div>
                       
        </div>

        <div class="card" style=" top:55%;left:40%">
				<div class="imgBx">
                <img src="au4.png">
            </div>
            <div class="details">
                <h2>How will you be benefited?</h2>
                <p><i>It will be boring and tiresome to receive advice on mental well being and it will sound too philosophical for us sometimes. But we shall gain wisdom and improve our quality of life if we heal ourselves and reassess ourselves when we feel low. So what are the ways we could understand ourselves? How shall we gain insights into our mental well being, not going deeper into the philosophical and psychological aspects? 
We have provided some activities and game based tests that could help you.</i></p>
            </div>
        </div>
      </div>
  <!-- <div>
   <h3 style="float:left;margin-left:380px;font-style:normal;font-family:cursive;">What we do</h3>
   <h3 style="float:right;margin-right:300px;font-style:normal;font-family:cursive;">How will you be benefited</h3>
   </div>
   
   <div class="card" style="float:left;margin-left:30%;margin-top:200px;">
        <div class="card-front" style="background-image: url(EQ2.png);"></div>
        <div class="card-back" style="padding-top:30px;font-family:blackboard;">
            <i>Give platform to find the perfect solution to any problem of the student by connecting the student with the appropriate mentor to guide them. This is achieved by utilizing our vast alumni network.✨

Organize Lectures on Emotional Intelligence, life hacks, Brain hacking, Stress handling, How to learn, what to learn, mental health, Psychology and much more.✨

Train students to counsel and enable them to  counsel their fellow CEGians.

The most important part is *We listen*.♥️ </i>
        </div>
        </div>
		</div>-->
    
        

</div>
</div>
<!--<div class="footer" style="background-color:#2A265F; position: relative;height: 200px;">
<div style="float:right;height:100%;border-color:gray;"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3887.3880121985203!2d80.23325751445721!3d13.010945217534912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a52679f0d20f797%3A0x59f9f10c66e02a19!2sCollege%20of%20Engineering%2C%20Guindy!5e0!3m2!1sen!2sjp!4v1626245174034!5m2!1sen!2sjp" width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>
<p style="font-size:20px;line-height:30px;margin-left:20%;color:white;"><br><br>College of engineering guindy,<br>12,Sadar patel road,Guindy,<br>Chennai,600025</p>

<div id="cu" name="form" style="margin-left:50%; margin-top:-5%;position: relative;">     
			<div id="Paged1" style="margin-top:0px;">
			<a class="button" href="#" onclick="return show('Paged2','Paged1');"><div>Contact Us</div></a>		
			</div>

			<div id="Paged2" style="width:50%;height:50px;display:none;">
			<a href="#" onclick="return show('Paged1','Paged2');" align="center">Back</a>
				<div class="formDesign">
				<form action="./ContactUs" method="post" autocomplete="off";>
				<h2 style="margin-left:35%;margin-bottom:10%;">CONTACT US</h2>
				<label for="emailId">EMAIL ID <em>&#x2a;</em></label>
				<input id="emailId" name="emailId" required="" type="email" />
				<label for="Message">YOUR MESSAGE <em>&#x2a;</em></label>
				<textarea id="Message" name="Message" required="" rows="2"></textarea>
				<button id="submit">SEND</button>
				</form>
				</div>
			</div>
</div>
</div>-->
<footer id="foo" class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5><i class="fa fa-road"></i> EQ CLUB</h5>
                <div class="row">
                    <div class="col-7">
                        <ul class="list-unstyled">
                            <li><a href="">About Us</a></li>
                            <li><a href="">Workshops</a></li>
                            <li><a href="">Blog</a></li>
                            <li><a href="">Join us</a></li>
                        </ul>
                    </div>
                    
                </div>
                <ul class="nav">
                    <li class="nav-item"><a href="" class="nav-link pl-0"><i class="fa fa-facebook fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-twitter fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-github fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-instagram fa-lg"></i></a></li>
                </ul>
                <br>
            </div>
			<div class="col-md-4">
			<h5><i class="fa fa-road"></i> LOCATION</h5>
                       <div class="row">
                    <div class="col-7">
                        <ul class="list-unstyled">
                            <li>EQ CLUB, College Of Engineering Guindy,</li>
                            <li>Anna University, 600025</li>
                            <li>eqclub.ceg@gmail.com</li>
                        </ul>
						</div>
                    
                </div>
				<br>
				<br>
				<ul class="list-unstyled">
                    <li > Copyright 2021 EqClub. All Rights Reserved.</li>
                    <li style="margin-left:75px;">Designed by <a href="https://github.com/SalaiVaishnavi">EQ Club</a></li>
                    
                </ul>
                    </div>
					
            <div class="col-md-4">
                
            
                <div id="cu" name="form" style="position: relative;">     
			<div id="Paged1" style="margin-top:0px;">
			                        <a  class="btn btn-secondary-outline btn-lg" href="#" onclick="return show('Paged2','Paged1');" style = "color:white;background-color:gray;"><div>Contact Us</div></a>		
			</div>

			<div id="Paged2" style="width:70%;height:50px;display:none;">
			<a href="#" onclick="return show('Paged1','Paged2');" align="center">Back</a>
				<div>
				<form id="form" class="topBefore" action="./ContactUs" method="post" autocomplete="off";>
		
		  <input id="username" name="username" type="text" required="" placeholder="NAME">
		  <input id="emailId" name="emailId" type="text" required="" placeholder="E-MAIL">
		  <textarea id="Message" name="Message" type="text" required="" placeholder="MESSAGE"></textarea>
  <input id="submit" type="submit" value="GO!">
  
</form>

				</div>
			</div>
            </div>
			</div>
        </div>
    </div>
	
</footer>
<script src="Amoeba/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="Amoeba/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="Amoeba/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="Amoeba/assets/vendor/php-email-form/validate.js"></script>
  <script src="Amoeba/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="Amoeba/assets/js/main.js"></script>
</body>	
</html>
