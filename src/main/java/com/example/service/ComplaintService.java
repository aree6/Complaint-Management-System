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
        complaintDao.deleteById(complaintId);
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
}
