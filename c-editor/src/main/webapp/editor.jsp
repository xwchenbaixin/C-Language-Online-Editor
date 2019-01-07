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
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

<style>
	.CodeMirror{
		width:100%;height:100%;
	}
	
	body{
		width:100%;
		height:100%;
		padding:0;
		margin:0;
	}
	html{
		width:100%;
		height:100%;
	}
	.question{
		position:relative;
		background-color:gray;
		float:left;
		height:100%;
		width:40%;
	}
	.editor-div{
		width:60%;
		height:100%;
		float:left;
	}
	.head{
		height:35px;
		width:100%;
		position:absolute;
		background: #4B4F55;
    	border-bottom: 1px solid #353A40;
	}
	.content{
		height:100%;
		width:100%;
		padding-top:35px;
		padding-bottom:35px;
		background-color:white;
		overflow-x:hidden;
		overflow-y:auto;
		box-sizing:border-box;  
		-moz-box-sizing:border-box; /* Firefox */  
		-webkit-box-sizing:border-box; /* Safari */  
	}
	.result{
		height:35px;
		width:100%;
		position:absolute;
		bottom:0px;
		background-color:#40a7ff;
	}
	.btn-warning{
		background-color:#40a7ff;
		border-color:#40a7ff;
	}
	.save,.submit,.compile{
		float:right;
	}
</style>

</head>
<body >
<div class='question' id='question'> 
	<div class='head' id='head'>
		<input type='button' class='btn btn-warning' value="题目集"/>
		<input type='button' class='btn btn-warning' value="题目信息"/>
		<input type='button' class='btn btn-warning' value="搜索"/>
		
		<input type='button' class='btn btn-success submit' value="提交"/>
		<input type='button' class='btn btn-warning compile' value="运行"/>	
		<input type='button' class='btn btn-warning save' value="保存"/>	
	</div>
	<div class='content' id='content'>
	    <div class="menu__body">
	      <ul class="nav">
	        <li class="nav__item">
	          <a href="#" class="nav__item-link is-active">
	            <i class="fa fa-envelope nav__item-icon"></i>
	            <span class="nav__item-text">News</span>
	            <span class="badge badge--warning">32</span>
	          </a>   
	        </li>
	        <li class="nav__item">
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
	          <li class="nav__item">
	          <a href="#" class="nav__item-link">
	            <span class="nav__item-text">Show all</span>
	          </a>   
	        </li>
	      </ul>
	    </div>
	</div>
	<div class='result' id='result'>
		
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
</script>
</html>