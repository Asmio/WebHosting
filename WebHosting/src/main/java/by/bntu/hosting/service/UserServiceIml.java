package by.bntu.hosting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.bntu.hosting.dao.UserDAO;
import by.bntu.hosting.model.User;
import by.bntu.hosting.utils.MDPasswordEncoder;

@Service
public class UserServiceIml implements UserService {

    @Autowired
    UserDAO userDAO;

    @Override
    @Transactional
    public void addUser(User user) {
	MDPasswordEncoder encoder = new MDPasswordEncoder();
	user.setPassword(encoder.encodeMD5(user.getPassword()));
	user.setConfirmPassword(encoder.encodeMD5(user.getConfirmPassword()));
	userDAO.addUser(user);
    }

    @Override
    @Transactional
    public List<User> listUser() {
	return userDAO.listUser();
    }

    @Override
    @Transactional
    public void removeUser(Integer id) {
	userDAO.removeUser(id);
    }

    @Override
    @Transactional
    public User getUser(String login) {
	return userDAO.getUser(login);
    }

    @Override
    @Transactional
    public User getUser(Integer id) {
	return userDAO.getUser(id);
    }

}
