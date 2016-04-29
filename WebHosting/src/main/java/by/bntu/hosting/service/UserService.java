package by.bntu.hosting.service;

import java.util.List;

import by.bntu.hosting.model.User;

public interface UserService {

    public void addUser(User user);

    public List<User> listUser();

    public void removeUser(Integer id);

    public User getUser(String login);

    public User getUser(Integer id);

    public void addDescription(String description, String login);

}
