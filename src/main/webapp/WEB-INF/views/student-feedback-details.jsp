<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/student/dashboard">Dashboard</a></li>
                    
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/student/feedback">Feedback List</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
        <h1>Feedback Details</h1>
        <div class="card">
            <div class="card-header bg-info text-white">
                Feedback from John Doe
            </div>
            <div class="card-body">
                <h5 class="card-title">Complaint ID: 101</h5>
                <p class="card-text">
                    <strong>Feedback:</strong> Great service, resolved quickly.
                </p>
                <p class="card-text">
                    <strong>Status:</strong> Resolved
                </p>
                <p class="card-text">
                    <strong>Submitted On:</strong> 2024-11-01 (Example Date)
                </p>
                <div>
                    <button class="btn btn-secondary" onclick="window.history.back()">Go Back</button>
                    <button class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/student/feedback-form'">Submit New Feedback</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
