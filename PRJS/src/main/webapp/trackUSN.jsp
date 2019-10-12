<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
				 $("#response").html("<br>SEMESTER: "+resp[0].SEMESTER + "<br>YEAR: "+resp[0].YEAR+"<br>COURSES TAKEN: "+resp[0].COURSESTAKEN+"<br>CGPA: "+resp[0].SGPA+"<br>SGPA: "+resp[0].CGPA);
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