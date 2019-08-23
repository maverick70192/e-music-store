package com.music.data.repository;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.music.model.Cart;
import com.music.model.CartItem;

@Repository
@Transactional
public class CartItemRepositoryImpl implements CartItemRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void addCartItem(CartItem cartItem) {
		Session session = currentSession();
		session.saveOrUpdate(cartItem);
		session.flush();
	}

	@Override
	public void removeCartItem(CartItem cartItem) {
		Session session = currentSession();
		session.delete(cartItem);
		session.flush();
	}

	@Override
	public void removeAllCartItems(Cart cart) {
		List<CartItem> cartItems = cart.getCartItems();
		for(CartItem cartItem : cartItems) {
			removeCartItem(cartItem);
		}
	}

	@Override
	public CartItem getCartItemByProductId(Long productId) {
		Session session = currentSession();
		CartItem cartItem = null;
		Query query = session.createQuery("from CartItem where productId = :productId");
		query.setParameter("productId", productId);
		query.setFirstResult(0);
		cartItem = (CartItem) query.getSingleResult();
		System.out.println(cartItem);
		session.flush();
		return cartItem;
	}

}
