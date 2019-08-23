package com.music.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.data.repository.CartItemRepository;
import com.music.model.Cart;
import com.music.model.CartItem;

@Service
public class CartItemServiceImpl implements CartItemService {

	@Autowired
	private CartItemRepository cartItemRepository;
	
	@Override
	public void addCartItem(CartItem cartItem) {
		cartItemRepository.addCartItem(cartItem);
	}

	@Override
	public void removeCartItem(CartItem cartItem) {
		cartItemRepository.removeCartItem(cartItem);
	}

	@Override
	public void removeAllCartItems(Cart cart) {
		cartItemRepository.removeAllCartItems(cart);
	}

	@Override
	public CartItem getCartItemByProductId(Long productId) {
		return cartItemRepository.getCartItemByProductId(productId);
	}

}
