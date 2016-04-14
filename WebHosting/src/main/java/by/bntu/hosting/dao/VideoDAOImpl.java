package by.bntu.hosting.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import by.bntu.hosting.model.Video;

@Repository
public class VideoDAOImpl implements VideoDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void addVideo(Video video) {
	sessionFactory.getCurrentSession().save(video);
    }

    @Override
    public void removeVideo(Video video) {
	sessionFactory.getCurrentSession().delete(video);
    }

    @Override
    public Video getVideo(String name) {
	Query query = sessionFactory.getCurrentSession().createQuery("from Video where name = :name");
	query.setString("name", name);
	return (Video) query.uniqueResult();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Video> listVideo() {
	return sessionFactory.getCurrentSession().createQuery("from Video").list();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Video> listVideo(String userName) {
	Query query = sessionFactory.getCurrentSession().createQuery("from Video where username = :username");
	query.setString("username", userName);
	List<Video> list = query.list();
	return list;
    }

}
