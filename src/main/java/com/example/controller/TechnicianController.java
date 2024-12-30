package com.example.controller;

import com.example.entity.Complaint;
import com.example.entity.Feedback;
import com.example.service.ComplaintService;
import com.example.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/technician")
public class TechnicianController {
    @Autowired
    private ComplaintService complaintService;

    @Autowired
    private FeedbackService feedbackService;

    // Technician Dashboard
    @GetMapping("/dashboard")
    public String technicianDashboard(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        // Using same methods as admin since technicians see all complaints
        model.addAttribute("allComplaints", complaintService.getAllComplaintsForAdmin());
        model.addAttribute("pendingComplaints", complaintService.getPendingComplaintsForAdmin());
        model.addAttribute("resolvedComplaints", complaintService.getResolvedComplaintsForAdmin());
        List<Complaint> assignedComplaints = complaintService.getComplaintsByTechnicianId(userId);
        model.addAttribute("technicianComplaints", assignedComplaints);

        
        return "technician-dashboard";
    }

    // View Assigned Complaints
    @GetMapping("/complaints/{id}")
    public String viewComplaint(@PathVariable Integer id, Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }

        Complaint complaint = complaintService.getComplaintById(id);
        model.addAttribute("complaint", complaint);
        return "technician-complaint-detail";
    }

    // Update Complaint Status
    @GetMapping("/updateStatus/{id}")
    public String updateComplaintStatus(@PathVariable Integer id, 
                                      @RequestParam String status,
                                      HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }

        complaintService.updateStatus(id, status);
        return "redirect:/technician/dashboard";
    }

    // View Complaint Details
    @GetMapping("/complaint-details/{id}")
    public String technicianComplaintDetails(@PathVariable int id, Model model) {
        model.addAttribute("complaint", complaintService.getComplaintById(id));
        return "tech-complaint-details";
    }

    // View Notifications
    @GetMapping("/notifications")
    public String technicianNotification() {
        return "tech-notification";
    }

    // Chat with Students
    @GetMapping("/chat")
    public String technicianChat() {
        return "tech-chat";
    }

    // Feedback Form
    @GetMapping("/feedback-form/{complaintId}")
    public String technicianFeedbackForm(@PathVariable int complaintId, Model model) {
        model.addAttribute("feedback", new Feedback());
        model.addAttribute("complaintId", complaintId);
        return "tech-feedback-form";
    }

    @PostMapping("/submitFeedback")
    public String submitTechnicianFeedback(@ModelAttribute("feedback") Feedback feedback, @RequestParam int complaintId) {
        feedback.setComplaint(complaintService.getComplaintById(complaintId));
        feedbackService.saveFeedback(feedback);
        return "tech-feedback-submitted";
    }

    // View Feedback List
    @GetMapping("/feedback-list")
    public String feedbackList(@SessionAttribute("userId") int userId, Model model) {
        model.addAttribute("feedbackList", feedbackService.getFeedbackByTechnician(userId));
        return "tech-feedback-list";
    }

    // View Feedback Details
    @GetMapping("/feedback-details/{id}")
    public String technicianFeedbackDetails(@PathVariable int id, Model model) {
        model.addAttribute("feedback", feedbackService.getFeedbackById(id));
        return "tech-feedback-details";
    }
}
