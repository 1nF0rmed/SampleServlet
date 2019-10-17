<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</html>