
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Deleted</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Student Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/student/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/student/feedback-list">All Feedback</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/student/feedback-form">New Feedback</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-4 text-center">
        <h1 class="text-danger">Feedback Deleted Successfully!</h1>
        <p>The feedback has been removed from the system.</p>
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/student/dashboard" class="btn btn-secondary me-2">Back to Home</a>
            <a href="${pageContext.request.contextPath}/student/feedback-list" class="btn btn-primary">View All Feedback</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
