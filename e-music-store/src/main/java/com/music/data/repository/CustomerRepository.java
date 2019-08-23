package com.music.data.repository;

import java.util.List;

import com.music.model.Customer;

public interface CustomerRepository {
	Customer getCustomerById(Long id);
	Customer getCustomerByUsername(String username);
	List<Customer> getCustomerList();
	void addCustomer(Customer customer);
	void editCustomer(Customer customer);
	void deleteCustomer(Customer customer);
}