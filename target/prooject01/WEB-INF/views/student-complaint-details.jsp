<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Complaint Details</title>
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/student/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/student/notification">Notifications</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/student/feedback-list">Feedback History</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-4">
        <h1>Complaint Details</h1>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Wi-Fi not working</h5>
                <p class="card-text"><strong>Description:</strong> The Wi-Fi connection in the main hall is not working properly since yesterday.</p>
                <p><strong>Status:</strong> Pending</p>
                <p><strong>Priority:</strong> High</p>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/student/complaints" class="btn btn-secondary mt-3">Back to Complaint List</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
