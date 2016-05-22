package by.bntu.hosting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.bntu.hosting.dao.UserDAO;
import by.bntu.hosting.model.User;
import by.bntu.hosting.utils.MDPasswordEncoder;

@Service
public class UserServiceImpl implements UserService {

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

    @Override
    @Transactional
    public void updateDescription(String description, String login) {
	User user = userDAO.getUser(login);
	user.setDescription(description);
	userDAO.updateUser(user);
    }

    @Override
    @Transactional
    public void updatePassword(String password, String login) {
	User user = userDAO.getUser(login);
	user.setPassword(password);
	user.setConfirmPassword(password);
	userDAO.updateUser(user);
    }

    @Override
    @Transactional
    public void updateResolve(String username, int enabled) {
	User user = userDAO.getUser(username);
	user.setEnabled(enabled);
	userDAO.updateUser(user);
    }

}
