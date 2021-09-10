<%@ page import ="java.io.*"%>
<%@ page import ="java.io.File.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="art1.StudentInfo"%>


<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>DashBoard</title>

<link rel="stylesheet" type="text/css" href="stud1.css?v=1" >

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css">

</head>
<body class="alt-grid" onload="noBack();" >



 
<% String status5 = (String) session.getAttribute("stat5"); %>
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
	   <%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
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
                        <img src="avatar.png" alt="">
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
					<a href="#" onclick="showCon('cont');"  style="text-decoration:none;" ><ion-icon name="pencil-outline" style="padding-right:18px;padding-top:5px;"></ion-icon>Take tests</a>
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
	<h2 align="center"> Mentor </h2>
	<p> </p>
	</div>
	<div id="cont2" class="cont" align="center" style="display:none">
	<h2 align="center"> Query/idea submission </h2>
	<p> If you have any idea on how we can improve the club activity and also any query that you want us to ask or know, kindly let us know. We shall get back to you shortly.</p>
	</div>
	
	<div id="cont3" class="cont" align="center" style="display:none">
	<h2 align="center"> Articles Published </h2>
	<p> <% for(StudentInfo p : stu){if(p.articles.size()!=0){out.println(p.articles);}else { %> <h2 style="color:lightgray;font-size:35px;margin-top:160px;">You have not published any articles yet.</h2><% }}%></p>
	</div>
	<div id="cont4" class="cont" align="center" style="display:none">
	<h2 align="center"> Workshops scheduled  </h2>
	<p> <% for(StudentInfo p : stu){if(p.work.size()!=0){out.println(p.work);}else { %> <h2 style="color:lightgray;font-size:35px;margin-top:160px;">You have not registered for any workshops yet.</h2> <% }} %> </p>
	</div>
	<div id="cont5" class="cont" align="center" style="display:none">
	<h2 align="center"> Your mentor </h2>
	<p> <% for(StudentInfo p : stu){if(p.mentorName!=null){out.println(p.mentorName);}else { %> <h2 style="color:lightgray;font-size:35px;margin-top:160px;">You have not been assigned any mentor.</h2> <%}}%></p>
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
	</div>
	</div>
				</div>
				
</div>

</body>
</html>
