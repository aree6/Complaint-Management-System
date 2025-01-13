package com.example.repository;

import com.example.entity.Notification;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NotificationDao {
    private final SessionFactory sessionFactory;

    @Autowired
    public NotificationDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Notification> getAllNotifications() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Notification", Notification.class).list();
        }
    }

    public Notification getById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Notification.class, id);
        }
    }

    public List<Notification> getByUserId(int userId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Notification where user.id = :userId", Notification.class)
                    .setParameter("userId", userId)
                    .list();
        }
    }

    public List<Notification> getUnreadByUserId(int userId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Notification where user.id = :userId and isRead = false", Notification.class)
                    .setParameter("userId", userId)
                    .list();
        }
    }

    public void save(Notification notification) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(notification);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public void update(Notification notification) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(notification);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public void delete(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Notification notification = session.get(Notification.class, id);
            if (notification != null) {
                session.delete(notification);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }
}
