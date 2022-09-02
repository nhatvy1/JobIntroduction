package com.hnv.repository;

import com.hnv.pojo.User;
import java.util.List;

public interface UserRepository {
    boolean addUser(User user);
    List<User> getUsers(String username);
    Long countUser();
}
