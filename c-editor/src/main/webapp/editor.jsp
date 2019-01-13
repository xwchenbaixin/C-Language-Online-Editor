<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 主文件 -->
<link rel="shortcut icon" href="#" />
<link rel="stylesheet" href="codemirror/lib/codemirror.css"/>
<script src="codemirror/lib/codemirror.js"></script>

<!--编辑器高亮-->
<script src="codemirror/mode/clike.js"></script>
<script src="codemirror/mode/groovy.js"></script>

<!--主题-->
<link rel="stylesheet" href="codemirror/theme/blackboard.css"/>

<!--代码折叠-->
<link rel="stylesheet" href="codemirror/addon/fold/foldgutter.css"/>
<script src="codemirror/addon/fold/foldcode.js"></script>
<script src="codemirror/addon/fold/foldgutter.js"></script>
<script src="codemirror/addon/fold/brace-fold.js"></script>
<script src="codemirror/addon/fold/comment-fold.js"></script>

<link rel="stylesheet" href="codemirror/addon/hint/show-hint.css">
<script src="codemirror/addon/hint/show-hint.js"></script>

<script src="codemirror/addon/edit/matchbrackets.js"></script>

<script src="js/jquery-3.3.1.min.js"></script>


<!-- 菜单文件 -->
<link rel="stylesheet" href="css/editor.css" media="screen" type="text/css" />

</head>
<body >
<div class='topic' id='topic'> 
	<div class='head' id='head'>
		<input type='button' id='topic-set' class='btn btn-warning' value="题目集"/>
		<input type='button' id='topic-detail' class='btn btn-warning' value="题目信息"/>
		<input type='button' id='search' class='btn btn-warning' value="搜索"/>
		
		<input type='button' id='submit' class='btn btn-warning submit' value="提交"/>
		<input type='button' id='compile' class='btn btn-warning compile' value="运行"/>	
		<input type='button' id='save' class='btn btn-warning save' value="保存"/>	
	</div>
	<div class='content' id='topic_set_content'>
	    <div class="menu__body">
	      <ul class="nav">
	        <li class="nav__item" onclick="cg(this)"> 
	          <a href="#" class="nav__item-link is-active" >
	            <i class="fa fa-envelope nav__item-icon"></i>
	            <span class="nav__item-text">News</span>
	            <span class="badge badge--warning">32</span>
	            <span style="float:right;">总提交:</span>
	          </a>   
	        </li>
	        <li class="nav__item" onclick="questionDetail(1)">
	          <a href="#" class="nav__item-link">
	            <i class="fa fa-flag nav__item-icon"></i>
	            <span class="nav__item-text">Priority</span>
	            <span class="badge">8</span>
	          </a>   
	        </li>
	         <li class="nav__item">
	          <a href="#" class="nav__item-link">
	            <i class="fa fa-space-shuttle nav__item-icon"></i>
	            <span class="nav__item-text">Assigned</span>
	            <span class="badge">0/17</span>
	          </a>   
	        </li>
	        <li class="nav__item">
	          <a href="#" class="nav__item-link">
	            <i class="fa fa-archive nav__item-icon"></i>
	            <span class="nav__item-text">Archived</span>
	            <span class="badge">3</span>
	          </a>   
	        </li>
	        <li class="nav__item">
	          <a href="#" class="nav__item-link">
	            <i class="fa fa-trash nav__item-icon"></i>
	            <span class="nav__item-text">Deleted</span>
	            <span class="badge">9</span>
	          </a>   
	        </li>
	      
	    </div>
	</div>
	<div class='content' id='topic_detail_content' style='display:none'>
		<div class='result rtDetail' id='rtDetail'>
			<div style="height:31px;background:#40a7ff;	">
				<input type="button" class="btn rtClose" id="rtClose" value="关闭">
			</div>
			<div>
			</div>
		</div>
		<div class='result' id='result'>
			<input type="button" class="btn rtClose" style="width:100%;" value="显示结果"  id="rtShow">
		</div>
	</div>
	<div class='content' id='search_content'  style='display:none'>
	</div>
	
	
</div>
<div class='editor-div' id="editor-div">
	<textarea class="form-control" id="codeEditor" name="codeEditor"></textarea>
</div>
</body>
<script type="text/javascript">
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
	$("#topic-set").click(function(){
		$("#topic_set_content").css('display','block');
		$("#topic_detail_content").css('display','none');
		$("#search_content").css('display','none');
		
		$(this).css('color','#40a7ff');
		$("#topic-detail").css('color','white');
		$("#search").css('color','white');
	})
	$("#topic-detail").click(function(){
		$("#topic_set_content").css('display','none');
		$("#topic_detail_content").css('display','block');
		$("#search_content").css('display','none');
		
		$("#topic-set").css('color','white');
		$(this).css('color','#40a7ff');
		$("#search").css('color','white');
	})
	$("#search").click(function(){
		$("#topic_set_content").css('display','none');
		$("#topic_detail_content").css('display','none');
		$("#search_content").css('display','block');
		
		$("#topic-set").css('color','white');
		$("#topic-detail").css('color','white');
		$(this).css('color','#40a7ff');
	})
	
	$("#rtClose").click(function(){
		$("#rtDetail").hide(100);
	})
	
	$("#rtShow").click(function(){
		$("#rtDetail").show(100);
	})
	$("#compile").click(function(){
		$.ajax({
					type : "POST", //发送是以POST还是GET
					url : "/c-editor/cEditor/compile", //发送的地址
					dataType : "json", //传输数据的格式
					data : {
						"code":editor.getValue()
					}, //传输的数据
					//成功的回调函数
					success : function(data) {
						console.log(data)
					},
					//失败的回调函数
					error : function() {
						console.log("error")
					}
			})
		})

	})
</script>
</html>