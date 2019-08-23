package com.music.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.music.data.service.CustomerService;
import com.music.data.service.ProductService;
import com.music.model.Product;

@Controller
@RequestMapping(value = "/products")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getProductsBySearchCondition(@RequestParam String searchCondition, Model model) {
		List<Product> products = productService.getProductList();
		
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("products", products);
		
		return "products";
	}
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String getProducts(Model model) {
		List<Product> products = productService.getProductList();
		model.addAttribute("products", products);
		
		return "products";
	}
	
	@RequestMapping(value = "/product/{productId}", method = RequestMethod.GET)
	public String getProduct(@PathVariable Long productId, @AuthenticationPrincipal Authentication activeUser, Model model) {
		Product product = productService.getProductById(productId);
		model.addAttribute(product);
		
		if(activeUser != null) {
			Collection<? extends GrantedAuthority> authorities = activeUser.getAuthorities();
			
			List<String> roles = new ArrayList<String>();
			
			for(GrantedAuthority authority : authorities) {
				roles.add(authority.getAuthority());
			}
			
			if(roles.contains("ROLE_USER")) {
				Long cartId = customerService.getCustomerByUsername(activeUser.getName()).getCart().getId();
				model.addAttribute("role", "ROLE_USER");
				model.addAttribute("cartId", cartId);
			}
		}
		
		return "product";
	}
}
