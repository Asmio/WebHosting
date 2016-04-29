package by.bntu.hosting.dao;

import java.util.List;

import by.bntu.hosting.model.User;

public interface UserDAO {

    public void addUser(User user);

    public List<User> listUser();

    public void removeUser(Integer id);

    public User getUser(String login);

    public User getUser(Integer id);

    public void addDescription(User user);
}
