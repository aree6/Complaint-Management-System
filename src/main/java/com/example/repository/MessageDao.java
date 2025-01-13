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
    @Autowired
    private SessionFactory sessionFactory;

    // Save a new Message
    public void save(Message message) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.save(message);
            tx.commit();
        }
    }

    // Get Messages by Complaint ID
    public List<Message> findByComplaintId(int complaintId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                "FROM Message m WHERE m.complaint.id = :complaintId ORDER BY m.createdAt ASC",
                Message.class)
                .setParameter("complaintId", complaintId)
                .list();
        }
    }
}
