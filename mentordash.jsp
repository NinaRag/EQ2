<%@ page import ="java.io.*"%>
<%@ page import ="java.io.File.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="art1.ment"%>
<%@page import="art1.stud"%>


<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>DashBoard</title>

<link rel="stylesheet" type="text/css" href="stud1.css?v=2" >

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css">

</head>
<body class="alt-grid" onload="noBack();" >



 
<% String state5 = (String) session.getAttribute("state5"); %>
<script>

var divs = ["cont", "cont1", "cont3", "cont4"];
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
	    <% ArrayList<stud> sti ;%>
	    <% sti = new ArrayList<stud>() ;%>
	   <% ArrayList<ment> mtu = (ArrayList<ment>) session.getAttribute("mtu"); %>
	   
	   <%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>

   <%! String flag3 = "false"; %><% flag3 = (String) session.getAttribute("flag3"); %>
   <%! String flag4 = "false"; %><% flag4 = (String) session.getAttribute("flag4"); %>
   
  
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
                        <p style="font-size:26px;"><% for(ment m : mtu){out.println(m.getName());}%>
						<br>
						<p style="font-size:20px;color:#fff;">Mentor </p></p>
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
   
<% if(flag4=="true") {%> <script>  Swal.fire('Sorry. There are currently no students available.'); </script> <% session.getAttribute("flag4");} %>
<% if(flag3=="true") {%> <script>  Swal.fire('Sorry. We alloted few number of students than you have asked as there are not enough registered students.'); </script> <% session.getAttribute("flag3");} %>
   <div class="parent" style="overflow:auto;">
   <div class="sidenav">
					<a href="#" onclick="showCon('cont4');" style="text-decoration:none;" ><ion-icon name="person-outline" style="padding-right:5px;padding-bottom:0px;"></ion-icon>Profile</a>
					<a href="#" onclick="showCon('cont3');"style="text-decoration:none;" ><ion-icon name="people-outline" style="padding-right:5px;padding-top:5px;"></ion-icon> Your students </a>
					
					<a href="#" onclick="showCon('cont1');" style="text-decoration:none;" ><ion-icon name="book-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Articles</a>
					<a href="#" onclick="showCon('cont');"  style="text-decoration:none;" ><ion-icon name="pencil-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Activity</a>
					<a href="index.jsp" style="text-decoration:none;" ><ion-icon name="home-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Home Page</a>
				</div>
	<div id="cont" class="cont" align="center" style="display:none" >
	<h2  align="center"> Meeting schedule </h2>
	<p id="al"> </p>
	
				</div>
	<div id="cont1" class="cont" align="center" style="display:none">
	<h2 align="center"> Articles Published </h2>
	<p> <% for(ment m : mtu){if(m.articles.size()!=0){out.println(m.articles);}else { %> <h2 style="color:lightgray;font-size:35px;margin-top:160px;">You have not published any articles yet.</h2><% }}%></p>
	</div>
	
	<div id="cont3" class="cont" align="center" style="display:none">
	<h2 align="center"> Your students </h2>
	<p> <% for(ment m : mtu){if(m.student.size()!=0){ %>
		<% sti = (ArrayList<stud>) request.getAttribute("sti"); if(sti == null){sti = (ArrayList<stud>) session.getAttribute("sti"); } %>
	 <div class="table-responsive">
	<table align="left" class="table table-hover table-borderless " style="margin-top:55px;width:50%;">
	<thead>
		
		<th scope="column"> Name </th>
		<th scope="column"> Email Id </th>
		
		<th scope="column"> Degree and Branch</th>
		<th scope="column"> Year </th>
		<th scope="column"> College Campus </th>
		
		<th scope="column"> activityScore</th>
		<th scope="column"> selfEsteemScore</th>
		</thead>
		<tbody>
		
		<% for (stud s : sti){ %>
		<tr>
			<td><% out.println(s.getuserName()); %></td>
			<td><% out.println(s.getemailId()); %></td>
			<td><% out.println(s.getdegree()); %></td>
			<td><% out.println(s.getyear()); %></td>
			<td><% out.println(s.getcampus()); %></td>
			
			<td><% out.println(s.getactivityScore()); %></td>
			<td><% out.println(s.getselfEsteemScore()); %></td>
		</tr>
		<% } %>
		</tbody>
		</table>
		</div>
	<%}else { %> <h2 style="color:lightgray;font-size:35px;margin-top:100px;">You have not assigned any students yet.</h2>
	 <h4 style="color:#2a2965;font-size:25px;margin-top:40px;">How many students do you want to mentor ?</h4>
	 <div style="color:lightgray;font-size:23px;margin-top:20px;"><form action="/assign" method="post"><div><select  style="background-color:#2a2965;" align="center"; id="num" name="num" type="number"  required="" autocomplete='off' ><option align="center" value="" disabled selected hidden >Number of Students</option>
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option></select></div>
  <div style="margin-top:20px;"> <button style="background-color:#2a2965;color:white;font-size:15px;" class="btn" id="value1" name="value1" type="submit">Ok!</button></div></form></div><% }}%></p>
 
		
	</div>
	<div id="cont4" class="cont" align="center" >
	<h2 align="center"> Personal Details </h2>
	<div class="table-responsive">
	<table align="center" class="table table-hover table-borderless " style="margin-top:55px;width:50%;">
    <tbody>

    <tr class='borderless'>
       <th >Name</th>
      <td><% for(ment m : mtu){out.println(m.getName());}%></td>
     </tr>
    <tr class='borderless'>
      <th style="width: 65%;">Email Id</th>
      <td ><% for(ment m : mtu){out.println(m.getemailId());}%></td>
     </tr>
    <tr class='borderless'>
       <th style="width: 65%;"> Place </th>
      <td><% for(ment m : mtu){out.println(m.getplace());}%></td>
     </tr>
	 <tr class='borderless'>
       <th > Contact </th>
      <td><% for(ment m : mtu){out.println(m.getcontact());}%></td>
     </tr>
	  <tr class='borderless'>
       <th > Qualification</th>
      <td><% for(ment m : mtu){out.println(m.getqualification());}%></td>
     </tr>
	 <tr class='borderless'>
       <th > Affiliation</th>
      <td><% for(ment m : mtu){out.println(m.getaffiliation());}%></td>
     </tr>
  </tbody>
</table>
<div align="center"><form action="change.jsp" method="post"><button style="background-color:#2a2965;color:white;" class="btn" id="value1" name="value1" type="submit">Change Password</button></form></div>
	</div>
	</div>
				</div>
				
</div>

</body>
</html>
