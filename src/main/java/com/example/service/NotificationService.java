package com.example.service;

import com.example.entity.Notification;
import com.example.repository.NotificationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationService {
    @Autowired
    private NotificationDao notificationDao;

    public List<Notification> getAllNotifications() {
        return notificationDao.getAllNotifications();
    }

    public Notification getNotificationById(int id) {
        return notificationDao.getById(id);
    }

    public List<Notification> getUserNotifications(int userId) {
        return notificationDao.getByUserId(userId);
    }

    public List<Notification> getUnreadNotifications(int userId) {
        return notificationDao.getUnreadByUserId(userId);
    }

    public void saveNotification(Notification notification) {
        notificationDao.save(notification);
    }

    public void markAsRead(int id) {
        Notification notification = notificationDao.getById(id);
        if (notification != null) {
            notification.setRead(true);
            notificationDao.update(notification);
        }
    }

    public void deleteNotification(int id) {
        notificationDao.delete(id);
    }
}