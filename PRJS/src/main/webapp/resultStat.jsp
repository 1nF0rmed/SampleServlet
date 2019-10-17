<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student-Subject Result Analysis</title>
<script src="jquery-1.10.2.js"></script>
</head>
<body>
	<div id="container">
        <select name="year" id="year"></select>
        <select name="sem" id="sem"></select>
        <select name="subject" id="subject"></select>
        <select name="section" id="section"></select>

        <input type="submit" value="Analyze Data">
    </div>
    <script>
        $(document).ready(function(){
            $.ajax({
			 url: 'ResultAnalysis',
			 type: 'GET',
			 data: {
				 'type':'year'
			 },
			 success: function(resp) {
                 resp = $.parseJSON(resp);
                 for(var i=0;i<resp.length;i++) {
                     $("#year").append("<option value=\""+resp[i]+"\">"+resp[i]+"</option>");
                 }
                }
		    });
            
            // Handle year select event
            $("#year").change(function(){
            	$.ajax({
       			 url: 'ResultAnalysis',
       			 type: 'GET',
       			 data: {
       				 'type':'sem',
       				 'year':parseInt($("#year").val())
       			 },
       			 success: function(resp) {
                        resp = $.parseJSON(resp);
                        for(var i=0;i<resp.length;i++) {
                            $("#sem").append("<option value=\""+resp[i]+"\">"+resp[i]+"</option>");
                        }
                       }
       		    });
            });
        });
    </script>
</body>
</html>