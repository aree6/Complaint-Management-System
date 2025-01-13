package com.example.entity;

import javax.persistence.*;
import java.util.List;
// import com.example.entity.Complaint;
// import com.example.entity.UserRole;


@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int UserId;

    @Column(name = "username", nullable = false)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false)
    private UserRole role;

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Complaint> submittedComplaints;

    @OneToMany(mappedBy = "technician", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Complaint> assignedComplaints;

    @Column(name = "status", nullable = false)
    @org.hibernate.annotations.ColumnDefault("'AVAILABLE'")
    private String status = "AVAILABLE"; // Default value

    // Constructor
    public User() {}

    // Getters and Setters
    public int getId() {
        return UserId;
    }

    public void setId(int id) {
        this.UserId = id;
    }

    public String getName() {
        return username;
    }

    public void setName(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public List<Complaint> getSubmittedComplaints() {
        return submittedComplaints;
    }

    public void setSubmittedComplaints(List<Complaint> submittedComplaints) {
        this.submittedComplaints = submittedComplaints;
    }

    public List<Complaint> getAssignedComplaints() {
        return assignedComplaints;
    }

    public void setAssignedComplaints(List<Complaint> assignedComplaints) {
        this.assignedComplaints = assignedComplaints;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isBusy() {
        return "BUSY".equals(status);
    }
}