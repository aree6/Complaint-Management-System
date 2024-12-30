package com.example.service;

import com.example.entity.Chat;
import com.example.entity.Notification;
import com.example.entity.User;
import com.example.entity.UserRole;
import com.example.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    public User getUserById(int id) {
        return userDao.getById(id);
    }

    public User getUserByUsername(String username) {
        return userDao.findByUsername(username);
    }

    public void saveUser(User user) {
        userDao.save(user);
    }

    public void updateUser(User user) {
        userDao.update(user);
    }

    public void deleteUser(int id) {
        userDao.delete(id);
    }

    public List<User> getUsersByRole(UserRole role) {
        return userDao.getByRole(role);
    }
    public List<Notification> getUserNotifications(int userId) {
        return userDao.getNotificationsByUserId(userId);
    }

    public List<Chat> getUserChats(int userId) {
        return userDao.getChatsByUserId(userId);
    }

    // Mark notifications as read
    public void markNotificationsAsRead(int userId) {
        userDao.markNotificationsAsRead(userId);
    }
}
