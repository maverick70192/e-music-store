package com.music.data.repository;

import java.util.List;

import com.music.model.Product;

public interface ProductRepository {
	void addProduct(Product product);
	void editProduct(Product product);
	Product getProductById(Long id);
	List<Product> getProductList();
	void deleteProduct(Product product);
	Long getLastInsertedId();
}
