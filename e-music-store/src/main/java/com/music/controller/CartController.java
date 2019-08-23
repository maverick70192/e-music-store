package com.music.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.music.data.service.CustomerService;
import com.music.model.Customer;

@Controller
@RequestMapping("/customer/cart")
public class CartController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getCartPageUrl(@AuthenticationPrincipal Authentication activeUser) {
		Customer customer = customerService.getCustomerByUsername(activeUser.getName());
		Long cartId = customer.getCart().getId();
		
		return "redirect:/customer/cart/" + cartId;
	}
	
	@RequestMapping(value = "/{cartId}", method = RequestMethod.GET)
	public String showCartPage(@PathVariable Long cartId, Model model) {
		model.addAttribute("cartId", cartId);
		return "cart";
	}
	
}
