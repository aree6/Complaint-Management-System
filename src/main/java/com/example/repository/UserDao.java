package com.example.repository;

import com.example.entity.Chat;
import com.example.entity.Notification;
import com.example.entity.User;
import com.example.entity.UserRole;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao {
    private final SessionFactory sessionFactory;

    @Autowired
    public UserDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<User> getAllUsers() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from User", User.class).list();
        }
    }

    public User getById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(User.class, id);
        }
    }

   

    public User findByUsername(String username) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from User where username = :username", User.class)
                    .setParameter("username", username)
                    .uniqueResult();
        }
    }

    public void save(User user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public void update(User user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(user);
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
            User user = session.get(User.class, id);
            if (user != null) {
                session.delete(user);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public List<User> getByRole(UserRole role) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from User where role = :role", User.class)
                    .setParameter("role", role)
                    .list();
        }
    }
    
 // Get notifications for a user
    public List<Notification> getNotificationsByUserId(int userId) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Notification n " +
                        "WHERE n.user.id = :userId " +
                        "ORDER BY n.createdAt DESC";
            
            return session.createQuery(hql, Notification.class)
                    .setParameter("userId", userId)
                    .list();
        }
    }

    // Get chats for a user
    public List<Chat> getChatsByUserId(int userId) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "SELECT DISTINCT c FROM Chat c " +
                        "JOIN FETCH c.messages m " +
                        "JOIN c.complaint comp " +
                        "WHERE comp.student.id = :userId " +
                        "OR comp.technician.id = :userId " +
                        "ORDER BY c.createdAt DESC";
            
            return session.createQuery(hql, Chat.class)
                    .setParameter("userId", userId)
                    .list();
        }
    }

    // Mark notifications as read
    public void markNotificationsAsRead(int userId) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "UPDATE Notification n " +
                        "SET n.isRead = true " +
                        "WHERE n.user.id = :userId " +
                        "AND n.isRead = false";
            
            session.beginTransaction();
            session.createQuery(hql)
                    .setParameter("userId", userId)
                    .executeUpdate();
            session.getTransaction().commit();
        }
    }
}