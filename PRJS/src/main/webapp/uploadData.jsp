<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

       		 <!--<div id="input_form">
        		<label>Year</label>
        		<select name="year" id="year"></select><br>
        		<label>Sem</label>
        		<select name="sem" id="sem"></select><br>
        		<label>Section</label>
        		<select name="section" id="section"></select><br>
        		<label>Subject</label>
        		<select name="subject" id="subject"></select>
	
        		<input type="submit" value="Analyze Data" id="analyze">
        	
       		 </div>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student-Subject Result Analysis</title>
<script src="jquery-1.10.2.js"></script>
<script src="./js/Chart.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/bulma.min.css">
<link rel="stylesheet" type="text/css" href="./css/Chart.min.css">
<style>
	#box {
		height: 400px;
	}
    .navbar {
        box-shadow: 10px 10px 5px grey;
        height: 80px;
    }
    .navbar-item img {
        max-height: 4.5rem;
    }
  #analyze {
    margin: 15px 0px;
  }

  .label {
    margin: 0 10px;
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
                    <a class="navbar-item" href="coe_dashboard.jsp">
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
                        <a class="navbar-item" href="#">
                          Result Analysis
                        </a>
                        <hr class="navbar-divider">
                        <a class="navbar-item" href="#">
                          Report an issue
                        </a>
                      </div>
                    </div>
                  </div>
              
                  <div class="navbar-end">
                    <div class="navbar-item">
                      <div class="buttons">
                        <a class="button is-link" href="COE">
                          <strong>LOG OUT</strong>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </nav>
    <section class="section">
        <p class="title is-1 has-text-centered">UPLOAD RESULT SHEET</p>
    </section>
    <section class="section">
        <div class="container">
            <p class="title is-4">Select the Subject using the following filters</p>
            <div class="columns is-centered">
                    <div class="column">
                        <div class="field is-grouped">
                              <label class="label">Year</label>
                              <div class="control">
                                <input type="text" class="input" name="" id="">
                              </div>
                              <label class="label">Semester</label>
                                <div class="control">
                                    <input type="text" class="input" name="" id="">
                                </div>
                        </div>
                        <div class="file has-name" id="upload">
                                <label class="file-label">
                                  <input class="file-input" type="file" name="resume">
                                  <span class="file-cta">
                                    <span class="file-icon">
                                      <i class="fas fa-upload"></i>
                                    </span>
                                    <span class="file-label">
                                      Choose a file…
                                    </span>
                                  </span>
                                  <span class="file-name">
                                  </span>
                                </label>
                              </div>
                        
                        <div class="field is-grouped">
                              <div class="control">
                                <button id="analyze" class="button is-link">Upload Sheet</button>
                              </div>
                        </div>
                   </div>
                   <!--End of column--> 

            </div>
        </div>
    </section>
	<section class="section">
            <div class="container">
                    <p class="title is-3 has-text-centered">Status:</p>                 
                    <div id="response">

                    </div>
            </div>
    </section>
    <script>
        $(document).ready(function(){
           $("#analyze").click(function(){
               $("#response").append("UPLOADED!!");
           });
        });
    </script>
</body>
</html>