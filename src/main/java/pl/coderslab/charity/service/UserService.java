package pl.coderslab.charity.service;

import pl.coderslab.charity.model.User;

public interface UserService {

    User findByUsername(String name);

    void saveAdmin(User user);
    void saveUser(User user);
}
