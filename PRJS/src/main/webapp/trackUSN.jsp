<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Track USN</title>
	<script src="jquery-1.10.2.js"></script>
	<script src="./js/Chart.bundle.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/bulma.min.css">
	<link rel="stylesheet" type="text/css" href="./css/Chart.min.css">
	<script>
	 $(document).ready(function(){
		 $("#getData").click(function() {
			 $.ajax({
				 url: 'pullUSNResult',
				 type: 'POST',
				 data: {
					 'USN':$("#USN").val()
				 },
				 success: function(resp) {
					$("#student").empty();
					$("#response").empty();

					 //resp = $.parseJSON(resp);
					 var text = "";
					 
					 //text = text.concat("NAME: "+ resp[0].NAME + "<br/>");
					 //text = text.concat("USN: "+ resp[0].USN+"<br/>");
					 //text = text.concat("OVERALL CGPA: "+ resp[0].OVERALLCGPA +"<br/><br/><br/>");
			 $("#student").append("<p class='title is-5'>Name: "+ resp[0].NAME + "</p>");
			 $("#student").append("<p class='title is-5'>USN: "+ resp[0].USN + "</p>");
			 $("#student").append("<p class='title is-5'>Overall CGPA: "+ resp[0].OVERALLCGPA + "</p>");
					 
					 for(var i=1;i<resp.length;i++){
			   var courseArray = resp[i].COURSESTAKEN.split(",");
			   var tags = "";
			   for(var j=0;j<courseArray.length;j++)
				tags = tags.concat("<span class='tag is-link'>"+courseArray[j]+"</span>");
	
			   $("#response").append('<div class="column"><div class="box"><article class="media"><div class="media-content"><div class="content">'
				+'<p><strong>SEMESTER:</strong> '+ resp[i].SEMESTER + '</p>'+'<p><strong>YEAR:</strong> '+ resp[i].YEAR+'</p>'+'<p><strong>COURSES TAKEN:</strong> '+ tags 
				+'</p>'+'<p><strong>SGPA:</strong> '+ resp[i].SGPA + '</p>'+'<p><strong>CGPA:</strong> '+ resp[i].CGPA +'</p>'+'</div></div></article></div></div>');
					 }
					 
					 
					 //$("#response").html(text);
					 }
			 });
		 });
	 });
	</script>
	<style>
			#box {
				width: 1200px;
				height: 400px;
			}
			.navbar {
				box-shadow: 10px 10px 5px grey;
				height: 80px;
			}
			.navbar-item img {
				max-height: 4.5rem;
			}
			#inter {
				margin-top: 5%;
				padding: 0 30%;
			}
			.tag {
				margin: 0 5px;
			}
			.box {
				max-width: 350px;
			}
		</style>
	</head>
	<body>
	<nav class="navbar" role="navigation" aria-label="main navigation">
					<div class="navbar-brand">
					  <a class="navbar-item" id="img_holder" href="https://bmsce.ac.in">
						<img src="logo.png">
					  </a>
				  
					  <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
						<span aria-hidden="true"></span>
						<span aria-hidden="true"></span>
						<span aria-hidden="true"></span>
					  </a>
					</div>
				  
					<div id="navbarBasicExample" class="navbar-menu">
					  <div class="navbar-start">
						<a class="navbar-item" href="dashboard.jsp">
						  Dashboard
						</a>
				  
						<div class="navbar-item has-dropdown is-hoverable">
						  <a class="navbar-link">
							Other Options
						  </a>
				  
						  <div class="navbar-dropdown">
							<a class="navbar-item" href="trackUSN.jsp">
							  Track USN
							</a>
							<hr class="navbar-divider">
							<a class="navbar-item" href="resultStat.jsp">
							  Result Analysis
							</a>
							<hr class="navbar-divider">
							<a class="navbar-item">
							  Report an issue
							</a>
						  </div>
						</div>
					  </div>
				  
					  <div class="navbar-end">
						<div class="navbar-item">
						  <div class="buttons">
							<a class="button is-link" href="index.jsp">
							  <strong>LOG OUT</strong>
							</a>
						  </div>
						</div>
					  </div>
					</div>
				  </nav>
	
	<!--USN: <input type="text" id="USN"><br>
	<input type="button" id="getData" value="Get Info"><br>
	<br>
	
	<div id="response">
		
	</div>-->
	
	<section class="section">
			<div class="container" id="login">
					<div class="container">
						<p class="title has-text-centered">
							 <img src="logo.png" alt="" class="has-text-centered" width="200px" height="200px">
						</p>
						 <p class="title is-3 has-text-centered">
							 TRACK USN
						 </p>
					</div>
					<div class="columns is-centered main" id="inter">
						<div class="column">
							 <div class="field">
								 <label class="label">USN</label>
								 <div class="control">
									 <input class="input" type="text" id="USN" placeholder="e.g 1BM16IS413">
								 </div>
							 </div>
							 <button class="button is-large is-fullwidth is-link" id="getData">TRACK PROGRESS</button>
						</div>
					</div>
				</div>
	</section>
	<section class="section">
		<div class="container">
			<p class="title is-4">Student's overview of academic performance</p>
			<div id="student">
			</div>
	
			<div class="columns is-centered is-multiline" id="response">
	
			</div>
		</div>
	</section>
	</body>
	</html>