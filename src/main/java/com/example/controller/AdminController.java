package com.example.controller;

import com.example.entity.Complaint;

//import com.example.entity.User;
import com.example.entity.UserRole;
import com.example.service.ComplaintService;

import com.example.service.UserService;

// import jakarta.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private ComplaintService complaintService;

    private boolean isValidAdminSession(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        UserRole role = (UserRole) session.getAttribute("userRole");
        return userId != null && role == UserRole.ADMIN;
    }

    @GetMapping("/**")
    public String validateAdminAccess(HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        return null;
    }

    // Admin Dashboard
    @GetMapping("/dashboard")
    public String adminDashboard(Model model, HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }

        model.addAttribute("allComplaints", complaintService.getAllComplaintsForAdmin());
        model.addAttribute("pendingComplaints", complaintService.getPendingComplaintsForAdmin());
        model.addAttribute("assignedComplaints", complaintService.getAssignedComplaintsForAdmin());
        model.addAttribute("resolvedComplaints", complaintService.getResolvedComplaintsForAdmin());
        
        return "admin-dashboard";
    }

    // View All Complaints
    @GetMapping("/complaints")
    public String adminComplaintList(Model model, HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        
        model.addAttribute("complaints", complaintService.getAllComplaintsForAdmin());
        return "admin-complaint-list";
    }

    // Update Complaint
    @GetMapping("/updateComplaint/{id}")
    public String adminComplaintUpdate(@PathVariable int id, Model model, HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }

        Complaint complaint = complaintService.getComplaintById(id);
        if (complaint == null) {
            return "redirect:/admin/complaints";
        }
        
        model.addAttribute("complaint", complaint);
        return "admin-complaint-update";
    }

    @PostMapping("/updateComplaint/{id}")
    public String saveComplaintUpdate(@PathVariable int id, 
                                    @ModelAttribute("complaint") Complaint complaint,
                                    HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }

        complaintService.updateComplaint(complaint);
        return "redirect:/admin/complaints";
    }

    // Edit Complaint
    @GetMapping("/complaint-edit/{id}")
    public String adminComplaintEdit(@PathVariable int id, Model model, HttpSession Session) {
        if(!isValidAdminSession(Session)) {
            return "redirect:/login";
        }
        model.addAttribute("complaint", complaintService.getComplaintById(id));
        return "admin-complaint-edit";
    }
     //delete complaint
     @GetMapping("/deleteComplaint/{id}")
     public String deleteComplaint(@PathVariable("id") int id, HttpSession session) {
            if (!isValidAdminSession(session)) {
                return "redirect:/login";
            }
         complaintService.deleteComplaint(id);
         return "redirect:/admin/dashboard";
     }



    // View Complaint Details
    @GetMapping("/complaint-details/{id}")
    public String adminComplaintDetails(@PathVariable int id, Model model, HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        model.addAttribute("complaint", complaintService.getComplaintById(id));
        return "admin-complaint-details";
    }

    // View Notifications
    @GetMapping("/notifications")
    public String adminNotification() {
        return "admin-notification";
    }

    // Chat History
    @GetMapping("/chat")
    public String adminChat(HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        return "admin-chat";
    }

    // View Feedback
    @GetMapping("/feedback")
    public String adminFeedbackList(Model model, HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        model.addAttribute("complaintsWithFeedback", complaintService.getComplaintsWithFeedback());
        return "admin-feedback-list";
    }

    @GetMapping("/feedback-form")
    public String adminFeedbackForm(HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        return "admin-feedback-form";
    }

    @GetMapping("/feedback-details/{complaintid}")
    public String adminFeedbackDetails(@PathVariable int complaintid, Model model, HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        Complaint complaint = complaintService.getComplaintById(complaintid);
        model.addAttribute("complaint", complaint);
        return "admin-feedback-details";
    }

    @PostMapping("/submitFeedback")
    public String adminFeedbackSubmit(@RequestParam Integer complaintId,
                                    @RequestParam String feedbackContent,
                                    @RequestParam Integer rating) {
        complaintService.addFeedback(complaintId, feedbackContent, rating);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/takeAction/{id}")
    public String showTakeAction(@PathVariable Integer id, Model model, HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        
        model.addAttribute("complaint", complaintService.getComplaintById(id));
        model.addAttribute("availableTechnicians", userService.getUsersByRole(UserRole.TECHNICIAN));
        return "takeAction";
    }
    
    @PostMapping("/assignTechnician")
    public String assignTechnician(@RequestParam Integer complaintId, 
                                 @RequestParam Integer technicianId,
                                 HttpSession session) {
        if (!isValidAdminSession(session)) {
            return "redirect:/login";
        }
        
        complaintService.assignTechnician(complaintId, technicianId);
        return "redirect:/admin/dashboard";
    }

    

}
