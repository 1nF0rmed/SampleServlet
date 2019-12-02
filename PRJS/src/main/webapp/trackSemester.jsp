<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

body {font-family: Josefin Sans, Arial, Arial;}
form {border: 3px solid #f1f1f1;}
	

input[type=text], input[type=password] {
  width: 30%;
  padding: 12px 15px;
  margin: 6px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #F55A5A;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  cursor: pointer;
  width: 17%;
  border: 1px solid;
  padding: 10px;
  box-shadow: 1px 2px #707070;
}

button:hover {
  opacity: 0.8;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 8%;
  border-radius: 50%;
  padding:40px;
}

.container {

text-align: center;
  padding: 10px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 30%;	
  }
}
</style>
<script type="text/javascript" src="jquery-1.10.2.js"></script>
<script>
 $(document).ready(function(){
	 $("#getData").click(function() {
		 $.ajax({
			 url: 'pullUSNResult_1',
			 type: 'POST',
			 data: {
				 'USN':$("#USN").val()
			 },
			 success: function(resp) {
				 //resp = $.parseJSON(resp);
				 var text = "";
				 
				 text = text.concat("NAME: "+ resp[0].NAME + "<br/>");
				 text = text.concat("USN: "+ resp[0].USN+"<br/>");
				 text = text.concat("OVERALL CGPA: "+ resp[0].OVERALLCGPA +"<br/><br/><br/>");
				 
				 for(var i=1;i<resp.length;i++){
					 text = text.concat("SEMESTER: "+ resp[i].SEMESTER + "<br/>");
					 text = text.concat("YEAR: "+ resp[i].YEAR+"<br/>"); 
					 //text = text.concat("COURSESTAKEN: "+ resp[i].COURSESTAKEN +"<br/>"); 
					 var list= resp[i].COURSESTAKEN;
					 for(var j=0;j<list.length;j+=4){
						 text= text.concat("<br/>COURSE: "+ list[j] + ",  CIE: "+ list[j+1] +",  SEE: "+ list[j+2]+ ",  GRADE: "+ list[j+3]+ "<br/><br/>");
					 }
					 text = text.concat("SGPA: "+ resp[i].SGPA + "<br/>");
					 text = text.concat("CGPA: "+ resp[i].CGPA +"<br/><br/>");
					 
				 }
				 
				 
				 $("#response").html(text);
				 }
		 });
	 });
 });
</script>
</head>
<body style="background-image: url('img_cctv.png'); background-size: 1403px 935px; padding:2px;">

<div>
  <div class="imgcontainer">
  
    <img src="img_avatar2.png" alt="Avatar" class="avatar">
	<h2>STUDENT RESULTS</h2>
	<h3 style="
    padding-bottom: 20px;
">Enter Details</h3>

  </div>

  <div class="container" style=" padding: 25px;">
    <label for="uname"><b></b></label>
    <input type="text" placeholder="Your Name" name="uname" required><br>

    <label for="usn"><b></b></label>
    <input type="text" placeholder="USN" align="centre" name="usn" id="USN" required><br><br>
    <button type="submit" id="getData">GET RESULTS</button><br>
   
  </div>

  <div class="container" style="background-color:#f1f1f1" id="response">
    
  </div>
</div>

</body>
</html>


<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Track USN</title>
<script type="text/javascript" src="jquery-1.10.2.js"></script>
<script>
 $(document).ready(function(){
	 $("#getData").click(function() {
		 $.ajax({
			 url: 'pullUSNResult_1',
			 type: 'POST',
			 data: {
				 'USN':$("#USN").val()
			 },
			 success: function(resp) {
				 //resp = $.parseJSON(resp);
				 var text = "";
				 
				 text = text.concat("NAME: "+ resp[0].NAME + "<br/>");
				 text = text.concat("USN: "+ resp[0].USN+"<br/>");
				 text = text.concat("OVERALL CGPA: "+ resp[0].OVERALLCGPA +"<br/><br/><br/>");
				 
				 for(var i=1;i<resp.length;i++){
					 text = text.concat("SEMESTER: "+ resp[i].SEMESTER + "<br/>");
					 text = text.concat("YEAR: "+ resp[i].YEAR+"<br/>"); 
					 //text = text.concat("COURSESTAKEN: "+ resp[i].COURSESTAKEN +"<br/>"); 
					 var list= resp[i].COURSESTAKEN;
					 for(var j=0;j<list.length;j+=4){
						 text= text.concat("<br/>COURSE: "+ list[j] + ",  CIE: "+ list[j+1] +",  SEE: "+ list[j+2]+ ",  GRADE: "+ list[j+3]+ "<br/><br/>");
					 }
					 text = text.concat("SGPA: "+ resp[i].SGPA + "<br/>");
					 text = text.concat("CGPA: "+ resp[i].CGPA +"<br/><br/>");
					 
				 }
				 
				 
				 $("#response").html(text);
				 }
		 });
	 });
 });
</script>
</head>
<body>
USN: <input type="text" id="USN"><br>
<input type="button" id="getData" value="Get Info"><br>
<br>

<div id="response">
	
</div>
</body>
</html>-->