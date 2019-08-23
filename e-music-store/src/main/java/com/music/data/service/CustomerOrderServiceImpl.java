package com.music.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.data.repository.CustomerOrderRepository;
import com.music.model.Cart;
import com.music.model.CartItem;
import com.music.model.CustomerOrder;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {

	@Autowired
	private CustomerOrderRepository customerOrderRepository;
	
	@Autowired
	private CartService cartService; 
	
	@Override
	public void addCustomerOrder(CustomerOrder customerOrder) {
		customerOrderRepository.addCustomerOrder(customerOrder);
	}

	@Override
	public double getCustomerOrderGrandTotal(Long cartId) {
		double grandTotal = 0;
		Cart cart = cartService.getCartById(cartId);
		
		List<CartItem> cartItems = cart.getCartItems();
		
		for(CartItem cartItem : cartItems) {
			grandTotal += cartItem.getTotalPrice();
		}
		
		return grandTotal;
	}

}
