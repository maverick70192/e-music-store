package com.music.data.service;

import com.music.model.Cart;

public interface CartService {
	Cart getCartById(Long id);
	void updateCart(Cart cart);
}
