<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>程序设计(C语言)在线编译系统</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>程序设计在线编译系统</h1>
                  </div>
                  <p>Student registration<a href="register1.jsp">Teacher registration</a></p>
                  <p>Register by mobile number or Register by <a href="register3.jsp">email</a></p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <form class="form-validate">
                    <div class="form-group">
                      <input id="register-username" type="text" name="username" required data-msg="Please enter your username" class="input-material">
                      <label for="register-username" class="label-material">User Name</label>
                    </div>
					<div class="form-group">
                      <input id="register-phone" type="text" name="phone" required data-msg="Please enter your phone number" class="input-material">
                      <label for="register-phone" class="label-material">phone        </label>
                    </div>
                    <div class="form-group">
                      <input id="register-password" type="password" name="password" required data-msg="Please enter your password" class="input-material">
                      <label for="register-password" class="label-material">password        </label>
                    </div>
                    <div class="form-group">
                      <input id="register-student_id" type="text" name="student_id" required data-msg="Please enter your student_id" class="input-material">
                      <label for="register-student_id" class="label-material">student_id        </label>
                    </div>
                    <div class="form-group terms-conditions">
                      <input id="register-agree" name="registerAgree" type="checkbox" required value="1" data-msg="Your agreement is required" class="checkbox-template">
                      <label for="register-agree">Agree the terms and policy</label>
                    </div>
                    <div class="form-group">
                      <div id="regidter"  name="registerSubmit" class="btn btn-primary">Register</div>
                    </div>
                  </form><small>Already have an account? </small><a href="login1.jsp" class="signup">Login</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
  	  $("#regidter").click(function(){
  	    
          $.ajax({
              type: "POST",
              url: "/c-editor/user/register4",
              contentType: "application/json",
              dataType: "json",
              data : JSON.stringify({
  					"username":$("#register-username").val(),
  					"phone":$("#register-phone").val(),
  					"password":$("#register-password").val(),
  					"student_id":$("#register-student_id").val(),
  				}),

  				//成功的回调函数
  				success : function(data) {
  					console.log(data)
  					alert("注册成功!");
  				},
  				//失败的回调函数
  				error : function() {
  					console.log("error")
  					alert("注册失败!");
  				}

          });
  	  });
  	});
    </script>
  </body>
</html>