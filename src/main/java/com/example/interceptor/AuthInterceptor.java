package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
@Component
public class AuthInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, 
                           HttpServletResponse response, 
                           Object handler) throws Exception {
        String path = request.getRequestURI();
        
        if (isPublicPath(path)) {
            return true;
        }
        
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }
        return true;
    }
    
    private boolean isPublicPath(String path) {
        return path.endsWith("/login") || 
               path.endsWith("/") || 
               path.contains("/resources/");
    }
}