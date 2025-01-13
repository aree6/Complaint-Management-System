// package com.example.repository;

// import com.example.entity.Feedback;
// import org.hibernate.Session;
// import org.hibernate.SessionFactory;
// import org.hibernate.Transaction;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Repository;

// import java.util.List;

// @Repository
// public class FeedbackDao {
//     private final SessionFactory sessionFactory;

//     @Autowired
//     public FeedbackDao(SessionFactory sessionFactory) {
//         this.sessionFactory = sessionFactory;
//     }

//     public List<Feedback> getAllFeedback() {
//         try (Session session = sessionFactory.openSession()) {
//             return session.createQuery("from Feedback", Feedback.class).list();
//         }
//     }        


//     public Feedback getById(int id) {
//         try (Session session = sessionFactory.openSession()) {
//             return session.get(Feedback.class, id);
//         }
//     }

//     // public List<Feedback> getByComplaintId(int complaintId) {
//     //     try (Session session = sessionFactory.openSession()) {
//     //         return session.createQuery("from Feedback where complaint.id = :complaintId", Feedback.class)
//     //                 .setParameter("complaintId", complaintId)
//     //                 .list();
//     //     }
//     // }

//     public void save(Feedback feedback) {
//         Transaction transaction = null;
//         try (Session session = sessionFactory.openSession()) {
//             transaction = session.beginTransaction();
//             session.save(feedback);
//             transaction.commit();
//         } catch (Exception e) {
//             if (transaction != null) transaction.rollback();
//             throw e;
//         }
//     }

//     public void update(Feedback feedback) {
//         Transaction transaction = null;
//         try (Session session = sessionFactory.openSession()) {
//             transaction = session.beginTransaction();
//             session.update(feedback);
//             transaction.commit();
//         } catch (Exception e) {
//             if (transaction != null) transaction.rollback();
//             throw e;
//         }
//     }

//     public void delete(int id) {
//         Transaction transaction = null;
//         try (Session session = sessionFactory.openSession()) {
//             transaction = session.beginTransaction();
//             Feedback feedback = session.get(Feedback.class, id);
//             if (feedback != null) {
//                 session.delete(feedback);
//             }
//             transaction.commit();
//         } catch (Exception e) {
//             if (transaction != null) transaction.rollback();
//             throw e;
//         }
//     }

//     public Double getAverageRating(int complaintId) {
//         try (Session session = sessionFactory.openSession()) {
//             return session.createQuery("select avg(rating) from Feedback where complaint.id = :complaintId", Double.class)
//                     .setParameter("complaintId", complaintId)
//                     .uniqueResult();
//         }
//     }
    
//    // Add method to get feedback by technician ID
//     public List<Feedback> getByTechnicianId(int technicianId) {
//         try (Session session = sessionFactory.openSession()) {
//             // Join with Complaint to get feedback for complaints assigned to the technician
//             String hql = "SELECT f FROM Feedback f " +
//                         "JOIN f.complaint c " +
//                         "WHERE c.technician.id = :technicianId";
            
//             return session.createQuery(hql, Feedback.class)
//                     .setParameter("technicianId", technicianId)
//                     .list();
//         }
//     }

//     public boolean existsByComplaintId(int complaintId) {
//         try (Session session = sessionFactory.openSession()) {
//             Long count = session.createQuery(
//                 "select count(f) from Feedback f where f.complaint.id = :complaintId", Long.class)
//                 .setParameter("complaintId", complaintId)
//                 .uniqueResult();
//             return count != null && count > 0;
//         }
//     }

//     public Feedback getByComplaintId(int complaintId) {
//         try (Session session = sessionFactory.openSession()) {
//             return session.createQuery(
//                 "from Feedback where complaint.id = :complaintId", Feedback.class)
//                 .setParameter("complaintId", complaintId)
//                 .uniqueResult();  // Changed from list() to uniqueResult()
//         }
//     }
// }
