<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%> <!--数据格式化标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql"%> <!--数据库相关标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%> <!--常用函数标签库-->
<%@ page isELIgnored="false"%> <!--支持EL表达式，不设的话，EL表达式不会解析-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>程序设计(C语言)在线编译系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/c-editor/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="/c-editor/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="/c-editor/css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="/c-editor/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="/c-editor/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/c-editor/img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
     <link rel="shortcut icon" href="/c-editor/javascript:void(0);" />
<link rel="stylesheet" href="/c-editor/codemirror/lib/codemirror.css"/>
<script src="/c-editor/codemirror/lib/codemirror.js"></script>

<!--编辑器高亮-->
<script src="/c-editor/codemirror/mode/clike.js"></script>
<script src="/c-editor/codemirror/mode/groovy.js"></script>

<!--主题-->
<link rel="stylesheet" href="/c-editor/codemirror/theme/blackboard.css"/>

<!--代码折叠-->
<link rel="stylesheet" href="/c-editor/codemirror/addon/fold/foldgutter.css"/>
<script src="/c-editor/codemirror/addon/fold/foldcode.js"></script>
<script src="/c-editor/codemirror/addon/fold/foldgutter.js"></script>
<script src="/c-editor/codemirror/addon/fold/brace-fold.js"></script>
<script src="/c-editor/codemirror/addon/fold/comment-fold.js"></script>

<link rel="stylesheet" href="/c-editor/codemirror/addon/hint/show-hint.css">
<script src="/c-editor/codemirror/addon/hint/show-hint.js"></script>

<script src="/c-editor/codemirror/addon/edit/matchbrackets.js"></script>

<script src="/c-editor/js/jquery-3.3.1.min.js"></script>


<!-- 菜单文件 -->
<link rel="stylesheet" href="/c-editor/css/editor.css" media="screen" type="text/css" />
  </head>
  <body>
    <div class="page">
      <!-- Main Navbar-->


      <header class="header"><!-- Header -->
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
                        <div class="msg-profile"> <img src="/c-editor/img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="msg-body">
                          <h3 class="h5">Jason Doe</h3><span>Sent You Message</span>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                        <div class="msg-profile"> <img src="/c-editor/img/avatar-2.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="msg-body">
                          <h3 class="h5">Frank Williams</h3><span>Sent You Message</span>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                        <div class="msg-profile"> <img src="/c-editor/img/avatar-3.jpg" alt="..." class="img-fluid rounded-circle"></div>
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
      </header><!-- Header End -->


      <div class="page-content d-flex align-items-stretch"> <!-- Page Header-Under -->
        

        <!-- Side Navbar 侧边栏 -->
        <nav class="side-navbar">
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><img src="/c-editor/img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
            <div class="title">
            

            	<h1 class="h4"><%= request.getSession().getAttribute("Teachername")%></h1>
            
              
             <!--<c:out value="${sessionScope.Teachername }"></c:out>-->
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
          <ul class="list-unstyled">
                    <li class="active"><a><i class="icon-screen"></i>编译器</a></li>
                    <li><a href="teachergetAllTopicSet?username=${username }"> <i class="icon-grid"></i>习题集 </a></li>
                    <li><a href="upload"> <i class="icon-website"></i>上传习题 </a></li>
                    <c:if test="${sessionScope.Teacherid<2 }">
                    <li><a href="control2"> <i class="fa fa-bar-chart"></i>习题管理 </a></li>
                    <li><a href="control"> <i class="fa fa-bar-chart"></i>用户管理 </a></li>
                    </c:if>
                    
          </ul>
        </nav>
        <!-- Side Navbar End -->


        <div class="content-inner" style="padding:0;"><!-- Content-inner 主页内容-->
         
		
         <div class="editor-div" id="editor-div" style="width:100%;position: relative;">
			<textarea class="form-control" id="codeEditor" name="codeEditor"></textarea>
			<div class="result rtDetail" id="rtDetail" style="z-index: 3;">
					<div class="closeBar">
						<input type="button" class="btn rtClose" value="控制台" style="float:left;">
						<input type="button" class="btn rtClose" id="rtClose" value="关闭">
					</div>
					<textarea id="input" class="input" placeholder="请输入参数..."></textarea>
					
					<textarea id="output" class="output" readonly></textarea>
				</div>
			<div class="result" id="result" style="z-index: 3;">
				<input type="button" class="btn rtClose" style="width:70%;float:left;" value="显示结果"  id="rtShow">
				<input id="compile" type="button" class="btn rtClose" style="width:30%;float:left;" value="运行"  id="rtShow">
			
			</div>
		</div>
         
          
          
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="/c-editor/vendor/jquery/jquery.min.js"></script>
    <script src="/c-editor/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="/c-editor/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/c-editor/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="/c-editor/vendor/chart.js/Chart.js"></script>
    <script src="/c-editor/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="/c-editor/js/charts-home.js"></script>
    <!-- Main File-->
    <script src="/c-editor/js/front.js"></script>
    
<script type="text/javascript">
var topic=<%=request.getParameter("topic")%>;
var topic_set=<%=request.getParameter("topic_set")%>;


var editor = CodeMirror.fromTextArea(document.getElementById("codeEditor"), {
	mode: "text/clike", //实现c代码高亮
	mode: "text/x-c",
	lineNumbers: true,	//显示行号
	theme: "blackboard",	//设置主题
	foldGutter: true,
	gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"],
	matchBrackets: true,	//括号匹配
	smartIndent : true,  // 是否智能缩进
	indentUnit:4,
	autofocus: true,
	//readOnly: true,        //只读
	
});
function cg(a){
	if($(a).next().css("display")=="none")
		$(a).nextAll().show();
	else
		$(a).nextAll().hide();
}
function questionDetail(id){
	
}
function rtClose(){
	$("#rtDetail").hide(100);
}

$(document).ready(function(){
	
	$("#rtClose").click(function(){
		$("#rtDetail").hide(100);
	})
	
	$("#rtShow").click(function(){
		$("#rtDetail").show(100);
	})
	$("#compile").click(function(){
		$("#rtDetail").show(100);
		$("#compile").attr("disabled",true);
		$("#compile").addClass("compiled");
		$("#output").val("正在运行中...");
		var params=$("#input").val();
		if(params=='')
			params=null;
		$.ajax({
			type : "POST", //发送是以POST还是GET
			url : "/c-editor/cEditor/compile", //发送的地址
			dataType : "json", //传输数据的格式
			contentType: "application/json",
			data : JSON.stringify({
				"id":topic,
				"code":editor.getValue(),
				"params":$("#input").val()
			}),
			//成功的回调函数
			success : function(data) {
				$("#compile").attr("disabled",false);
				$("#compile").removeClass("compiled");
				
				if(data.code!=1)
					$("#output").val("运行失败！\n"+data.info);
				else
					$("#output").val("Error:\n"+data.error+"Runtime:"+data.runtime+"ms\nOutput:\n"+data.output);
				
				
			},
			//失败的回调函数
			error : function() {
				$("#compile").attr("disabled",false);
				$("#compile").removeClass("compiled");
				$("#output").val("提交失败！");
			}
			})
		})
		
	})
	
	

</script>
  </body>
</html>