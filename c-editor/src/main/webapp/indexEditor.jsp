<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 主文件 -->
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
<body >
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
</body>
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
</html>