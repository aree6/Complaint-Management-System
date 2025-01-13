package com.example.repository;

import com.example.entity.Complaint;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ComplaintDao {
    @Autowired
    private SessionFactory sessionFactory;

    public List<Complaint> findByStudentId(Integer userId) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Complaint WHERE student.id = :userId", Complaint.class)
                     .setParameter("userId", userId)
                     .list();
    }

    public List<Complaint> findByStudentIdAndStatus(Integer userId, String status) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Complaint WHERE student.id = :userId AND status = :status", Complaint.class)
                     .setParameter("userId", userId)
                     .setParameter("status", status)
                     .list();
    }

    // Get all Complaints
    public List<Complaint> findAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Complaint", Complaint.class).list();
    }

   

    // Get Complaint by ID
    public Complaint getById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Complaint.class, id);
        }
    }

   

    // Get Pending Complaints by Technician ID
    public List<Complaint> getByTechnicianId(int technicianId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                "FROM Complaint WHERE technician.id = :technicianId AND status = 'ASSIGNED'", 
                Complaint.class)
                .setParameter("technicianId", technicianId)
                .list();
        }
    }


    public List<Complaint> getResolvedComplaintsByTechnicianId(Integer technicianId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                "FROM Complaint WHERE technician.id = :technicianId AND status = 'RESOLVED'", 
                Complaint.class)
                .setParameter("technicianId", technicianId)
                .list();
        }
    }

    // Create a new Complaint
    public void save(Complaint complaint) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(complaint);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    // Update an existing Complaint
    public void update(Complaint complaint) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            complaint.setUpdatedAt(java.time.LocalDateTime.now());
            session.update(complaint);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    // Delete a Complaint
    public void deleteById(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Complaint complaint = session.get(Complaint.class, id);
            if (complaint != null) {
                session.delete(complaint);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    // Get Complaints by Status
    public List<Complaint> getByStatus(String status) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Complaint where status = :status", Complaint.class)
                    .setParameter("status", status)
                    .list();
        }
    }

    // public List<Complaint> findByTechnicianId(Integer technicianId) {
    //     Session session = sessionFactory.getCurrentSession();
    //     return session.createQuery("FROM Complaint WHERE technician.id = :technicianId", Complaint.class)
    //                  .setParameter("technicianId", technicianId)
    //                  .list();
    // }

    public List<Complaint> findComplaintsWithFeedback() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                "FROM Complaint WHERE feedbackContent IS NOT NULL", 
                Complaint.class)
                .list();
        }
    }

    public List<Complaint> findComplaintsWithFeedbackByStudentId(int studentId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                "FROM Complaint WHERE student.id = :studentId AND feedbackContent IS NOT NULL", 
                Complaint.class)
                .setParameter("studentId", studentId)
                .list();
        }
    }

    public List<Complaint> findComplaintsWithFeedbackByTechnicianId(int technicianId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                "FROM Complaint WHERE technician.id = :technicianId AND feedbackContent IS NOT NULL", 
                Complaint.class)
                .setParameter("technicianId", technicianId)
                .list();
        }
    }

}