package com.music.data.service;

import com.music.model.CustomerOrder;

public interface CustomerOrderService {
	void addCustomerOrder(CustomerOrder customerOrder);
	double getCustomerOrderGrandTotal(Long cartId);
}
