<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Dashboard</title>
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
        <a class="navbar-item" href="#">
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
  <p class="title is-4">User: COE(admin)</p>
</section>
<section class="section">
  <div class="container">
    <div class="columns is-centered">
      <div class="column">
        <div class="box">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <p>Upload Result Sheet</p>
                <p>Upload an Excel sheet that will be updated to the student database.</p>
                <a href="uploadData.jsp">Go here</a>
              </div>
            </div>
          </article>
        </div>
      </div>
      <div class="column">
          <div class="box">
            <article class="media">
              <div class="media-content">
                <div class="content">
                  <p>Add Students</p>
                  <p>Add newly admitted students to the database.</p>
                  <a href="addStudent.jsp">Go here</a>
                </div>
              </div>
            </article>
          </div>
        </div>
        <div class="column">
                <div class="box">
                  <article class="media">
                    <div class="media-content">
                      <div class="content">
                        <p>Add Subjects</p>
                        <p>Add/Update subjects taught by the department.</p>
                        <a href="addSubject.jsp">Go here</a>
                      </div>
                    </div>
                  </article>
                </div>
              </div>
    </div>
  </div>
</section>
</body>
</html>