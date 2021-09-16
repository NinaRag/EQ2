<%@ page import ="java.io.*"%>
<%@ page import ="java.io.File.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="art1.StudentInfo"%>
<%@page import="art1.menty"%>


<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" class="html2">

<head>



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>DashBoard</title>

<link rel="stylesheet" type="text/css" href="/css/style.css?v=13" >

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css">

</head>
<body id="body2" class="alt-grid" onload="noBack();" >



 
<% String status5 = (String) session.getAttribute("stat5"); %>
<%! String idea; %><% idea = (String) session.getAttribute("idea"); %>
<%! String arti; %><% arti = (String) session.getAttribute("arti"); %>
<script>

var divs = ["cont", "cont1", "cont2", "cont3","cont4", "cont5", "cont6"];
    var visibleDivId = null;
	
	
	
    function showCon(divId) {
      if(visibleDivId === divId) {
        visibleDivId = divId;
      } else {
        visibleDivId = divId;
      }
      hideNonVisibleDivs();
    }
    function hideNonVisibleDivs() {
      var i, divId, div;
      for(i = 0; i < divs.length; i++) {
        divId = divs[i];
        div = document.getElementById(divId);
        if(visibleDivId === divId) {
          div.style.display = "block";
        } else {
          div.style.display = "none";
        }
      }
    }
	</script>
	
	   <% ArrayList<StudentInfo> stu = (ArrayList<StudentInfo>) session.getAttribute("sti"); %>
	   <% ArrayList<menty> mty = (ArrayList<menty>) session.getAttribute("mty"); %>
	   <%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<script>
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, "studentdash.jsp" );
}
</script>
<div class="container-fluid " style="width:100%;">
   <div class="row" style="width:100%";>
      <div class="col-md-12"  >
         <div id="content" class="content content-full-width" >
            <!-- begin profile -->
            <div class="profile" >
               <div class="profile-header">
                  <!-- BEGIN profile-header-cover -->
                  <div class="profile-header-cover"></div>
                  <!-- END profile-header-cover -->
                  <!-- BEGIN profile-header-content -->
                  <div class="profile-header-content">
                     <!-- BEGIN profile-header-img -->
                     <div class="profile-header-img">
                        <img src="/asset/avatar.png" alt="">
                     </div>
                     <!-- END profile-header-img -->
                     <!-- BEGIN profile-header-info -->
                     <div class="profile-header-info">
                        <p style="font-size:26px;"><% for(StudentInfo p : stu){out.println(p.userName);}%>
						<br>
						<p style="font-size:20px;color:#fff;">Mentee</p></p>
         <!--               <a href="#" class="btn btn-sm btn-info mb-2">Edit Profile</a>-->
                     </div>
                     <!-- END profile-header-info -->
                  </div>
                  <!-- END profile-header-content -->
                  <!-- BEGIN profile-header-tab -->
                  
                  <!-- END profile-header-tab -->
               </div>
            </div>
			
            <!-- end profile -->
            <!-- begin profile-content -->
           
         </div>
      </div>
   </div>

   <div class="parent" style="overflow:auto;">
   <div class="sidenav">
					<a href="#" onclick="showCon('cont6');" style="text-decoration:none;" ><ion-icon name="person-outline" style="padding-right:5px;padding-bottom:0px;"></ion-icon>Profile</a>
					<a href="#" onclick="showCon('cont5');"style="text-decoration:none;" ><ion-icon name="people-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Mentor</a>
					<a href="#" onclick="showCon('cont4');" style="text-decoration:none;" ><ion-icon name="build-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Workshops</a>
					<a href="#" onclick="showCon('cont3');" style="text-decoration:none;" ><ion-icon name="book-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Articles</a>
					<a href="#" onclick="showCon('cont2');" style="text-decoration:none;" ><ion-icon name="book-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Query/idea</a>
					<a href="#" onclick="showCon('cont1');" style="text-decoration:none;" ><ion-icon name="book-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Mentor Feedback form</a>
					<a href="#" onclick="showCon('cont');"  style="text-decoration:none;" ><ion-icon name="pencil-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Take tests</a>
					<a href="index.jsp" style="text-decoration:none;" ><ion-icon name="home-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Home Page</a>
				</div>
	<div id="cont" class="cont" align="center" style="display:none" >
	<h2  align="center"> Psychometric Test </h2>
	<p id="al"> </p>
	<div class="table-responsive">
	<table align="center" class="table table-hover table-borderless " style="margin-top:55px;width:70%;font-size:20px;">
	<thead>
		<th scope="column"> Tests </th>
		<th scope="column"> Status </th>
		<th scope="column"> Result </th>
		</thead>
    <tbody>
		<% String quiz1 = (String) session.getAttribute("quiz1");%>
	<% String quiz2 = (String) session.getAttribute("quiz2");%>
	<% String mentor = (String) session.getAttribute("mentor");%>
	    <tr class='borderless'>
       <td>Psychometric Test 1 - Activity</td>
	   <td> <% if(quiz1=="true"){out.println("Taken");}else{out.println("not taken");}%></td>
       <td><% if(quiz1=="true"){ for(StudentInfo p : stu) {out.println(p.activityScore);}}else{ %> <a href="quiz.html" style="text-decoration:none;text-color:pink;"> Take Quiz 1 </a><%}%></td>
	  
     </tr>
    <tr class='borderless'>
      <td>Psychometric Test 2 - Self Esteem</td>
      <td> <% if(quiz2=="true"){out.println("Taken");}else{out.println("not taken");}%></td>
       <td><% if(quiz2=="true"){ for(StudentInfo p : stu) {out.println(p.getselfEsteemScore());}}else{ %> <a href="quiz1.html" style="text-decoration:none;"> Take Quiz 2 </a><%}%></td>
     </tr>
   
  </tbody>
