package com.music.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showHomePage() {
		return "home";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String showAboutPage() {
		return "about";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, 
			Model model) {
		if(error != null) {
			model.addAttribute("error", "Invalid username and password!");
		}
		
		if(logout != null) {
			model.addAttribute("message", "You have been logged out successfully.");
		}
		
		return "login";
	}
}
