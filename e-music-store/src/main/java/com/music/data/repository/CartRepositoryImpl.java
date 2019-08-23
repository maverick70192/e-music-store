package com.music.data.repository;

import java.io.IOException;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.music.data.service.CustomerOrderService;
import com.music.model.Cart;

@Repository
@Transactional
public class CartRepositoryImpl implements CartRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private CustomerOrderService customerOrderService;
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public Cart getCartById(Long id) {
		Cart cart = null;
		Session session = currentSession();
		cart = session.get(Cart.class, id);
		session.flush();
		return cart;
	}

	@Override
	public void updateCart(Cart cart) {
		Long cartId = cart.getId();
		double grandTotal = customerOrderService.getCustomerOrderGrandTotal(cartId);
		cart.setGrandTotal(grandTotal);
		
		Session session = currentSession();
		session.saveOrUpdate(cart);
		session.flush();
	}

	@Override
	public Cart validate(Long cartId) throws IOException {
		Cart cart = getCartById(cartId);
		if(cart == null || cart.getCartItems().size() == 0) {
			throw new IOException(cartId.toString());
		}
		
		updateCart(cart);
		return cart;
	}

}
