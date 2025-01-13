// package com.example.entity;

// import javax.persistence.*;
// import java.time.LocalDateTime;

// @Entity
// @Table(name = "feedback")
// public class Feedback {
//     @Id
//     @GeneratedValue(strategy = GenerationType.IDENTITY)
//     private int id;

//     @ManyToOne
//     @JoinColumn(name = "complaint_id", nullable = false)
//     private Complaint complaint;

//     @ManyToOne
//     @JoinColumn(name = "user_id", nullable = false)
//     private User user;

//     @Column(name = "content", nullable = false, columnDefinition = "TEXT")
//     private String content;

//     @Column(name = "rating")
//     private int rating;

//     @Column(name = "created_at")
//     private LocalDateTime createdAt;

//     // Constructor
//     public Feedback() {
//         this.createdAt = LocalDateTime.now();
//     }

//     // Getters and Setters
//     public int getId() {
//         return id;
//     }

//     public void setId(int id) {
//         this.id = id;
//     }

//     public Complaint getComplaint() {
//         return complaint;
//     }

//     public void setComplaint(Complaint complaint) {
//         this.complaint = complaint;
//     }

//     public User getUser() {
//         return user;
//     }

//     public void setUser(User user) {
//         this.user = user;
//     }

//     public String getContent() {
//         return content;
//     }

//     public void setContent(String content) {
//         this.content = content;
//     }

//     public int getRating() {
//         return rating;
//     }

//     public void setRating(int rating) {
//         this.rating = rating;
//     }

//     public LocalDateTime getCreatedAt() {
//         return createdAt;
//     }

//     public void setCreatedAt(LocalDateTime createdAt) {
//         this.createdAt = createdAt;
//     }

//     public boolean FeedbackIsEmpty() {
//         return content == null;
//     }
// }
