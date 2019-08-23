package com.music.data.service;

import java.util.List;

import com.music.model.Product;

public interface ProductService {
	List<Product> getProductList();
	Product getProductById(Long id);
	void addProduct(Product product);
	void editProduct(Product product);
	void deleteProduct(Product product);
	Long getLastInsertedId();
}
