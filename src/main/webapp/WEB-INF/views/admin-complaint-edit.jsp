<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/complaints">Complaints</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/chat">Chat</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/notifications">Notifications</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-4">
        <h1>Edit Complaint</h1>
        <form action="${pageContext.request.contextPath}/admin/updateComplaint" method="POST">
            <div class="mb-3">
                <label for="complaintTitle" class="form-label">Title</label>
                <input type="text" class="form-control" id="complaintTitle" name="title" value="Wi-Fi not working">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4">The Wi-Fi in the main hall is not functional.</textarea>
            </div>
            <div class="mb-3">
                <label for="priority" class="form-label">Priority</label>
                <select class="form-select" id="priority" name="priority">
                    <option value="Low">Low</option>
                    <option value="Medium">Medium</option>
                    <option value="High" selected>High</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
