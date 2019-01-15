<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>程序设计（C语言）在线编译系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <div class="page">
      <!-- Main Navbar-->
      <header class="header">
        <nav class="navbar">
          <!-- Search Box-->
          <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
              <input type="search" placeholder="What are you looking for..." class="form-control">
            </form>
          </div>
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <!-- Navbar Header-->
              <div class="navbar-header">
                <!-- Navbar Brand --><a href="index.html" class="navbar-brand d-none d-sm-inline-block">
                  <div class="brand-text d-none d-lg-inline-block"><span>程序设计编译系统</span></div>
                  <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>Compile</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                <!-- Notifications-->
                <li class="nav-item dropdown"> <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell-o"></i><span class="badge bg-red badge-corner">12</span></a>
                  <ul aria-labelledby="notifications" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-envelope bg-green"></i>You have 6 new messages </div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-upload bg-orange"></i>Server Rebooted</div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
                          <div class="notification-time"><small>10 minutes ago</small></div>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>view all notifications                                            </strong></a></li>
                  </ul>
                </li>
                <!-- Messages                        -->
                <li class="nav-item dropdown"> <a id="messages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-envelope-o"></i><span class="badge bg-orange badge-corner">10</span></a>
                  <ul aria-labelledby="notifications" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                        <div class="msg-profile"> <img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="msg-body">
                          <h3 class="h5">Jason Doe</h3><span>Sent You Message</span>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                        <div class="msg-profile"> <img src="img/avatar-2.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="msg-body">
                          <h3 class="h5">Frank Williams</h3><span>Sent You Message</span>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                        <div class="msg-profile"> <img src="img/avatar-3.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="msg-body">
                          <h3 class="h5">Ashley Wood</h3><span>Sent You Message</span>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>Read all messages   </strong></a></li>
                  </ul>
                </li>
                
                <!-- Logout    -->
                <li class="nav-item"><a href="login.html" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <div class="page-content d-flex align-items-stretch"> 
        <!-- Side Navbar -->
        <nav class="side-navbar">
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
            <div class="title">
              <h1 class="h4">王 梓 屹</h1>
              <p> 16204109 </p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
          <ul class="list-unstyled">
                    <li><a href=> <i class="icon-screen"></i>Compiler </a></li>
                    <li><a href="tables.html"> <i class="icon-grid"></i>Tables </a></li>
                    <li class="active"><a href="forms.html"> <i class="icon-website"></i>Upload </a></li>
                    <li><a href="charts.html"> <i class="fa fa-bar-chart"></i>Charts </a></li>
                    <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Example dropdown </a>
                      <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                        <li><a href="#">Page</a></li>
                        <li><a href="#">Page</a></li>
                        <li><a href="#">Page</a></li>
                      </ul>
                    </li>
                    <li><a href="login.html"> <i class="icon-interface-windows"></i>Login page </a></li>
          </ul>
        </nav>
        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Forms</h2>
            </div>
          </header>
          <!-- Breadcrumb-->
          <div class="breadcrumb-holder container-fluid">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Forms            </li>
            </ul>
          </div>
          <!-- Forms Section-->
          <section class="forms"> 
            <div class="container-fluid">
              <div class="row">
                
                <!-- Form Elements -->
                <div class="col-lg-12">
                  <div class="card">
                    <div class="card-close">
                      <div class="dropdown">
                        <button type="button" id="closeCard5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                      </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">上传习题</h3>
                    </div>
                    <div class="card-body">
                      <form class="form-horizontal">
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">标题</label>
                          <div class="col-sm-9">
                            <input id="title" type="text" class="form-control">
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">习题集</label>
                          <div class="col-sm-9">
                            <select id="topic_set" name="account" class="form-control mb-3">
                              <option>无分类</option>
                              <option>1、排序习题集</option>
                              <option>2、数组习题集</option>
                              
                            </select>
                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">题目描述</label>
                          <div class="col-sm-9">
                            <input id="1" type="text" class="form-control">
                          </div>
                        </div>
                         <div class="form-group row">
                          <label class="col-sm-3 form-control-label">输入规则描述</label>
                          <div class="col-sm-9">
                            <input id="2" type="textarea" class="form-control">
                          </div>
                         </div>
                          <div class="form-group row">
                          <label class="col-sm-3 form-control-label">输出规则描述</label>
                          <div class="col-sm-9">
                            <input id="3" type="text" class="form-control">
                          </div>
                         </div>
                          <div class="form-group row">
                          <label class="col-sm-3 form-control-label">输入示例</label>
                          <div class="col-sm-9">
                            <textarea id="4" class="form-control" name="textfield" rows="5"></textarea>
                          </div>
                         </div>
                          <div class="form-group row">
                          <label class="col-sm-3 form-control-label">输出示例</label>
                          <div class="col-sm-9">
                            <textarea id="5" class="form-control" name="textfield" rows="5"></textarea>
                          </div>
                         </div>
                         
                        <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">得分点 1</br></br><input id="score1" class="form-control" style="width: 30%;" placeholder="score"></label>
                          <div class="col-sm-9">
                            <textarea id="input1" class="form-control" name="textfield" rows="3" placeholder="input"></textarea>
                            
                            <textarea  id="output1" class="form-control" name="textfield" rows="3" placeholder="output"></textarea>
                          </div>
                          <div class="line"></div>
                          <label class="col-sm-3 form-control-label">得分点 2</br></br><input id="score2" class="form-control" style="width: 30%;" placeholder="score"></label>
                          <div class="col-sm-9">
                            <textarea id="input2" class="form-control" name="textfield" rows="3" placeholder="input"></textarea>
                            
                            <textarea id="output2" class="form-control" name="textfield" rows="3" placeholder="output"></textarea>
                          </div>
                          <div class="line"></div>
                          <label class="col-sm-3 form-control-label">得分点 3</br></br><input id="score3" class="form-control" style="width: 30%;" placeholder="score"></label>
                          <div class="col-sm-9">
                            <textarea id="input3" class="form-control" name="textfield" rows="3" placeholder="input"></textarea>
                            
                            <textarea id="output3" class="form-control" name="textfield" rows="3" placeholder="output"></textarea>
                          </div>
                        </div>

                          

                        <div class="line"></div>
                        <div class="form-group row">
                          <div class="col-sm-4 offset-sm-3">
                            <button type="reset" class="btn btn-secondary">重置</button>
                            <div id="send" class="btn btn-primary">提交</div>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
          <!-- Page Footer-->
          <footer class="main-footer">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                  <p>Any Qusetions Please Call 8888-8888</p>
                </div>
                <div class="col-sm-6 text-right">
                  <p>Design by Hcy</p>
                  <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                </div>
              </div>
            </div>
          </footer>
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
	  $("#send").click(function(){
	    var aw = "{\n"+"input:"+$("#input1").val()+",\n"+"output:"+$("#output1").val()+",\n"+"score:"+$("#score1").val()+"\n}";
	    if(($("#input2").val().length!=0)&&($("#output2").val().length!=0)){
	    	aw = aw +",\n"+"{"+"input:"+$("#input2").val()+",\n"+"output:"+$("#output2").val()+",\n"+"score:"+$("#score2").val()+"\n}";
	    }
	    if(($("#input3").val().length!=0)&&($("#output3").val().length!=0)){
	    	aw = aw +",\n"+"{"+"input:"+$("#input3").val()+",\n"+"output:"+$("#output3").val()+",\n"+"score:"+$("#score3").val()+"\n}";
	    	alert($("#input3").val()+$("#output3").val());
	    	
	    }
        $.ajax({
            type: "POST",
            url: "/c-editor/topic/insert",
            contentType: "application/json",
            dataType: "json",
            data : JSON.stringify({
					"title":$("#title").val(),
					"question":"题目描述:\n"+$("#1").val()+"\nInput:\n"+$("#2").val()+"\nOutput:\n"+$("#3").val()+"\nSample Input:\n"+$("#4").val()+"\nSample Output\n"+$("#5").val(),
					"answer":"["+aw+"]",
					"topic_set":$("#topic_set").get(0).selectedIndex
					
				}),

				//成功的回调函数
				success : function(data) {
					console.log(data)
					alert("提交成功！！！");
				},
				//失败的回调函数
				error : function() {
					console.log("error")
					alert("提交失败！！！");
				}

        });
	  });
	});
</script>
  </body>
</html>