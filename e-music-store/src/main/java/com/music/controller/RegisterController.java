package com.music.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.music.data.service.CustomerService;
import com.music.model.BillingAddress;
import com.music.model.Customer;
import com.music.model.ShippingAddress;

@Controller
public class RegisterController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegisterPage(Model model) {
		Customer customer = new Customer();
		BillingAddress billingAddress = new BillingAddress();
		ShippingAddress shippingAddress = new ShippingAddress();
		customer.setBillingAddress(billingAddress);
		customer.setShippingAddress(shippingAddress);
		
		model.addAttribute(customer);
		
		return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String processRegisterPage(@Valid @ModelAttribute Customer customer, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "register";
		}
		
		customer.setEnabled(true);
		
		customerService.addCustomer(customer);
		
		return "register_customer_success";
	}
}
