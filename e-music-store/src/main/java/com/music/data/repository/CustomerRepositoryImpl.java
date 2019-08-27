package com.music.data.repository;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.music.data.service.UsersService;
import com.music.model.Authorities;
import com.music.model.Cart;
import com.music.model.Customer;
import com.music.model.ForgotPassword;
import com.music.model.Users;

@Repository
@Transactional
public class CustomerRepositoryImpl implements CustomerRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private UsersService usersService;
	
	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(11);
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addCustomer(Customer customer) {
		Session session = currentSession();
		
		customer.setPassword(passwordEncoder.encode(customer.getPassword()));
		
		customer.getBillingAddress().setCustomer(customer);
		customer.getShippingAddress().setCustomer(customer);
		
		session.saveOrUpdate(customer);
		session.saveOrUpdate(customer.getBillingAddress());
		session.saveOrUpdate(customer.getShippingAddress());
		
		Users newUser = new Users();
		newUser.setUsername(customer.getUsername());
		newUser.setPassword(customer.getPassword());
		newUser.setCustomerId(customer.getId());
		newUser.setEnabled(true);
		
		Authorities newAuthority = new Authorities();
		newAuthority.setUsername(customer.getUsername());
		newAuthority.setAuthority("ROLE_USER");
		
		session.saveOrUpdate(newUser);
		session.saveOrUpdate(newAuthority);
		
		Cart newCart = new Cart();
		newCart.setCustomer(customer);
		customer.setCart(newCart);
		
		session.saveOrUpdate(customer);
		session.saveOrUpdate(newCart);
		
		session.flush();
	}

	@Override
	public void editCustomer(Customer customer) {
		Session session = currentSession();
		
		customer.getBillingAddress().setCustomer(customer);
		customer.getShippingAddress().setCustomer(customer);
		
		session.saveOrUpdate(customer);
		session.saveOrUpdate(customer.getBillingAddress());
		session.saveOrUpdate(customer.getShippingAddress());
		
		customer.getCart().setCustomer(customer);
		
		session.saveOrUpdate(customer);
		
		session.flush();
	}

	@Override
	public void deleteCustomer(Customer customer) {
		Session session = currentSession();
		session.delete(customer);
		session.flush();
	}

	@Override
	public Customer getCustomerById(Long id) {
		Customer customer = null;
		Session session = currentSession();
		customer = session.get(Customer.class, id);
		return customer;
	}

	@Override
	public List<Customer> getCustomerList() {
		List<Customer> customers;
		Session session = currentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Customer> criteriaQuery = builder.createQuery(Customer.class);
		Root<Customer> root = criteriaQuery.from(Customer.class);
		criteriaQuery.select(root);
		customers = session.createQuery(criteriaQuery).getResultList();
		session.flush();
		return customers;
	}

	@Override
	public Customer getCustomerByUsername(String username) {
		Customer customer = null;
		Session session = currentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Customer> criteriaQuery = builder.createQuery(Customer.class);
		Root<Customer> root = criteriaQuery.from(Customer.class);
		criteriaQuery.select(root).where(builder.equal(root.get("username"), username));
		customer = session.createQuery(criteriaQuery).getSingleResult();
		session.flush();
		return customer;
	}

	@Override
	public void customerExist(ForgotPassword forgotPassword) {
		String username = forgotPassword.getUsername();
		String email = forgotPassword.getEmail();
		Customer customer = null;
		Session session = currentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Customer> criteriaQuery = builder.createQuery(Customer.class);
		Root<Customer> root = criteriaQuery.from(Customer.class);
		criteriaQuery.select(root).where(builder.equal(root.get("username"), username), builder.equal(root.get("email"), email));
		customer = session.createQuery(criteriaQuery).getSingleResult();
		session.flush();
		if(customer == null) {
			throw new RuntimeException();
		}
		else {
			forgotPassword.setSecurityQuestion(customer.getSecurityQuestion());
		}
	}

	@Override
	public void changePassword(ForgotPassword forgotPassword) {
		Customer customer = getCustomerByUsername(forgotPassword.getUsername());
		
		Session session = currentSession();
		
		customer.setPassword(passwordEncoder.encode(forgotPassword.getPassword()));
		
		customer.getBillingAddress().setCustomer(customer);
		customer.getShippingAddress().setCustomer(customer);
		
		session.saveOrUpdate(customer);
		session.saveOrUpdate(customer.getBillingAddress());
		session.saveOrUpdate(customer.getShippingAddress());
		
		Users newUser = usersService.getUsersByUsername(customer.getUsername());
		newUser.setPassword(customer.getPassword());
		
		session.saveOrUpdate(newUser);
		
		customer.getCart().setCustomer(customer);
		
		session.saveOrUpdate(customer);
		
		session.flush();
	}

	@Override
	public void checkSecurityAnswer(ForgotPassword forgotPassword) {
		String answer = forgotPassword.getAnswer();
		Customer customer = getCustomerByUsername(forgotPassword.getUsername());
		if(!answer.equals(customer.getAnswer())) {
			throw new RuntimeException();
		}
	}

}
