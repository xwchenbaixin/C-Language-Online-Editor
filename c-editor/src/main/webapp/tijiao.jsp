<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/c-editor/vendor/jquery/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	  $("#send").click(function(){
	    
        $.ajax({
            type: "POST",
            url: "/c-editor/topic/insert",
            contentType: "application/json",
            dataType: "json",
            data : JSON.stringify({
					"id":$("#id").val(),
					"title":$("#title").val(),
					"question":$("#question").val(),
					"answer":$("#answer").val(),
					"user_id":$("#user_id").val()
				}),

				//成功的回调函数
				success : function(data) {
					console.log(data)
				},
				//失败的回调函数
				error : function() {
					console.log("error")
				}

        });
	  });
	});
</script>
</head>
<body>
id:<input id="id" type="number">
title:<input id="title">
question:<input id="question">
answer:<input id="answer">
user_id:<input id="user_id" type="number">
<button id="send">提交</button>
</body>


</html>
