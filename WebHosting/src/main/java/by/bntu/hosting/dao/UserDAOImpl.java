package by.bntu.hosting.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import by.bntu.hosting.controller.HomeController;
import by.bntu.hosting.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addUser(User user) {
	sessionFactory.getCurrentSession().save(user);

    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUser() {
	return sessionFactory.getCurrentSession().createQuery("from User").list();
    }

    @Override
    public void removeUser(Integer id) {
	User user = (User) sessionFactory.getCurrentSession().load(User.class, id);

	if (null != user) {
	    sessionFactory.getCurrentSession().delete(user);
	}

    }

    @Override
    public User getUser(String username) {
	Query query = sessionFactory.getCurrentSession().createQuery("from User where username = :username");
	query.setString("username", username);
	return (User) query.uniqueResult();
    }

    @Override
    public User getUser(Integer id) {
	Query query = sessionFactory.getCurrentSession().createQuery("from User where id = :id");
	query.setInteger("id", id);
	return (User) query.uniqueResult();
    }

}
