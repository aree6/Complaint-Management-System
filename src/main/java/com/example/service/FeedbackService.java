// package com.example.service;

// import com.example.entity.Feedback;
// import com.example.repository.FeedbackDao;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Service;

// import java.util.List;

// @Service
// public class FeedbackService {
//     @Autowired
//     private FeedbackDao feedbackDao;

//     public List<Feedback> getAllFeedback() {
//         return feedbackDao.getAllFeedback();
//     }

//     public Feedback getFeedbackById(int id) {
//         return feedbackDao.getById(id);
//     }

//     // public List<Feedback> getComplaintFeedback(int complaintId) {
//     //     return feedbackDao.getByComplaintId(complaintId);
//     // }
//     public Feedback getComplaintFeedback(int complaintId) {
//         return feedbackDao.getByComplaintId(complaintId);
//     }
//     public void saveFeedback(Feedback feedback) {
//         if (hasExistingFeedback(feedback.getComplaint().getId())) {
//             throw new RuntimeException("Feedback already exists for this complaint");
//         }
//         feedbackDao.save(feedback);
//     }

//     public void updateFeedback(Feedback feedback) {
//         feedbackDao.update(feedback);
//     }

//     public void deleteFeedback(int id) {
//         feedbackDao.delete(id);
//     }

//     public Double getAverageRating(int complaintId) {
//         return feedbackDao.getAverageRating(complaintId);
//     }

//     public List<Feedback> getFeedbackByTechnician(int technicianId) {
//         return feedbackDao.getByTechnicianId(technicianId);
//     }

//     public boolean hasExistingFeedback(int complaintId) {
//         return feedbackDao.existsByComplaintId(complaintId);
//     }

    
// }