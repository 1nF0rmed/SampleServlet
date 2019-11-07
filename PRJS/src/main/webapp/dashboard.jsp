<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Dashboard</title>
 <link rel="stylesheet" href="css/materialize.min.css">
    <script src="js/materialize.min.js"></script>
</head>
<body>
  <nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo right">Logout</a>
    </div>
  </nav>
	<div class="container">
        <div class="content">
                <h2>Faculty: test_user</h2>
                 <div class="col s12 m6">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">Track Student USN</span>
          <p>View a student's track record and see the progress made.</p>
        </div>
        <div class="card-action">
          <a href="trackUSN.jsp">Go here</a>
        </div>
      </div>
    </div>
    <div class="col s12 m6">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">Analyze Subject Results</span>
          <p>A graphical distribution of grades by year, semester and section.</p>
        </div>
        <div class="card-action">
          <a href="resultStat.jsp">Go here</a>
        </div>
      </div>
    </div>
        </div>
    </div>
</body>
</html>