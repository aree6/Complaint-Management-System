package com.example.controller;

import com.example.entity.User;
import com.example.entity.Complaint;
import com.example.entity.Feedback;
import com.example.service.UserService;
import com.example.service.ComplaintService;
import com.example.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private UserService userService;

    @Autowired
    private ComplaintService complaintService;

    @Autowired
    private FeedbackService feedbackService;

    // Student Dashboard
    @GetMapping("/dashboard")
    public String studentDashboard(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        // Fetch complaints based on status
        List<Complaint> allComplaints = complaintService.getAllComplaints(userId);
        List<Complaint> pendingComplaints = complaintService.getPendingComplaints(userId);
        List<Complaint> resolvedComplaints = complaintService.getResolvedComplaints(userId);

        // Add to model
        model.addAttribute("allComplaints", allComplaints);
        model.addAttribute("pendingComplaints", pendingComplaints);
        model.addAttribute("resolvedComplaints", resolvedComplaints);

        return "student-dashboard";
    }

    // Add New Complaint Form
    @GetMapping("/complaint-form")
    public String studentComplaintForm(Model model) {
        model.addAttribute("complaint", new Complaint());
        return "student-complaint-form";
    }

    // Submit New Complaint
    @PostMapping("/submitComplaint")
    public String studentComplaintSubmit(@ModelAttribute("complaint") Complaint complaint,
                                       @SessionAttribute("userId") int userId) {
        complaint.setStudent(userService.getUserById(userId));
        complaintService.saveComplaint(complaint);
        return "redirect:/student/dashboard";
    }

    // View Complaint Progress
//    @GetMapping("/complaint-progress")
//    public String studentComplaintProgress(@SessionAttribute("userId") int userId, Model model) {
//        model.addAttribute("complaints", complaintService.getStudentComplaints(userId));
//        return "student-complaint-progress";
//    }

    // View Complaint Details
    @GetMapping("/complaint-details")
    public String studentComplaintDetails(@RequestParam("id") int complaintId, Model model) {
        model.addAttribute("complaint", complaintService.getComplaintById(complaintId));
        return "student-complaint-details";
    }

    // Update Complaint
    @GetMapping("/updateComplaint")
    public String studentComplaintUpdate(@RequestParam("id") int complaintId, Model model) {
        model.addAttribute("complaint", complaintService.getComplaintById(complaintId));
        return "student-complaint-update";
    }

    // View Notifications
    @GetMapping("/notification")
    public String studentNotification(@SessionAttribute("userId") int userId, Model model) {
        model.addAttribute("notifications", userService.getUserNotifications(userId));
        return "student-notification";
    }

    // Chat
    @GetMapping("/chat")
    public String studentChat(@SessionAttribute("userId") int userId, Model model) {
        model.addAttribute("chats", userService.getUserChats(userId));
        return "student-chat";
    }

    // Feedback Form
    @GetMapping("/feedback-form")
    public String studentFeedbackForm(@RequestParam("complaintId") int complaintId, Model model) {
        model.addAttribute("complaint", complaintService.getComplaintById(complaintId));
        model.addAttribute("feedback", new Feedback());
        return "student-feedback-form";
    }

    // Submit Feedback
    @PostMapping("/submitFeedback")
    public String studentFeedbackSubmit(@ModelAttribute("feedback") Feedback feedback,
                                      @SessionAttribute("userId") int userId) {
        feedback.setUser(userService.getUserById(userId));
        feedbackService.saveFeedback(feedback);
        return "student-feedback-submitted";
    }

    // View Feedback List
    @GetMapping("/feedback-list")
    public String feedbackList(@SessionAttribute("userId") int userId, Model model) {
        model.addAttribute("feedbackList", feedbackService.getComplaintFeedback(userId));
        return "student-feedback-list";
    }

    // View Feedback Details
    @GetMapping("/feedback-details")
    public String studentFeedbackDetails(@RequestParam("id") int feedbackId, Model model) {
        model.addAttribute("feedback", feedbackService.getFeedbackById(feedbackId));
        return "student-feedback-details";
    }

    // Delete Feedback
    @GetMapping("/feedback-delete")
    public String studentFeedbackDelete(@RequestParam("id") int feedbackId) {
        feedbackService.deleteFeedback(feedbackId);
        return "student-feedback-delete";
    }

    //delete complaint
    @GetMapping("/deleteComplaint/{id}")
    public String deleteComplaint(@PathVariable("id") int id) {
        complaintService.deleteComplaint(id);
        return "redirect:/student/dashboard";
    }
}