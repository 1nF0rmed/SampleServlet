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
	#design {
		height: 102vh;
        background-color: #276CDA;
	}
    #box {
        width:400px;
        height: 400px;
    }
    .main {
        padding: 50px 80px;
    }
    #login {
        padding: 10px;
        margin-top: 15%;
    }
</style>
</head>
<body>
	<div id="container" class="columns is-centered">
       <div class="column is-half">
           <div class="container" id="login">
               <div class="container">
                   <p class="title has-text-centered">
                        <img src="logo.png" alt="" class="has-text-centered" width="200px" height="200px">
                   </p>
                    <p class="title is-1 has-text-centered">
                        FACULTY LOGIN
                    </p>
               </div>
               <div class="columns is-centered main">
                   <div class="column">
                        <div class="field">
                            <label class="label">Username</label>
                            <div class="control">
                                <input class="input" type="text" placeholder="e.g facultyis102">
                            </div>
                        </div>
                              
                        <div class="field">
                            <label class="label">Password</label>
                            <div class="control">
                                <input class="input" type="password" placeholder="*************">
                            </div>
                        </div>
                        <a href="dashboard.jsp">
                            <button class="button is-large is-fullwidth is-link login" >LOGIN</button>
                        </a>
                   </div>
               </div>
           </div>
       </div>
       <div class="column is-half" id="design">
        <div class="columns is-multiline">
                <div id="box" class="column">
                        <canvas id="chart"></canvas>
                </div>
                <div id="box" class="column">
                        <canvas id="chart2" ></canvas>
                </div>
                <div id="box" class="column">
                        <canvas id="chart3" ></canvas>
                </div>
        </div>
   </div>
        
    </div>
    <script>
            function createChart() {
                var ctx = $("#chart");
                
                $("#chart").width(500).height(500);
                
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ["S", "A", "B", "C", "D", "E", "F"],
                        datasets: [{
                            label: "Student grade frequency",
                            data: [35, 23, 10, 05, 2, 0, 0],
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
                                    max:40
                                }
                            }]
                        }
                    }
                });
            }
            
            function createPie() {
                var ctx = $("#chart2");
                
                var myPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ["S", "A", "B", "C", "D", "E", "F"],
                        datasets: [{
                            label: "Student grade frequency",
                            data: [35, 23, 10, 5, 2, 0, 0],
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
                                    max:40
                                }
                            }]
                        }
                    }
                });
            }

            function createRadar() {
                var ctx = $("#chart3");

                var data = {
    labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
    datasets: [
        {
            label: "My First dataset",
            backgroundColor: "rgba(179,181,198,0.2)",
            borderColor: "rgba(179,181,198,1)",
            pointBackgroundColor: "rgba(179,181,198,1)",
            pointBorderColor: "#fff",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(179,181,198,1)",
            data: [65, 59, 90, 81, 56, 55, 40]
        },
        {
            label: "My Second dataset",
            backgroundColor: "rgba(255,99,132,0.2)",
            borderColor: "rgba(255,99,132,1)",
            pointBackgroundColor: "rgba(255,99,132,1)",
            pointBorderColor: "#fff",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(255,99,132,1)",
            data: [28, 48, 40, 19, 96, 27, 100]
        }
    ]
};

                var myRadarChart = new Chart(ctx, {
                    type: 'radar',
                    data: data
                });
            }
        
            $(document).ready(function(){
                Chart.defaults.global.animation.duration = 3000;

                setTimeout(function(){
                    createChart();
                }, 1000);
                setTimeout(function(){
                    createPie();
                }, 2000);
                setTimeout(function(){
                    createRadar();
                }, 3000);
                //document.writeln(data["S"]);
            });
        </script>
</body>
</html>