<%@ page import ="java.io.*"%>
<%@ page import ="java.io.File.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="art1.student"%>
<%@page import="art1.mentor"%>


<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" class="html2">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>DashBoard</title>
<link rel="stylesheet" type="text/css" href="/css/style.css?v=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css">
  
</head>
<body class="alt-grid" id="body2">


<script>

var divs = ["cont3", "cont4"];
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
                        <p style="font-size:26px;">EQ CLUB
						<br>
						<p style="font-size:20px;color:#fff;">ADMIN</p></p>
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
	<% ArrayList<student> stu = (ArrayList<student>) session.getAttribute("sti"); %>
	<% ArrayList<mentor> mt = (ArrayList<mentor>) session.getAttribute("mt"); %>
   <div class="parent" style="overflow:auto;">
   <div class="sidenav1">
					<a href="#" onclick="showCon('cont4');" style="text-decoration:none;" ><ion-icon name="person-outline" style="padding-right:5px;padding-bottom:0px;"></ion-icon>Student</a>
					<a href="#" onclick="showCon('cont3');"style="text-decoration:none;" ><ion-icon name="people-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Mentor</a>
					<a href="index.jsp" style="text-decoration:none;" ><ion-icon name="home-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Home Page</a>
					<a href="/logOut" style="text-decoration:none;" ><ion-icon name="home-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Logout</a>
					<!--<a href="#" onclick="showCon('cont');"  style="text-decoration:none;" ><ion-icon name="pencil-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Take tests</a>
					<a href="index.jsp" style="text-decoration:none;" ><ion-icon name="home-outline" style="padding-right:5px;padding-top:5px;"></ion-icon>Home Page</a> -->
				</div>
	
		<div id="cont4" class="cont" align="center" >
	<h2  align="center"> Student List</h2>
	<p id="al"> </p>
	<div class="table-responsive">
	<table id="tab" align="left" class="table table-hover table-borderless " style="margin-top:55px;width:50%;">
	<thead>
		
		<th scope="column"> Name </th>
		<th scope="column"> Email Id </th>
		
		<th scope="column"> Degree and Branch</th>
		<th scope="column"> Year </th>
		<th scope="column"> College Campus </th>
		<th scope="column"> Mentor</th>
		</thead>
		<tbody>
		<% for ( student p : stu)  {%>
		<tr>
			<td><% out.println(p.getuserName()); %></td>
			<td><% out.println(p.getemailId()); %></td>
			<td><% out.println(p.getdegree()); %></td>
			<td><% out.println(p.getyear()); %></td>
			<td><% out.println(p.getcampus()); %></td>
			<td><% out.println(p.getmentor()); %></td>
		</tr>
		<% } %>
		</tbody>
		</table>
		</div>
		</div>
		<div id="cont3" class="cont" align="center" style="display:none">
	<h2  align="center">Mentor Applicant List</h2>
	<p id="al"> </p>
	<div class="table-responsive">
	<table id="tab" align="center" class="table table-hover table-borderless " style="margin-top:55px;width:100%;">
	<thead>
		
		<th scope="column"> Name </th>
		<th scope="column"> Email Id </th>
		<th scope="column"> Place </th>
		<th scope="column">Contact</th>
		<th scope="column">Qualification </th>
		<th scope="column">Affiliation</th>
		<th scope="column" >EQ</th>
		<th scope="column">About</th>
		<th scope="column" >Goal</th>
		<th scope="column">Motivation</th>
		<th scope="column">Status</th>
		
		</thead>
		<tbody>
		<% int count=-1; %>
		<% for ( mentor m : mt)  {%>
		<form name="form1" method="POST"  autocomplete="off"; >
		
		<tr>
			
			<td><% out.println(m.getName()); %></td>
			<td value="<%= m.getemailId() %>" ><% String mail =(String) m.getemailId(); %>
			<% out.println(mail); %></td>
			<td><% out.println(m.getplace()); %></td>
			<td><% out.println(m.getcontact()); %></td>
			<td><% out.println(m.getqualification()); %></td>
			<td><% out.println(m.getaffiliation()); %></td>
			<td><% out.println(m.getEQ()); %></td>
			<td ><% out.println(m.getAbout()); %></td>
			<td><% out.println(m.getGoal()); %></td>
			<td ><% out.println(m.getMotivation()); %></td>
			<td style="display:none"> <% count = count+1; %><% out.println(count); %> </td>
			
			<td><% if (m.getstatus() != null) { out.println(m.getstatus()); %> <% } else if (m.getstatus()== null){ %>
			<button class="btn"  value = "Approved" id="value1" name="value1" type="submit">Approve</button>
			<button class="btn" value = "Rejected" id="value2" name="value2" type="submit">Reject </button> <% } %> </td>
			
		</tr>
		 
		</form>
		<% } %>
		</tbody>
		</table>
		<div id="msg" name="msg"></div>
		</div>
		</div>
			
    
	
	
	
				
</div>
</div>
<script>
$(document).ready(function(){
	// code to read selected table row cell data (values).
	$(".btn").on('click',function(){
		 var currentRow=$(this).closest("tr");
		 
		 var col2=currentRow.find("td:eq(1)").html();
		 document.getElementById("msg").value=col2;
		 var count=currentRow.find("td:eq(10)").html();
		 var a = parseInt(count)
		
		 document.forms[a].method = "post";
		 document.forms[a].action = "/mentor_appr?col2="+col2
		 
         document.forms[a].submit();
		 
		 
		 
		
	});
	
});

	
		
</script>
</body>
</html>