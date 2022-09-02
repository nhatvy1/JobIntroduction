package com.hnv.service;
    
import com.hnv.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService{
    boolean addUser(User user);
    List<User> getUsers(String username);
    Long countUser();
}
