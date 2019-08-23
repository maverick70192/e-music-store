package com.music.data.repository;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.music.model.Product;

@Repository
@Transactional
public class ProductRepositoryImpl implements ProductRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void addProduct(Product product) {
		Session session = currentSession();
		session.saveOrUpdate(product);
		session.flush();
	}
	
	@Override
	public void editProduct(Product product) {
		Session session = currentSession();
		session.saveOrUpdate(product);
		session.flush();
	}

	@Override
	public Product getProductById(Long id) {
		Product product = null;
		Session session = currentSession();
		product = session.get(Product.class, id);
		session.flush();
		return product;
	}

	@Override
	public List<Product> getProductList() {
		List<Product> products = null;
		Session session = currentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Product> criteriaQuery = builder.createQuery(Product.class);
		Root<Product> root = criteriaQuery.from(Product.class);
		criteriaQuery.select(root);
		products = session.createQuery(criteriaQuery).getResultList();
		session.flush();
		return products;
	}

	@Override
	public void deleteProduct(Product product) {
		Session session = currentSession();
		session.delete(product);
		session.flush();
	}

	@Override
	public Long getLastInsertedId() {
		Session session = currentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Long> criteriaQuery = builder.createQuery(Long.class);
		Root<Product> root = criteriaQuery.from(Product.class);
		criteriaQuery.select(root.get("id"));
		criteriaQuery.orderBy(builder.desc(root.get("id")));
		List<Long> list = session.createQuery(criteriaQuery).getResultList();
		Long l = list.isEmpty() ? Long.valueOf(0) : Long.valueOf(list.get(0));
		return l;
	}

}
