<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student-Subject Result Analysis</title>
<script src="jquery-1.10.2.js"></script>
<script src="js/Chart.bundle.min.js"></script>
<style src="css/Chart.min.css"></style>
<style>
	#chart {
		width: 400px;
		height: 400px;
	}
</style>
</head>
<body>
	<div id="container">
        <div id="input_form">
        	<label>Year</label>
        	<select name="year" id="year"></select><br>
        	<label>Sem</label>
        	<select name="sem" id="sem"></select><br>
        	<label>Section</label>
        	<select name="section" id="section"></select><br>
        	<label>Subject</label>
        	<select name="subject" id="subject"></select>
	
        	<input type="submit" value="Analyze Data" id="analyze">
        	
        </div>
        
        <div id="resp"></div>
        
    </div>
    <script>
    	function createChart(_data) {
    		var ctx = $("#chart");
    		
    		var myChart = new Chart(ctx, {
    			type: 'bar',
    			data: {
    				labels: ["S", "A", "B", "C", "D", "E", "F"],
    				datasets: [{
    					label: "Student grade frequency",
    					data: [_data["S"], _data["A"], _data["B"], _data["C"], _data["D"], _data["E"], _data["F"]],
    					borderWidth: 1
    				}]
    			},
    			options: {
    				responsive: true,
    				maintainAspectRatio: false,
    				scales: {
    					yAxes: [{
    						ticks: {
    							beginAtZero: true,
    							steps:1,
    							stepValue: 6,
    							max:10
    						}
    					}]
    				}
    			}
    		});
    	}
    
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
            $("#year").click(function(){
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
            $("#sem").click(function(){
                
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
         				'year': parseInt($("#year").val()),
         				'sec': $("#section").val(),
         				'sub': $("#subject").val()
         			},
         			success: function(resp) {
         				var data = $.parseJSON(resp);
         				// Remove canvas and create the canvas
         				$('#chart').remove();
         				$('#container').append('<canvas id="chart"></canvas>');
         				
         				createChart(data);
         				//document.writeln(data["S"]);
         			}
         		});
         	});
        });
    </script>
</body>
</html>