</table>
	</div>
				</div>
	<div id="cont1" class="cont" align="center" style="display:none">
	<h2 align="center"> Mentor feedback form </h2>
	<p> Kindly give your feedback on your assigned mentor. Your feedback won't be shared with your mentor. Your feedback will be helpful for us to track </br> the performance of the mentors. Do find your mentor helpful and reliable? Do you want us to assign a different mentor for you </br> If we have a mentor who matches your requirements, we could assign accordingly.</p>
	<div>
	<p><% for(StudentInfo p : stu){if(p.mentorName!=null){%>
	<form  class="signIn" action="./mentorFeed" method="post" autocomplete="off">
	
		<div><textarea name="q1" id="q1" rows="2" cols="33" placeholder="How often does your mentor schedule meeting with you?" required></textarea></div>
		<div><textarea name="q2" id="q2" rows="2" cols="33" placeholder="What did/do you expect from your mentor?" required></textarea></div>
		<div><textarea name="q3" id="q3" rows="2" cols="33" placeholder="Does your mentor meet your requirements?" required></textarea></div>
		<div><textarea name="q4" id="q4" rows="2" cols="33" placeholder="Do you find your mentor friendly and reliable?" required></textarea></div>
		<div><textarea name="q5" id="q5" rows="2" cols="33" placeholder="Do you want a different mentor?" required></textarea></div>
		<div><textarea name="q6" id="q6" rows="2" cols="33" placeholder="If yes, what are your requirements (place, education and affiliation)?" ></textarea></div>
		<div><textarea name="q7" id="q7" rows="2" cols="33" placeholder="If yes, Do you want to see the mentor list? We could mail it to you if you want?" ></textarea></div>
		<div><textarea name="q8" id="q8" rows="2" cols="33" placeholder="Does the current method of matching mentors satisfactory to you or do you want to choose your mentor?" required></textarea></div>
		<div><textarea name="rate" id="rate" rows="2" cols="33" placeholder="Rate your mentor (1-5)" required ></textarea></div>
		<div><textarea name="q9" id="q9" rows="2" cols="33" placeholder="Other comments, if any?" ></textarea></div>
		
		<div align="center";><button class="form-btn dx" type="submit">Submit</button></div>
	</form>
	<% } else { %> <h2 style="color:lightgray;font-size:35px;margin-top:160px;">You have not been assigned any mentor.</h2> <%}}%></p>
	</div>
	</div>
	<div id="cont2" class="cont" align="center" style="display:none">
	<h2 align="center"> Query/idea submission </h2>
	<p align="center" > If you have any idea on how we can improve the club activity and also any query that you want us to ask or know, kindly let us know. </br>
	Do you find the current method of matching mentors and students? Do you find the workshops useful?</br> How about the quality of the blog? Do you want us to add any new features? </p>
	<div class="formDesign">
	<form align="center" style="margin-top:40px;" action="SuggestAnIdea" method="post" autocomplete="off";>
				
				<textarea align="center" id="idea" name="idea" required="" rows="4" required></textarea>
				<button class="btn1" type="submit" id="submit" style="margin-top:5%;">SEND</button>
				</form>
				</div>
	</div>
	
	<div id="cont3" class="cont" align="center" style="display:none">
	<h2 align="center"> Articles Published </h2>
	<p> <% for(StudentInfo p : stu){if(p.articles.size()!=0){out.println(p.articles);}else { %> <h2 style="color:lightgray;font-size:35px;margin-top:160px;">You have not published any articles yet.</h2><% }}%></p>
	<div class="formDesign">
	<form align="center" style="margin-top:40px;" action="./PublishArticle" method="post" autocomplete="off";>
				<h5 align="center" style="color:#2A265F;">PUBLISH YOUR ARTICLE</h2>
				
				<label for="articleName">NAME OF YOUR ARTICLE <em>&#x2a;</em></label>
				<input align="center" id="articleName" name="articleName" required="" type="text" />
				<label for="article">YOUR ARTICLE <em>&#x2a;</em></label>
				<input align="center" type="url" id="article" name="article">
				<!--<input id="article" name="article" required="" type="file" />-->
				<button class="btn1" id="submit" type="submit" style="margin-top:5%;">UPLOAD</button>
				</form>
				</div>
	</div>
	<div id="cont4" class="cont" align="center" style="display:none">
	<h2 align="center"> Workshops scheduled  </h2>
	<p> <% for(StudentInfo p : stu){if(p.work.size()!=0){out.println(p.work);}else { %> <h2 style="color:lightgray;font-size:35px;margin-top:160px;">You have not registered for any workshops yet.</h2> <% }} %> </p>
	</div>
	<div id="cont5" class="cont" align="center" style="display:none">
	<h2 align="center"> Your mentor </h2>
	<p> <% for(StudentInfo p : stu){ if(p.mentorName!=null){%>
	<div class="table-responsive">
	<table align="left" class="table table-hover table-borderless " style="margin-top:55px;width:50%;">
	<thead>
		
		<th scope="column"> Name </th>
		<th scope="column"> Email Id </th>
		
		<th scope="column"> Place</th>
		<th scope="column"> Contact </th>
		<th scope="column"> Qualification </th>
		
		<th scope="column"> Affiliation</th>
		</thead>
		<tbody>
		
		<% for (menty m : mty){ %>
		<tr>
			<td><% out.println(m.getName()); %></td>
			<td><% out.println(m.getemailId()); %></td>
			<td><% out.println(m.getplace()); %></td>
			<td><% out.println(m.getcontact()); %></td>
			<td><% out.println(m.getqualification()); %></td>
			
			<td><% out.println(m.getaffiliation()); %></td>
			
		</tr>
		<% } %>
		</tbody>
		</table>
		</div>
	<% } else { %> <h2 style="color:lightgray;font-size:35px;margin-top:160px;">You have not been assigned any mentor.</h2> <%}}%></p>
	</div>
	
	<div id="cont6" class="cont" align="center" >
	<h2 align="center"> Personal Details </h2>
	<div class="table-responsive">
	<table align="center" class="table table-hover table-borderless " style="margin-top:55px;width:50%;">
    <tbody>

    <tr class='borderless'>
       <th >Name</th>
      <td><% for(StudentInfo p : stu){out.println(p.getuserName());}%></td>
     </tr>
    <tr class='borderless'>
      <th style="width: 65%;">Email Id</th>
      <td ><% for(StudentInfo p : stu){out.println(p.getemailId());}%></td>
     </tr>
    <tr class='borderless'>
       <th style="width: 65%;">College Campus</th>
      <td><% for(StudentInfo p : stu){out.println(p.getcampus());}%></td>
     </tr>
	 <tr class='borderless'>
       <th >Branch</th>
      <td><% for(StudentInfo p : stu){out.println(p.getdegree());}%></td>
     </tr>
	  <tr class='borderless'>
       <th >Year</th>
      <td><% for(StudentInfo p : stu){out.println(p.getyear());}%></td>
     </tr>
  </tbody>
</table>
<div align="center"><form action="change1.jsp" method="post"><button style="background-color:#2a2965;color:white;" class="btn" id="value1" name="value1" type="submit">Change Password</button></form></div>
	</div>
	</div>
				</div>
				
</div>

<% if(idea=="true") {%> <script> Swal.fire('Thank you for suggesting an idea. We will try to implement this.'); </script> <% session.removeAttribute("idea");} %>
<% if(arti=="true") {%> <script>  Swal.fire('Thank you for contributing. We will publish your article in our blog after reviewing it.'); </script> <% session.removeAttribute("arti");} %>

</body>
</html>
