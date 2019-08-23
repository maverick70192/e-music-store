package com.music.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.music.data.service.CustomerService;
import com.music.model.Cart;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String showCustomerHomePage() {
		return "customer_home";
	}
	
//	@RequestMapping(value="/{customerId}", method = RequestMethod.GET)
//	public String showCustomerProfileByCustomerId(@PathVariable Long customerId, Model model) {
//		model.addAttribute(customerService.getCustomerById(customerId));
//		return "customer_profile";
//	}
	
	@RequestMapping(value="/{username}", method = RequestMethod.GET)
	public String showCustomerProfileByUsername(@PathVariable String username, Model model) {
		model.addAttribute(customerService.getCustomerByUsername(username));
		return "customer_profile";
	}
}
