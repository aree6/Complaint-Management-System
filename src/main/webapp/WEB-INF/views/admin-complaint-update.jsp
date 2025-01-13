<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Complaint Update</title>
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
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/tech/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/tech/complaints">Complaints</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/tech/updateComplaint">Update Complaint</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/tech/chat">Chat</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-4">
        <h1>Update Complaint Status</h1>
        <form action="${pageContext.request.contextPath}/tech/updateComplaint" method="POST">
            <div class="mb-3">
                <label for="complaintId" class="form-label">Complaint ID</label>
                <input type="text" class="form-control" id="complaintId" name="complaintId" value="101" readonly>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-select" id="status" name="status">
                    <option value="Pending">Pending</option>
                    <option value="In Progress" selected>In Progress</option>
                    <option value="Resolved">Resolved</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="progress" class="form-label">Progress (%)</label>
                <input type="number" class="form-control" id="progress" name="progress" value="50" min="0" max="100">
            </div>
            <button type="submit" class="btn btn-success">Update Status</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
