package com.music.data.repository;

import com.music.model.Cart;
import com.music.model.CartItem;

public interface CartItemRepository {
	CartItem getCartItemByProductId(Long productId);
	void addCartItem(CartItem cartItem);
	void removeCartItem(CartItem cartItem);
	void removeAllCartItems(Cart cart);
}
