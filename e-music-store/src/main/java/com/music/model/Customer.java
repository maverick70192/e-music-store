package com.music.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.music.annotation.EmailExist;
import com.music.annotation.UsernameExist;

@Entity
public class Customer implements Serializable {
	private static final long serialVersionUID = 57622554010983958L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotEmpty(message = "The customer name must not be null.")
	private String name;
	
	@NotEmpty(message = "The customer email must not be null.")
	@EmailExist(message = "This email already exist.")
	private String email;

	private String securityQuestion;
	@NotEmpty(message="The security answer must not be null.")
	private String answer;
	
	private String phone;
	
	@NotEmpty(message = "The customer username must not be null.")
	@UsernameExist(message = "This username already exist.")
	private String username;
	
	@NotEmpty(message = "The customer password must not be null.")
	private String password;
	
	private boolean enabled;
	
	@OneToOne
	@JoinColumn(name = "billingAddressId")
	private BillingAddress billingAddress;
	
	@OneToOne
	@JoinColumn(name = "shippingAddressId")
	private ShippingAddress ShippingAddress;
	
	@OneToOne
	@JoinColumn(name = "cartId")
	@JsonIgnore
	private Cart cart;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
}
