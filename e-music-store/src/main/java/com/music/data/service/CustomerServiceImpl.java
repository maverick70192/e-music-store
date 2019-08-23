package com.music.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.data.repository.CustomerRepository;
import com.music.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public Customer getCustomerById(Long id) {
		return customerRepository.getCustomerById(id);
	}

	@Override
	public List<Customer> getCustomerList() {
		return customerRepository.getCustomerList();
	}

	@Override
	public void addCustomer(Customer customer) {
		customerRepository.addCustomer(customer);
	}

	@Override
	public void editCustomer(Customer customer) {
		customerRepository.editCustomer(customer);
	}

	@Override
	public void deleteCustomer(Customer customer) {
		customerRepository.deleteCustomer(customer);
	}

	@Override
	public Customer getCustomerByUsername(String username) {
		return customerRepository.getCustomerByUsername(username);
	}

}
