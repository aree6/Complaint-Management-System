<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Submitted</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Technician Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/technician/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/technician/feedback-list">All Feedback</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/technician/feedback-form">New Feedback</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-4 text-center">
        <h1 class="text-success">Feedback Submitted Successfully!</h1>
        <p>Thank you for sharing your feedback. We appreciate your input.</p>
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/technician/dashboard" class="btn btn-secondary me-2">Back to Home</a>
            <a href="${pageContext.request.contextPath}/technician/feedback-form" class="btn btn-primary">Submit Another Feedback</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
