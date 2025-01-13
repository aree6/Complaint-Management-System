package com.example.controller;

// import com.example.entity.Chat;
import com.example.entity.Complaint;
import com.example.entity.MessageSender;
import com.example.entity.UserRole;
import com.example.service.ComplaintService;
// import com.example.service.ChatService;
import com.example.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/technician")
public class TechnicianController {
    // @Autowired
    // private ChatService chatService;
    
    @Autowired
    private MessageService messageService;
    
    @Autowired
    private ComplaintService complaintService;

    private boolean isValidTechnicianSession(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        UserRole role = (UserRole) session.getAttribute("userRole");
        return userId != null && role == UserRole.TECHNICIAN;
    }

    @GetMapping("/**")
    public String validateTechnicianAccess(HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }
        return null;
    }

    // Technician Dashboard
    @GetMapping("/dashboard")
    public String technicianDashboard(Model model, HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }

        Integer userId = (Integer) session.getAttribute("userId");
        List<Complaint> assignedComplaints = complaintService.getComplaintsByTechnicianId(userId);
        model.addAttribute("technicianComplaints", assignedComplaints);
        List<Complaint> resolvedComplaintsByTechnician = complaintService.getResolvedComplaintsByTechnicianId(userId);
        model.addAttribute("resolvedTechnicianComplaints", resolvedComplaintsByTechnician);

        
        return "technician-dashboard";
    }

    // View Assigned Complaints
    @GetMapping("/complaints/{id}")
    public String viewComplaint(@PathVariable Integer id, Model model, HttpSession session) {
        if (!isValidTechnicianSession(session)) {
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
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }

        complaintService.updateStatus(id, status);
        return "redirect:/technician/dashboard";
    }

    // View Complaint Details
    @GetMapping("/complaint/detail/{id}")
    public String technicianComplaintDetails(@PathVariable int id, Model model, HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }
        model.addAttribute("complaint", complaintService.getComplaintById(id));
        return "tech-complaint-details";
    }

    // View Notifications
    @GetMapping("/notifications")
    public String technicianNotification(HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }
        return "tech-notification";
    }

    // Chat
    @GetMapping("/chat/{complaintId}")
public String technicianChat(@PathVariable int complaintId, Model model, HttpSession session) {
    if (!isValidTechnicianSession(session)) {
        return "redirect:/login";
    }

    Integer technicianId = (Integer) session.getAttribute("userId");

    Complaint complaint = complaintService.getComplaintById(complaintId);
    if (complaint == null || complaint.getTechnician().getId() != technicianId) {
        return "redirect:/technician/dashboard";
    }

    model.addAttribute("messages", messageService.getComplaintMessages(complaintId));
    model.addAttribute("complaintId", complaintId);
    model.addAttribute("currentUserId", technicianId);
    return "tech-chat";
}

    // Handle sending message
    @PostMapping("/chat/send")
    public String sendMessage(
        @RequestParam("complaintId") int complaintId,
        @RequestParam("content") String content,
        HttpSession session
    ) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }
        
        Integer technicianId = (Integer) session.getAttribute("userId");
        
        messageService.sendMessage(complaintId, technicianId, content, MessageSender.TECHNICIAN);
        return "redirect:/technician/chat/" + complaintId;
    }

    // Updated Feedback Form
    @GetMapping("/feedback-form/{complaintId}")
    public String technicianFeedbackForm(@PathVariable int complaintId, Model model, HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }
        Complaint complaint = complaintService.getComplaintById(complaintId);
        model.addAttribute("complaint", complaint);
        return "tech-feedback-form";
    }

    @PostMapping("/submitFeedback")
    public String submitTechnicianFeedback(@RequestParam int complaintId, 
                                         @RequestParam String feedbackContent, HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }
        Complaint complaint = complaintService.getComplaintById(complaintId);
        complaint.setFeedbackContent(feedbackContent);
        complaintService.saveComplaint(complaint);
        return "tech-feedback-submitted";
    }

    // View Feedback List
    @GetMapping("/feedback-list")
    public String feedbackList(@SessionAttribute("userId") int userId, Model model, HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }
        List<Complaint> complaintsWithFeedback = complaintService.getComplaintsWithFeedbackByTechnicianId(userId);
        model.addAttribute("complaintsWithFeedback", complaintsWithFeedback);
        return "tech-feedback-list";
    }

    // View Feedback Details
    @GetMapping("/feedback-details/{id}")
    public String technicianFeedbackDetails(@PathVariable int id, Model model, HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }
        model.addAttribute("complaint", complaintService.getComplaintById(id));
        return "tech-feedback-details";
    }

    @GetMapping("/resolve/{id}")
    public String resolveComplaint(@PathVariable Integer id, HttpSession session) {
        if (!isValidTechnicianSession(session)) {
            return "redirect:/login";
        }

        Integer technicianId = (Integer) session.getAttribute("userId");

        complaintService.resolveComplaint(id, technicianId);
        return "redirect:/technician/dashboard";
    }
}
