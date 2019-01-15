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

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" media="screen" type="text/css" />
<script src="bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/style.default.css" media="screen" type="text/css" />
<!-- 菜单文件 -->
<link rel="stylesheet" href="css/editor.css" media="screen" type="text/css" />

</head>
<body >
<div class="topic" id="topic"> 
	<div class="head" id="head">
		<input type="button" id="topic-detail" class="btn btn-warning" value="题目信息"/>	
	</div>
	<div class="content" id="topic_set_content" style="display:none;">
	</div>
	
	<div class="content" id="topic_detail_content" >
		<textarea id="topic_detail" readonly></textarea>
		<div class="result rtDetail" id="rtDetail" style="display:block;height:70%;">
			<div class="closeBar">
				<input type="button" class="btn rtClose" value="用户得分详情" style="float:left;">
				<input type="button" class="btn rtClose" id="rtClose" value="关闭">
			</div>
			<div id="userScoreDetail" style="overflow-y: auto;overflow-x: hidden;height: 100%;padding: 10px;">
				<
			</div>
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
var topic_id=<%=request.getParameter("topic_id")%>;
var user_id=<%=request.getParameter("user_id")%>;


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
	readOnly: true,        //只读
	
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
function initViewEditor(){
	$.ajax({
		type : "POST", //发送是以POST还是GET
		url : "/c-editor/cEditor/initViewEditor", //发送的地址
		dataType : "json", //传输数据的格式
		contentType: "application/json",
		data : JSON.stringify({
			"topic_id":topic_id,
			"user_id":user_id
			
		}),
		//成功的回调函数
		success : function(data) {
			//topic_detail_content
			$("#topic_detail").append(data.topic.question);
			var html='<div id="defen" class="form-group row">';
      
              
			$.each(data.scores,function(key,val){
				console.log(val)
				html+='<label class="col-sm-3 form-control-label" style="text-align: center;">得分</br></br><input id="score'+key+'" class="form-control" value="'+val.score+'" style="text-align: center;"></label>'+
                	 '<div class="col-sm-9" style="margin-bottom: 20px;">'+
		               '<textarea readonly id="input" class="form-control" style="height:100px;" rows="3" >输入：\n'+val.input+'</textarea>'+
		               '<textarea readonly id="answerOutput" class="form-control" style="height:100px;" rows="3" >答案:\n'+val.output+'</textarea>';
		       	if(val.isRight==false)
            	   	html+='<textarea readonly id="userOutput" class="form-control" style="height:100px;color:red;" rows="3" >用户答案:\n'+val.user_output+'</textarea>';
           	   	else
           		   	html+='<textarea readonly id="userOutput" class="form-control" style="height:100px;" rows="3" >用户答案:\n'+val.user_output+'</textarea>';
            	html+='</div>';
			})
			html+='</div>';
			$("#userScoreDetail").html(html);
			editor.setValue(data.user_code==null?"":data.user_code);
		},
		//失败的回调函数
		error : function() {
			alert("请求失败");
		}
	})
}

$(document).ready(function(){
	initViewEditor();
	
	$("#rtClose").click(function(){
		$("#rtDetail").hide(100);
	})
	
	$("#rtShow").click(function(){
		$("#rtDetail").show(100);
	})
	
})

</script>
</html>