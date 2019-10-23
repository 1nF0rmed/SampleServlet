<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Faculty Login</title>
    <link rel="stylesheet" href="css/materialize.min.css">
    <script src="js/materialize.min.js"></script>
    <style>
        .container {
        width: 400px;
        height: 400px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        box-shadow: 3px 3px 5px 6px #ccc;
        }
        .content {
            padding: 25px;
        }
        .login {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
                <h2>Faculty Login</h2>
                <div class="input-field col s6">
                    <input id="faculty_id" type="text" class="validate">
                    <label for="faculty_id">Faculty ID</label>
                </div>
                <div class="input-field col s6">
                        <input id="password" type="password" class="validate">
                        <label for="password">Password</label>
                </div>
                <div class="input-field col s6">
                    <a class="waves-effect waves-light btn login" href="dashboard.jsp">Login</a>
                </div>
                <div class="input-field col s6">
                        <a href="resetPassword.jsp">Forgot Password?</a>
                </div>
                <div class="input-field col s6">
                        <a href="trackSemester.jsp">Are you a <b>Student?</b></a>
                </div>
        </div>
    </div>
</body>
</html>