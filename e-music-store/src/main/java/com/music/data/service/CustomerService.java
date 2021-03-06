package com.music.data.service;

import java.util.List;

import com.music.model.Customer;
import com.music.model.ForgotPassword;

public interface CustomerService {
	Customer getCustomerById(Long id);
	Customer getCustomerByUsername(String username);
	List<Customer> getCustomerList();
	void addCustomer(Customer customer);
	void editCustomer(Customer customer);
	void deleteCustomer(Customer customer);
	
	void customerExist(ForgotPassword forgotPassword);
	void changePassword(ForgotPassword forgotPassword);
	void checkSecurityAnswer(ForgotPassword forgotPassword);
}
