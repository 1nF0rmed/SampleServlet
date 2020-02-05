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
                    <a class="navbar-item" href="dashboard.jsp">
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
                        <a class="button is-link" href="index.jsp">
                          <strong>LOG OUT</strong>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </nav>
    <section class="section">
        <p class="title is-1 has-text-centered">RESULT ANALYSIS</p>
    </section>
    <section class="section">
        <div class="container">
            <p class="title is-4">Select the Subject using the following filters</p>
            <div class="columns is-centered">
                    <div class="column">
                        <div class="field is-grouped">
                              <label class="label">Year</label>
                              <div class="control">
                                <div class="select">
                                    <select name="year" id="year"></select>
                                </div>
                              </div>
                              <label class="label">Semester</label>
                                <div class="control">
                                    <div class="select">
                                          <select name="sem" id="sem"></select>
                                    </div>
                                </div>
                                <label class="label">Section</label>
                              <div class="control">
                            <div class="select">
                                  <select name="section" id="section"></select>
                            </div>
                              </div>

                              <label class="label">Service Type</label>
                              <div class="control">
                            <div class="select">
                                  <select name="type" id="type">
									  <option value="police">Police</option>
									  <option value="hospital">Hospital</option>
								  </select>
                            </div>
                              </div>
                        </div>
                        
                        <div class="field is-grouped">
                              <div class="control">
                                <button id="analyze" class="button is-link">Analyze Data</button>
                              </div>
                        </div>
                   </div>
                   <!--End of column--> 

            </div>
        </div>
    </section>
	<section class="section">
            <div class="container">
                    <p class="title is-3 has-text-centered">Result</p>                 
                    <div id="box" class="columns is-centered">
                        <div id="b1" class="column is-half">
							<canvas id="chart2"></canvas>
						</div>
                        <div id="b2" class="column is-half">
							<canvas id="chart" ></canvas>
						</div>
					</div>
					<div id="box" class="columns is-centered">
						<div id="b3" class="column is-half">
							<canvas id="chart3" ></canvas>
						</div>
						<div id="b4" class="column is-half">
							<canvas id="chart4" ></canvas>
						</div>
					</div>
            </div>
    </section>
    <script>
    	function createChart(_data) {
    		var ctx = $("#chart");
    		
    		$("#chart").width(500).height(500);
    		
    		var myChart = new Chart(ctx, {
    			type: 'bar',
    			data: {
    				labels: ["S", "A", "B", "C", "D", "E", "F"],
    				datasets: [{
    					label: "Student grade frequency",
    					data: [_data["S"], _data["A"], _data["B"], _data["C"], _data["D"], _data["E"], _data["F"]],
    					backgroundColor: [
    						'rgba(255, 99, 132, 1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)',
    		                'rgba(255, 159, 64, 1)'
    					],
    					borderColor: [
    		                'rgba(255, 99, 132, 1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)',
    		                'rgba(255, 159, 64, 1)'
    		            ],
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
    	
    	function createPie(_data) {
			var ctx = $("#chart2");
    		
    		var myPieChart = new Chart(ctx, {
    		    type: 'pie',
    		    data: {
    				labels: ["S", "A", "B", "C", "D", "E", "F"],
    				datasets: [{
    					label: "Student grade frequency",
    					data: [_data["S"], _data["A"], _data["B"], _data["C"], _data["D"], _data["E"], _data["F"]],
    					backgroundColor: [
    						'rgba(255, 99, 132, 1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)',
    		                'rgba(255, 159, 64, 1)'
    					],
    					borderColor: [
    		                'rgba(255, 99, 132, 1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)',
    		                'rgba(255, 159, 64, 1)'
    		            ],
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

		function createPolar(_data) {
			var ctx = $("#chart4");
    		
    		var myPieChart = new Chart(ctx, {
    		    type: 'polarArea',
    		    data: {
    				labels: ["S", "A", "B", "C", "D", "E", "F"],
    				datasets: [{
    					label: "Student grade frequency",
    					data: [_data["S"], _data["A"], _data["B"], _data["C"], _data["D"], _data["E"], _data["F"]],
    					backgroundColor: [
    						'rgba(255, 99, 132, 1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)',
    		                'rgba(255, 159, 64, 1)'
    					],
    					borderColor: [
    		                'rgba(255, 99, 132, 1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)',
    		                'rgba(255, 159, 64, 1)'
    		            ],
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

		function createDN(_data) {
			var ctx = $("#chart3");
    		
    		var myPieChart = new Chart(ctx, {
    		    type: 'doughnut',
    		    data: {
    				labels: ["S", "A", "B", "C", "D", "E", "F"],
    				datasets: [{
    					label: "Student grade frequency",
    					data: [_data["S"], _data["A"], _data["B"], _data["C"], _data["D"], _data["E"], _data["F"]],
    					backgroundColor: [
    						'rgba(255, 99, 132, 1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)',
    		                'rgba(255, 159, 64, 1)'
    					],
    					borderColor: [
    		                'rgba(255, 99, 132, 1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)',
    		                'rgba(255, 159, 64, 1)'
    		            ],
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
         				//$('#chart').remove();
         				//$('#box').append('<canvas id="chart" class=""></canvas>');
         				//$('#box').append('<canvas id="chart2" ></canvas>');
         				
         				createChart(data);
         				createPie(data);
						createDN(data);
						createPolar(data);
         				//document.writeln(data["S"]);
         			}
         		});
         	});
        });
    </script>
</body>
</html>