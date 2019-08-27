package com.music.data.repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.music.model.Users;

@Repository
@Transactional
public class UsersRepositoryImpl implements UsersRepository {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	
	@Override
	public Users getUsersByUsername(String username) {
		Users users = null;
		Session session = currentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Users> criteriaQuery = builder.createQuery(Users.class);
		Root<Users> root = criteriaQuery.from(Users.class);
		criteriaQuery.select(root).where(builder.equal(root.get("username"), username));
		users = session.createQuery(criteriaQuery).getSingleResult();
		session.flush();
		return users;
	}

}
