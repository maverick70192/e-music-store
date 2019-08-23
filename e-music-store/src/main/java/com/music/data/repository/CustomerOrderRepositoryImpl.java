package com.music.data.repository;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.music.model.CustomerOrder;

@Repository
@Transactional
public class CustomerOrderRepositoryImpl implements CustomerOrderRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void addCustomerOrder(CustomerOrder customerOrder) {
		Session session = currentSession();
		session.saveOrUpdate(customerOrder);
		session.flush();
	}

}
