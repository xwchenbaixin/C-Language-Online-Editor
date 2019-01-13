package com.cbx.editor.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbx.editor.beans.Topic;
import com.cbx.editor.service.CEditorService;
import com.cbx.editor.tools.Gcc;

@Controller
@RequestMapping("/cEditor")
public class CEditorController {
	@Autowired
	private CEditorService cEditorService;

	// ±à¼­Æ÷´¦Àí
	public Map<String, Object> initEditor(String id) {
		Map<String, Object> data = null;
		return data;
	};

	@RequestMapping("submit")
	@ResponseBody
	public Map<String, Object> submit(String code) {
		Gcc gcc=new Gcc();
		Map<String,Object> res=gcc.run(code);
		return res;
	};
	
	@RequestMapping("compile")
	@ResponseBody
	public Map<String, Object> compile(String code) {
		Gcc gcc=new Gcc();
		Map<String,Object> res=gcc.run(code);
		return res;
	};

	public Map<String, Object> save(String text) {
		Map<String, Object> data = null;
		return data;
	};
}
