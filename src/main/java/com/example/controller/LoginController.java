package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

//import com.example.service.UserService;
import com.example.service.AuthService;
import com.example.entity.User;
//import com.example.entity.UserRole;

@Controller
public class LoginController {
    @Autowired
    private AuthService authService;
    
    @GetMapping("/")
    public String showIndex() {
        return "index";
    }
    
    @GetMapping("/login")
public String showLogin(HttpSession session) {
    // Check if user is already logged in
    if (session.getAttribute("userId") != null) {
        session.invalidate(); // If logged in, invalidate the session
    }
    return "login"; // If no session exists, show the login page
}

    @PostMapping("/login")
    public String processLogin(@RequestParam String username, 
                             @RequestParam String password,
                             HttpSession session,
                             RedirectAttributes redirectAttrs) {
        User user = authService.authenticate(username, password);
        if (user != null) {
            session.setAttribute("userId", user.getId());
            session.setAttribute("userRole", user.getRole());
            
            switch (user.getRole()) {
                case STUDENT:
                    return "redirect:/student/dashboard";
                case ADMIN:
                    return "redirect:/admin/dashboard";
                case TECHNICIAN:
                    return "redirect:/technician/dashboard";
                default:
                    return "redirect:/login";
            }
        }
        redirectAttrs.addFlashAttribute("error", "Invalid credentials");
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttrs) {
        session.invalidate();
        redirectAttrs.addFlashAttribute("message", "You have been successfully logged out");
        return "landing-page";
    }
}