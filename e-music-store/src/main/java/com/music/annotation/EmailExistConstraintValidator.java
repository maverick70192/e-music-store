package com.music.annotation;

import java.util.List;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.music.data.service.CustomerService;
import com.music.model.Customer;

public class EmailExistConstraintValidator implements ConstraintValidator<EmailExist, String> {

	@Autowired
	private CustomerService customerService;
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		List<Customer> customers = customerService.getCustomerList();
		for(Customer customer : customers) {
			if(value.equalsIgnoreCase(customer.getEmail())) {
				return false;
			}
		}
		return true;
	}

}
