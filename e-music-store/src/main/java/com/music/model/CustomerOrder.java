package com.music.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class CustomerOrder implements Serializable {
	private static final long serialVersionUID = 5269571548578766379L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@OneToOne
	@JoinColumn(name = "cartId")
	private Cart cart;

	@OneToOne
	@JoinColumn(name = "customerId")
	private Customer customer;
	
	@OneToOne
	@JoinColumn(name = "billingAddressId")
	private BillingAddress billingAddress;
	
	@OneToOne
	@JoinColumn(name = "shippingAddressId")
	private ShippingAddress ShippingAddress;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public BillingAddress getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(BillingAddress billingAddress) {
		this.billingAddress = billingAddress;
	}

	public ShippingAddress getShippingAddress() {
		return ShippingAddress;
	}

	public void setShippingAddress(ShippingAddress shippingAddress) {
		ShippingAddress = shippingAddress;
	}
	
}
