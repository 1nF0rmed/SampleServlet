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
        <div id="input_form">
        	<select name="year" id="year"></select>
        	<select name="sem" id="sem"></select>
        	<select name="section" id="section"></select>
        	<select name="subject" id="subject"></select>
	
        	<input type="submit" value="Analyze Data" id="analyze">
        </div>
        
        <div id="resp"></div>
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
                        $("#sem").empty();
                        for(var i=0;i<resp.length;i++) {
                            $("#sem").append("<option value=\""+resp[i]+"\">"+resp[i]+"</option>");
                        }
                       }
       		    });
            });
            
         // Handle sem select event
            $("#sem").change(function(){
                
            	$.ajax({
       			 url: 'ResultAnalysis',
       			 type: 'GET',
       			 data: {
       				 'type':'section',
       				 'sem':parseInt($("#sem").val()),
       				 'year':parseInt($("#year").val())
       			 },
       			 success: function(resp) {
                        resp = $.parseJSON(resp);
                        $("#section").empty();
                        for(var i=0;i<resp.length;i++) {
                            $("#section").append("<option value=\""+resp[i]+"\">"+resp[i]+"</option>");
                        }
                       }
       		    });
            });
         
         	// Handle section select event
            $("#sem").click(function(){
                
            	$.ajax({
       			 url: 'ResultAnalysis',
       			 type: 'GET',
       			 data: {
       				 'type':'subject',
       				 'sem':parseInt($("#sem").val())
       			 },
       			 success: function(resp) {
                        resp = $.parseJSON(resp);
                        $("#subject").empty();
                        for(var i=0;i<resp.length;i++) {
                            $("#subject").append("<option value=\""+resp[i]+"\">"+resp[i]+"</option>");
                        }
                       }
       		    });
            });
         	
         	// Handle request for analysis
         	$("#analyze").click(function(){
         		$.ajax({
         			url:'ResultAnalysis',
         			type: 'POST',
         			data: {
         				'sem': parseInt($("#sem").val()),
         				'year': parseInt($("#year").val(),
         				'sec': $("#section").val(),
         				'sub': $("#subject").val()
         			},
         			success: function(resp) {
         				$("#resp").val(resp);
         			}
         		});
         	});
        });
    </script>
</body>
</html>