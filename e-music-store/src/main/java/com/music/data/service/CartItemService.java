package com.music.data.service;

import com.music.model.Cart;
import com.music.model.CartItem;

public interface CartItemService {
	CartItem getCartItemByProductId(Long productId);
	void addCartItem(CartItem cartItem);
	void removeCartItem(CartItem cartItem);
	void removeAllCartItems(Cart cart);
}
