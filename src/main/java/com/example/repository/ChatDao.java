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
    @Autowired
    private SessionFactory sessionFactory;

    public void save(Chat chat) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.save(chat);
            tx.commit();
        }
    }

    public List<Chat> findByComplaintId(int complaintId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                "FROM Chat c WHERE c.complaint.id = :complaintId ORDER BY c.timestamp DESC", 
                Chat.class)
                .setParameter("complaintId", complaintId)
                .list();
        }
    }

    public Chat findById(int chatId) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Chat.class, chatId);
        }
    }
}
