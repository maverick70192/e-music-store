package com.music.data.repository;

import java.io.IOException;

import com.music.model.Cart;

public interface CartRepository {
	Cart getCartById(Long id);
	Cart validate(Long cartId) throws IOException;
	void updateCart(Cart cart);
}
