package com.music.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.music.model.ForgotPassword;

@Controller
public class ForgotPasswordController {
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public String showForgotPasswordPage(Model model) {
		model.addAttribute(new ForgotPassword());
		return "forgot_password";
	}
}
