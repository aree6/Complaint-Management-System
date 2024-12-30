<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">technician Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/technician/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/technician/feedback-list">All Feedback</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/technician/feedback-form">New Feedback</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-4">
        <h1>Submit Feedback</h1>
        <form action="${pageContext.request.contextPath}/technician/submitFeedback" method="POST">
            <div class="mb-3">
                <label for="feedbackTitle" class="form-label">Title</label>
                <input type="text" class="form-control" id="feedbackTitle" name="title">
            </div>
            <div class="mb-3">
                <label for="feedback" class="form-label">Feedback</label>
                <textarea class="form-control" id="feedback" name="feedback" rows="4"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Feedback</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
