package com.music.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.music.data.repository.ProductRepository;
import com.music.data.service.CustomerService;
import com.music.data.service.ProductService;
import com.music.model.Customer;
import com.music.model.Product;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ServletContext servletContext;  
	
	@RequestMapping(method = RequestMethod.GET)
	public String showAdminHomePage() {
		return "admin_home";
	}
	
	@RequestMapping("/product-inventory/product/{productId}")
	public String getProduct(@PathVariable Long productId, Model model) {
		model.addAttribute(productService.getProductById(productId));
		return "admin_product";
	}
	
	@RequestMapping(value = "/product-inventory", method=RequestMethod.GET)
	public String showProductInventoryPage(Model model) {
		List<Product> list = productService.getProductList();
		model.addAttribute("products", list);
		return "product_inventory";
	}
	
	@RequestMapping(value = "/add-product", method = RequestMethod.GET)
	public String showAddProductPage(Model model) {
		model.addAttribute(new Product());
		return "add_product";
	}
	
	@RequestMapping(value = "/add-product", method = RequestMethod.POST)
	public String processAddProductPage(@RequestParam("image") MultipartFile image, @Valid @ModelAttribute Product product, BindingResult result) {
		if(result.hasErrors()) {
			return "add_product";
		}
		
		Long productId = productService.getLastInsertedId();
		
		System.out.println("lastInsertedId : " + productId);
		
		if(image != null && !image.isEmpty()) {
			String[] str = image.getOriginalFilename().split("\\.");
			String imageName = productId + "." + str[str.length - 1];
			String path = Paths.
					get(servletContext.getRealPath("/resources/images/")).toString();
			File f = new File(path, imageName);
			
			try {
				image.transferTo(f);
				product.setImageName(imageName);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Product image saving failed!", e);
			}
		}
		productService.addProduct(product);
		return "redirect:/admin/product-inventory";
	}
	
	@RequestMapping(value = "/product-inventory/delete-product/{productId}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable Long productId) {
		Product product = productService.getProductById(productId);
		String imageName = product.getImageName();
		
		if(imageName != null) {
			Path path = Paths.
					get(servletContext.getRealPath("/resources/images/"), imageName);
			if(Files.exists(path)) {
				try {
					Files.delete(path);
				} catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		productService.deleteProduct(product);
		return "redirect:/admin/product-inventory";
	}
	
	@RequestMapping(value = "/product-inventory/edit-product/{productId}", method = RequestMethod.GET)
	public String showEditProductPage(@PathVariable Long productId, Model model) {
		Product product = productService.getProductById(productId);
		model.addAttribute(product);
		return "edit_product";
	}
	
	@RequestMapping(value = "/product-inventory/edit-product/{productId}", method = RequestMethod.POST)
	public String processEditProductPage(@RequestParam("image") MultipartFile image, @Valid @ModelAttribute Product product, BindingResult result) {
		if(result.hasErrors()) {
			return "edit_product";
		}
		
		if(image != null && !image.isEmpty()) {
			
			String[] str = image.getOriginalFilename().split("\\.");
			String imageName = product.getImageName().split("\\.")[0] + "." + str[str.length - 1];
			String path = Paths.
					get(servletContext.getRealPath("/resources/images/")).toString();
			File f = new File(path, imageName);
			
			try {
				image.transferTo(f);
				product.setImageName(imageName);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Product image saving failed!", e);
			}
		}
		productService.editProduct(product);
		return "redirect:/admin/product-inventory";
	}
	
	@RequestMapping(value = "/customers", method = RequestMethod.GET)
	public String customerManagement(Model model) {
		List<Customer> customers = customerService.getCustomerList();
		model.addAttribute("customers", customers);
		return "customer_management";
	}
}
