package com.example.service;

import com.example.entity.Complaint;
import com.example.entity.User;
import com.example.repository.ComplaintDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class ComplaintService {
    @Autowired
    private ComplaintDao complaintDao;
    @Autowired
    private UserService userService;

    // STUDENT METHODS
    public List<Complaint> getAllComplaints(Integer userId) {
        return complaintDao.findByStudentId(userId);
    }

    public List<Complaint> getPendingComplaints(Integer userId) {
        return complaintDao.findByStudentIdAndStatus(userId, "PENDING");
    }

    public List<Complaint> getResolvedComplaints(Integer userId) {
        return complaintDao.findByStudentIdAndStatus(userId, "RESOLVED");
    }

    public List<Complaint> getAssignedComplaints(int studentId) {
        return complaintDao.findByStudentIdAndStatus(studentId, "ASSIGNED");
    }

    // ADMIN/TECHNICIAN METHODS
    public List<Complaint> getAllComplaintsForAdmin() {
        return complaintDao.findAll();
    }

    public List<Complaint> getPendingComplaintsForAdmin() {
        return complaintDao.getByStatus("PENDING");
    }

    public List<Complaint> getResolvedComplaintsForAdmin() {
        return complaintDao.getByStatus("RESOLVED");
    }

    public List<Complaint> getAssignedComplaintsForAdmin() {
        return complaintDao.getByStatus("ASSIGNED");
    }

    // Save/Update Methods
    public void saveComplaint(Complaint complaint) {
        complaint.setStatus("PENDING");
        complaint.setCreatedAt(LocalDateTime.now());
        complaintDao.save(complaint);
    }

    public void updateComplaint(Complaint complaint) {
        complaint.setUpdatedAt(LocalDateTime.now());
        complaintDao.update(complaint);
    }

    public Complaint getComplaintById(Integer id) {
        return complaintDao.getById(id);
    }

    // Status Management
    public void updateStatus(Integer complaintId, String status) {
        Complaint complaint = complaintDao.getById(complaintId);
        if (complaint != null) {
            complaint.setStatus(status);
            complaint.setUpdatedAt(LocalDateTime.now());
            complaintDao.update(complaint);
        }
    }
    //deletetion mangement
    public void deleteComplaint(Integer complaintId) {
        Complaint complaint = complaintDao.getById(complaintId);
        
        if (complaint != null) {
            if ("RESOLVED".equals(complaint.getStatus()) && complaint.getFeedbackContent() != null) {
                throw new IllegalStateException("Cannot delete a resolved complaint with feedback.");
            }
            
            if (complaint.getTechnician() != null) {
                User technician = complaint.getTechnician();
                technician.setStatus("AVAILABLE");
                userService.updateUser(technician);
            }
            
            complaintDao.deleteById(complaintId);
        }
    }

    // Technician Assignment
    public void assignTechnician(Integer complaintId, Integer technicianId) {
        Complaint complaint = getComplaintById(complaintId);
        User technician = userService.getUserById(technicianId);
        
        if (complaint != null && technician != null) {
            complaint.setTechnician(technician);
            complaint.setStatus("ASSIGNED");
            complaint.setUpdatedAt(LocalDateTime.now());
            complaintDao.update(complaint);
            
            // Update technician status to BUSY
            technician.setStatus("BUSY");
            userService.updateUser(technician);
        }
    }

    public List<Complaint> getComplaintsByTechnicianId(Integer technicianId) {
        return complaintDao.getByTechnicianId(technicianId);  
    }
    public List<Complaint> getResolvedComplaintsByTechnicianId(Integer technicianId) {
        return complaintDao.getResolvedComplaintsByTechnicianId(technicianId);  
    }
    public void resolveComplaint(Integer complaintId, Integer technicianId) {
        Complaint complaint = getComplaintById(complaintId);
        User technician = userService.getUserById(technicianId);
        
        if (complaint != null && technician != null) {
            // Update complaint status
            complaint.setStatus("RESOLVED");
            complaint.setUpdatedAt(LocalDateTime.now());
            complaintDao.update(complaint);
            
            // Update technician status to AVAILABLE
            technician.setStatus("AVAILABLE");
            userService.updateUser(technician);
        }
    }

    // Feedback Methods
    public void addFeedback(Integer complaintId, String content, Integer rating) {
        Complaint complaint = getComplaintById(complaintId);
        if (complaint != null) {
            complaint.setFeedbackContent(content);
            complaint.setFeedbackRating(rating);
            complaint.setFeedbackCreatedAt(LocalDateTime.now());
            complaintDao.update(complaint);
        }
    }

    public void deleteFeedback(Integer complaintId) {
        Complaint complaint = getComplaintById(complaintId);
        if (complaint != null) {
            complaint.setFeedbackContent(null);
            complaint.setFeedbackRating(null);
            complaint.setFeedbackCreatedAt(null);
            complaintDao.update(complaint);
        }
    }

    public List<Complaint> getComplaintsWithFeedback() {
        return complaintDao.findComplaintsWithFeedback();
    }

    public List<Complaint> getComplaintsWithFeedbackByStudentId(Integer studentId) {
        return complaintDao.findComplaintsWithFeedbackByStudentId(studentId);
    }

    public List<Complaint> getComplaintsWithFeedbackByTechnicianId(Integer technicianId) {
        return complaintDao.findComplaintsWithFeedbackByTechnicianId(technicianId);
    }

    public boolean hasFeedback(Integer complaintId) {
        Complaint complaint = getComplaintById(complaintId);
        return complaint != null && complaint.getFeedbackContent() != null;
    }

    public Double getAverageRating(Integer technicianId) {
        List<Complaint> complaints = getComplaintsWithFeedbackByTechnicianId(technicianId);
        if (complaints.isEmpty()) {
            return 0.0;
        }
        return complaints.stream()
            .filter(c -> c.getFeedbackRating() != null)
            .mapToInt(Complaint::getFeedbackRating)
            .average()
            .orElse(0.0);
    }

    
}
