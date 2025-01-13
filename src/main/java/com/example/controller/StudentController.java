package com.example.controller;

// import com.example.entity.Chat;
//import com.example.entity.User;
import com.example.entity.Complaint;
import com.example.entity.MessageSender;
import com.example.entity.UserRole;
import com.example.service.UserService;
import com.example.service.ComplaintService;
// import com.example.service.ChatService;
import com.example.service.MessageService;
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

    // @Autowired
    // private ChatService chatService;
    
    @Autowired
    private MessageService messageService;

    



    private boolean isValidStudentSession(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        UserRole role = (UserRole) session.getAttribute("userRole");
        return userId != null && role == UserRole.STUDENT;
    }

    @GetMapping("/**")
    public String validateStudentAccess(HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        return null;
    }

    // Student Dashboard
    @GetMapping("/dashboard")
    public String studentDashboard(Model model, HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        Integer userId = (Integer) session.getAttribute("userId");
        // Fetch complaints based on status
        List<Complaint> allComplaints = complaintService.getAllComplaints(userId);
        List<Complaint> pendingComplaints = complaintService.getPendingComplaints(userId);
        List<Complaint> resolvedComplaints = complaintService.getResolvedComplaints(userId);
        // Add this line to fetch assigned complaints
        List<Complaint> assignedComplaints = complaintService.getAssignedComplaints(userId);

        // Add to model
        model.addAttribute("allComplaints", allComplaints);
        model.addAttribute("pendingComplaints", pendingComplaints);
        model.addAttribute("resolvedComplaints", resolvedComplaints);
        // Add this line to pass assigned complaints to view
        model.addAttribute("assignedComplaints", assignedComplaints);

        return "student-dashboard";
    }

    // Add New Complaint Form
    @GetMapping("/complaint-form")
    public String studentComplaintForm(Model model, HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        
        model.addAttribute("complaint", new Complaint());
        return "student-complaint-form";
    }

    // Submit New Complaint
    @PostMapping("/submitComplaint")
    public String studentComplaintSubmit(@ModelAttribute Complaint complaint, 
                                       HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        Integer userId = (Integer) session.getAttribute("userId");

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

    // Fix complaint details endpoint
    @GetMapping("/complaint-details/{id}")
    public String studentComplaintDetails(@PathVariable int id, Model model, HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        Complaint complaint = complaintService.getComplaintById(id);
        if (complaint == null) {
            return "redirect:/student/dashboard";
        }
        model.addAttribute("complaint", complaint);
        return "student-complaint-details";
    }

    // Update Complaint
    @GetMapping("/updateComplaint")
    public String studentComplaintUpdate(@RequestParam("id") int complaintId, Model model, HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        model.addAttribute("complaint", complaintService.getComplaintById(complaintId));
        return "student-complaint-update";
    }

    // View Notifications
    @GetMapping("/notification")
    public String studentNotification(@SessionAttribute("userId") int userId, Model model, HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        model.addAttribute("notifications", userService.getUserNotifications(userId));
        return "student-notification";
    }

    // Chat
    @GetMapping("/chat/{complaintId}")
    public String viewChat(@PathVariable int complaintId, Model model, HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        Integer userId = (Integer) session.getAttribute("userId");
        model.addAttribute("messages", messageService.getComplaintMessages(complaintId));
        model.addAttribute("complaintId", complaintId);
        model.addAttribute("currentUserId", userId);
        return "student-chat";
    }

    // Handle sending message
    @PostMapping("/chat/send")
    public String sendMessage(
        @RequestParam int complaintId,
        @RequestParam String content,
        HttpSession session
    ) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        Integer userId = (Integer) session.getAttribute("userId");
        messageService.sendMessage(complaintId, userId, content, MessageSender.STUDENT);
        return "redirect:/student/chat/" + complaintId;
    }

    // // Updated Feedback Form
    // @GetMapping("/feedback-form/{complaintId}")
    // public String studentFeedbackForm(@PathVariable int complaintId, Model model, HttpSession session) {
    //     if (!isValidStudentSession(session)) {
    //         return "redirect:/login";
    //     }
        
    //     Complaint complaint = complaintService.getComplaintById(complaintId);
    //     if (complaint.getStudent().getId() != userId || complaint.hasFeedback()) {
    //         return "redirect:/student/dashboard";
    //     }
        
    //     model.addAttribute("complaint", complaint);
    //     return "student-feedback-form";
    // }

    // Submit Feedback
    

    @PostMapping("/submitFeedback/{complaintId}")
    public String studentFeedbackSubmit(@PathVariable Integer complaintId,
                                      @RequestParam String feedbackContent,
                                      @RequestParam Integer rating,
                                      HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        Integer userId = (Integer) session.getAttribute("userId");
        Complaint complaint = complaintService.getComplaintById(complaintId);
        if (complaint != null && complaint.getStudent().getId() == userId) {
            complaintService.addFeedback(complaintId, feedbackContent, rating);
        }
        
        return "redirect:/student/dashboard#resolved";
    }

    // View Feedback List
    @GetMapping("/feedback-list")
    public String feedbackList(@SessionAttribute("userId") int userId, Model model, HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        List<Complaint> complaintsWithFeedback = complaintService.getComplaintsWithFeedbackByStudentId(userId);
        model.addAttribute("complaintsWithFeedback", complaintsWithFeedback);
        return "student-feedback-list";
    }

    // View Feedback Details
    @GetMapping("/feedback-details/{complaintId}")
    public String studentFeedbackDetails(@PathVariable Integer complaintId, 
                                   Model model,
                                   HttpSession session) {
    if (!isValidStudentSession(session)) {
        return "redirect:/login";
    }
    Integer userId = (Integer) session.getAttribute("userId");
    Complaint complaint = complaintService.getComplaintById(complaintId);
    if (complaint != null && complaint.getStudent().getId() == userId) {
        model.addAttribute("complaint", complaint);
        return "student-feedback-details";
    }
    
    return "redirect:/student/dashboard";
}

    // Delete Feedback
    
    @GetMapping("/feedback-delete/{complaintId}")
    public String studentFeedbackDelete(@PathVariable Integer complaintId,
                                      HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        Integer userId = (Integer) session.getAttribute("userId");
        Complaint complaint = complaintService.getComplaintById(complaintId);
        if (complaint != null && complaint.getStudent().getId() == userId) {
            complaintService.deleteFeedback(complaintId);
        }
        
        return "redirect:/student/dashboard";
    }

    //delete complaint
    @GetMapping("/deleteComplaint/{id}")
    public String deleteComplaint(@PathVariable("id") int id, HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        complaintService.deleteComplaint(id);
        return "redirect:/student/dashboard";
    }

   

    @GetMapping("/feedback-form/{complaintId}")
    public String showFeedbackForm(@PathVariable Integer complaintId,
                                 Model model,
                                 HttpSession session) {
        if (!isValidStudentSession(session)) {
            return "redirect:/login";
        }
        Integer userId = (Integer) session.getAttribute("userId");
        Complaint complaint = complaintService.getComplaintById(complaintId);
        if (complaint != null && complaint.getStudent().getId() == userId) {
            model.addAttribute("complaint", complaint);
            return "student-feedback-form";
        }

        return "redirect:/student/dashboard";
    }
}