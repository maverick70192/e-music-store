package com.music.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.music.data.service.CartService;
import com.music.data.service.CustomerOrderService;
import com.music.model.Cart;
import com.music.model.Customer;
import com.music.model.CustomerOrder;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CustomerOrderService customerOrderService;
	
	@RequestMapping(value = "/order/{cartId}", method = RequestMethod.GET)
	public String createOrder(@PathVariable Long cartId) {
		CustomerOrder customerOrder = new CustomerOrder();
		Cart cart = cartService.getCartById(cartId);
		customerOrder.setCart(cart);
		
		
		Customer customer = cart.getCustomer();
		customerOrder.setCustomer(customer);
		customerOrder.setBillingAddress(customer.getBillingAddress());
		customerOrder.setShippingAddress(customer.getShippingAddress());
		
		customerOrderService.addCustomerOrder(customerOrder);
		
		return "redirect:/checkout?cartId=" + cartId;
	}
}
