package com.music.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.data.repository.ProductRepository;
import com.music.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<Product> getProductList() {
		return productRepository.getProductList();
	}

	@Override
	public Product getProductById(Long id) {
		return productRepository.getProductById(id);
	}

	@Override
	public void addProduct(Product product) {
		productRepository.addProduct(product);
	}

	@Override
	public void editProduct(Product product) {
		productRepository.editProduct(product);
	}

	@Override
	public void deleteProduct(Product product) {
		productRepository.deleteProduct(product);
	}
	
	@Override
	public Long getLastInsertedId() {
		return productRepository.getLastInsertedId();
	}

}
