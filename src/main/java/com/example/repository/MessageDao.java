package com.example.repository;

import com.example.entity.Message;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageDao {
    private final SessionFactory sessionFactory;

    @Autowired
    public MessageDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Save a new Message
    public void save(Message message) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(message);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    // Get Messages by Chat ID
    public List<Message> getByChatId(int chatId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Message where chat.id = :chatId", Message.class)
                    .setParameter("chatId", chatId)
                    .list();
        }
    }

    // Get Messages by Sender ID
    public List<Message> getBySenderId(int senderId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Message where sender.id = :senderId", Message.class)
                    .setParameter("senderId", senderId)
                    .list();
        }
    }
}
