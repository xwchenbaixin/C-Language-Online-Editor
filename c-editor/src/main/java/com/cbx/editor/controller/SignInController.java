package com.cbx.editor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cbx.editor.beans.User;
import com.cbx.editor.service.SignInService;

@Controller
public class SignInController {
	@Autowired
	private SignInService signInService;
	
	@RequestMapping("signIn")
	public String signIn(User user) {
		return "login";
	}
}
