package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entity.User;

@Service
public class AuthService {
    @Autowired
    private UserService userService;
    
    public User authenticate(String username, String password) {
        User user = userService.getUserByUsername(username); // Changed from getUserByEmail
        if (user != null && validatePassword(password, user.getPassword())) {
            return user;
        }
        return null;
    }
    
    private boolean validatePassword(String rawPassword, String storedPassword) {
        return rawPassword.equals(storedPassword);
    }
}
