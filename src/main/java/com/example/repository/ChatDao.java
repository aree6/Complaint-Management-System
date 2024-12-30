package com.example.repository;

import com.example.entity.Chat;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChatDao {
    private final SessionFactory sessionFactory;

    @Autowired
    public ChatDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Create a new Chat
    public void save(Chat chat) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(chat);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    // Get Chat by ID
    public Chat getById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Chat.class, id);
        }
    }

    // Get Chats by Complaint ID
    public List<Chat> getByComplaintId(int complaintId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Chat where complaint.id = :complaintId", Chat.class)
                    .setParameter("complaintId", complaintId)
                    .list();
        }
    }

    // Delete Chat by ID
    public void delete(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Chat chat = session.get(Chat.class, id);
            if (chat != null) {
                session.delete(chat);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }
}
