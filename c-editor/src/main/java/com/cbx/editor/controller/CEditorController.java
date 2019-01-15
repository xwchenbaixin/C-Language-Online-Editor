package com.cbx.editor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.cbx.editor.beans.Detail;
import com.cbx.editor.beans.Editor;
import com.cbx.editor.beans.Topic;
import com.cbx.editor.service.CEditorService;
import com.cbx.editor.tools.Gcc;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
@RequestMapping("/cEditor")
public class CEditorController {
	@Autowired
	private CEditorService cEditorService;

	// 编辑器处理
	@RequestMapping("initEditor")
	@ResponseBody
	public Map<String, Object> initEditor(@RequestBody Topic topic) {
		int user_id=11;
		topic.setUser_id(user_id);
		Map<String, Object> data = new HashMap<>();
		data=cEditorService.initEditor(topic);
		
		return data;
	}

	@RequestMapping("initViewEditor")
	@ResponseBody
	public Map<String, Object> initViewEditor(@RequestBody Detail detail) {
		Map<String, Object> data = new HashMap<>();
		data=cEditorService.initViewEditor(detail);
		
		return data;
	}
	
	@RequestMapping("submit")
	@ResponseBody
	public Map<String, Object> submit(@RequestBody Editor editor) {
		Map<String,Object> res=new HashMap<>();
		if(editor.getCode().isEmpty()) {
			res.put("info", "代码不为空");
			res.put("code", 0);
			return res;
		}
		int userid=11;
		
		Integer isSubmited=cEditorService.isSubmited(editor.getId(),userid);
		if(isSubmited==1) {
			res.put("info", "请勿再次提交！");
			res.put("code", 2);
			return res;
		}
		
		Integer isSaved=cEditorService.isSaved(editor.getId(),userid);
		if(isSaved!=null) {
			cEditorService.deleteDetail(isSaved);
		}
		
		String ansJson=cEditorService.getAnswer(editor.getId());
		List<Map> ansList=new ArrayList<Map>();
		ansList=JSONArray.parseArray(ansJson, Map.class);
		double score=0;
		
		Map<String,Object> ret;
		List<Map<String,Object>> userAnswerList=new ArrayList<>();
		for(Map ans:ansList) {
			Map<String,Object> userAnswer=new HashMap<>();
			String input=(String) ans.get("input").toString();
			String aOutput=(String) ans.get("output").toString();
			double sc=Double.valueOf(ans.get("score").toString());
			editor.setParams(input);
			ret=new Gcc(editor).run();
			String rOutput=(String) ret.get("output");
			
			while(true) {
				int rOutputLen=rOutput.length();
				if(rOutput.charAt(rOutputLen-1)=='\n'&&rOutput.charAt(rOutputLen-2)!='\r')
					rOutput=rOutput.substring(0,rOutputLen-1);
				else if(rOutput.charAt(rOutputLen-1)=='\n'&&rOutput.charAt(rOutputLen-2)=='\r')
					rOutput=rOutput.substring(0,rOutputLen-2);
				else
					break;
			}
			userAnswer.put("input", input==null?"":input);
			userAnswer.put("output",aOutput);
			userAnswer.put("user_output", rOutput);
			userAnswer.put("score",sc);
			if(rOutput.equals(aOutput)) {
				score+=sc;
				userAnswer.put("isRight", true);
			}
			else {
				userAnswer.put("isRight", false);
			}
			userAnswerList.add(userAnswer);
		}
		//
		String userAnswer=JSON.toJSONString(userAnswerList);
		Detail detail=new Detail();
		detail.setUser_id(userid);
		detail.setTopic_id(editor.getId());
		detail.setUser_score(score);
		detail.setUser_code(editor.getCode());
		detail.setUser_answer(userAnswer);
		detail.setState(1);
		cEditorService.insertDetail(detail);
		
		cEditorService.addSubmit(editor);
		
		res.put("info", "提交成功！");
		res.put("score", score);
		res.put("code", 1);
		return res;
	}
	
	@RequestMapping("compile")
	@ResponseBody
	public Map<String, Object> compile(@RequestBody Editor editor) {
		Map<String,Object> res=new HashMap<>();
		if(editor.getCode().isEmpty()) {
			res.put("info", "代码不为空");
			res.put("code", 0);
			return res;
		}
		res=new Gcc(editor).run();
		res.put("code", 1);
		return res;
	};

	@RequestMapping("save")
	@ResponseBody
	public Map<String, Object> save(@RequestBody Editor editor) {
		Map<String, Object> res = new HashMap<>();
		int userid=11;
		int isSubmited=cEditorService.isSubmited(editor.getId(),userid);
		if(isSubmited==1) {
			res.put("info", "保存失败，已提交！");
			res.put("code", 2);
			return res;
		}
		
		
		Integer isSaved=cEditorService.isSaved(editor.getId(),userid);
		if(isSaved!=null) {
			cEditorService.updateDetail(isSaved,editor.getCode());
		}
		else {
			Detail detail=new Detail();
			detail.setUser_id(userid);
			detail.setTopic_id(editor.getId());
			detail.setUser_code(editor.getCode());
			detail.setState(0);
			cEditorService.insertDetail(detail);
		}
		res.put("info", "保存成功！");
		res.put("code", 1);
		return res;
		
	};
}
