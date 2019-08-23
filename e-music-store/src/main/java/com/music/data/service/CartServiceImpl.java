package com.music.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.data.repository.CartRepository;
import com.music.model.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartRepository cartRepository;
	
	@Override
	public Cart getCartById(Long id) {
		return cartRepository.getCartById(id);
	}

	@Override
	public void updateCart(Cart cart) {
		cartRepository.updateCart(cart);
	}

}
