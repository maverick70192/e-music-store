package com.music.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.music.data.service.CartItemService;
import com.music.data.service.CartService;
import com.music.data.service.CustomerService;
import com.music.data.service.ProductService;
import com.music.model.Cart;
import com.music.model.CartItem;
import com.music.model.Customer;
import com.music.model.Product;

@RestController
@RequestMapping("/api/cart")
public class CartRestController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@RequestMapping(value = "/{cartId}", method = RequestMethod.GET)
	public @ResponseBody Cart getCartById(@PathVariable Long cartId) {
		return cartService.getCartById(cartId);
	}
	
	@RequestMapping(value = "/add/{productId}", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void addItem(@PathVariable Long productId, @AuthenticationPrincipal Authentication activeUser) {
		Customer customer = customerService.getCustomerByUsername(activeUser.getName());
		
		Cart cart = customer.getCart();
		
		Product product = productService.getProductById(productId);
		
		List<CartItem> cartItems = cart.getCartItems();
		
		for(CartItem cartItem : cartItems) {
			if(product.getId() == cartItem.getProduct().getId()) {
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				cartItem.setTotalPrice(product.getPrice() * cartItem.getQuantity());
				cartItemService.addCartItem(cartItem);
				return;
			}
		}
		
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setQuantity(1);
		cartItem.setTotalPrice(product.getPrice() * cartItem.getQuantity());
		cartItem.setCart(cart);
		
		cartItemService.addCartItem(cartItem);
	}
	
	@RequestMapping(value = "/remove/{productId}", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void removeItem(@PathVariable Long productId) {
		System.out.println("productId : " + productId);
		CartItem cartItem = cartItemService.getCartItemByProductId(productId);
		System.out.println(cartItem);
		cartItemService.removeCartItem(cartItem);
	}
	
	@RequestMapping(value = "/{cartId}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void clearCart(@PathVariable Long cartId) {
		Cart cart = cartService.getCartById(cartId);
		cartItemService.removeAllCartItems(cart);
		
	}
	
	@ExceptionHandler(IllegalArgumentException.class) 
	@ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload!")
	public void handleClientErrors(Exception e) {}
	
	@ExceptionHandler(Exception.class) 
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal server error!")
	public void handleServerErrors(Exception e) {}
}
