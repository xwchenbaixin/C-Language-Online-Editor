<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 主文件 -->
<link rel="shortcut icon" href="javascript:void(0);" />
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
<div class="topic" id="topic"> 
	<div class="head" id="head">
		<input type="button" id="topic-set" class="btn btn-warning" value="题目集"/>
		<input type="button" id="topic-detail" class="btn btn-warning" value="题目信息"/>
		<input type="button" id="search" class="btn btn-warning" value="搜索"/>
		
		<input type="button" id="submit" class="btn btn-warning submit" value="提交"/>
		<input type="button" id="compile" class="btn btn-warning compile" value="运行"/>	
		<input type="button" id="save" class="btn btn-warning save" value="保存"/>	
	</div>
	<div class="content" id="topic_set_content" style="display:none;">
	</div>
	
	<div class="content" id="topic_detail_content" >
		<textarea id="topic_detail" readonly></textarea>
		<div class="result rtDetail" id="rtDetail">
			<div class="closeBar">
				<input type="button" class="btn rtClose" value="控制台" style="float:left;">
				<input type="button" class="btn rtClose" id="rtClose" value="关闭">
			</div>
			<textarea id="input" class="input" placeholder="请输入参数..."></textarea>
			
			<textarea id="output" class="output" readonly></textarea>
		</div>
		<div class="result" id="result">
			<input type="button" class="btn rtClose" style="width:100%;" value="显示结果"  id="rtShow">
		</div>
	</div>
	<div class="content" id="search_content"  style="display:none">
	</div>
	
	
</div>
<div class="editor-div" id="editor-div">
	<textarea class="form-control" id="codeEditor" name="codeEditor"></textarea>
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
function initEditor(){
	$.ajax({
		type : "POST", //发送是以POST还是GET
		url : "/c-editor/cEditor/initEditor", //发送的地址
		dataType : "json", //传输数据的格式
		contentType: "application/json",
		data : JSON.stringify({
			"id":topic,
			"topic_set":topic_set
		}),
		//成功的回调函数
		success : function(data) {
			//topic_detail_content
			$("#topic_detail").append(data.topic.question);
			var topic_set_content="";
			topic_set_content=
				'<div class="menu__body">'+
	      			'<ul class="nav">'+
					'<li class="nav__item" onclick="cg(this)">'	+ 
			          '<a href="javascript:void(0);" class="nav__item-link is-active" >'					+
			            '<i class="fa fa-envelope nav__item-icon"></i>'					+
			            '<span class="nav__item-text">'+data.topic_set.name+'</span>'		+
			            '<span class="badge badge--warning">'+data.topic_set.submit+'</span>'					+
			            '<span style="float:right;">总提交:</span>'						+
			          '</a>'															+   
			        '</li>';
			$.each(data.topicList,function(key,val){
				topic_set_content+=
					'<li class="nav__item" onclick="questionDetail(1)">'	+
			          '<a href="/c-editor/editor.jsp?topic_set='+val.topic_set+'&topic='+val.id+'" class="nav__item-link">'					+
			            '<i class="fa fa-flag nav__item-icon"></i>'			+
			            '<span class="nav__item-text nav__topic__title">'+val.title+'</span>'		+
			            '<span class="badge">'+val.submit+'</span>'			+
			            '<span style="float:right;">提交:</span>'			+
			          '</a>'												+
			        '</li>';
				
			})
			
			topic_set_content+=
					'</ul>'+
				'</div>';
			$("#topic_set_content").html(topic_set_content);
			editor.setValue(data.user_code==null?"":data.user_code);
		},
		//失败的回调函数
		error : function() {
			alert("请求失败");
		}
	})
}

$(document).ready(function(){
	initEditor();
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
		
		$("#submit").click(function(){
			$("#rtDetail").show(100);
			$("#submit").attr("disabled",true);
			$("#submit").addClass("compiled");
			$("#output").val("正在运行中...");
			$.ajax({
				type : "POST", //发送是以POST还是GET
				url : "/c-editor/cEditor/submit", //发送的地址
				dataType : "json", //传输数据的格式
				contentType: "application/json",
				data : JSON.stringify({
					"id":topic,
					"topic_set":topic_set,
					"code":editor.getValue()
				}),
				//成功的回调函数
				success : function(data) {
					$("#submit").attr("disabled",false);
					$("#submit").removeClass("compiled");
					if(data.code!=1)
						$("#output").val("提交失败！\n"+data.info);
					else
						$("#output").val("提交成功！\n成绩："+data.score);
				},
				//失败的回调函数
				error : function() {
					$("#submit").attr("disabled",false);
					$("#submit").removeClass("compiled");
					$("#output").val("提交失败！");
				}
			})
		})
		
		$("#save").click(function(){
			$("#rtDetail").show(100);
			$("#save").attr("disabled",true);
			$("#save").addClass("compiled");
			$.ajax({
				type : "POST", //发送是以POST还是GET
				url : "/c-editor/cEditor/save", //发送的地址
				dataType : "json", //传输数据的格式
				contentType: "application/json",
				data : JSON.stringify({
					"id":topic,
					"code":editor.getValue()
				}),
				//成功的回调函数
				success : function(data) {
					$("#save").attr("disabled",false);
					$("#save").removeClass("compiled");
					if(data.code!=1)
						$("#output").val("保存失败！\n"+data.info);
					else
						$("#output").val(data.info);
				},
				//失败的回调函数
				error : function() {
					$("#save").attr("disabled",false);
					$("#save").removeClass("compiled");
					$("#output").val("保存失败！");
				}
			})
		})
		
	})
	
	

</script>
</html>