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
			 url: 'pullUSNResult',
			 type: 'POST',
			 data: {
				 'USN':$("#USN").val()
			 },
			 success: function(resp) {
				 //resp = $.parseJSON(resp);
				 var text = "";
				 for(var i=0;i<resp.length;i++){
					 text = text.concat("SEMESTER: "+ resp[i].SEMESTER + "<br/>");
					 text = text.concat("YEAR: "+ resp[i].YEAR+"<br/>");
					 text = text.concat("COURSES TAKEN: "+ resp[i].COURSESTAKEN +"<br/>");
					 text = text.concat("SGPA: "+ resp[i].SGPA + "<br/>");
					 text = text.concat("CGPA: "+ resp[i].CGPA +"<br/><br/>");
					 
				 }
				 
				 alert(text);
				 
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