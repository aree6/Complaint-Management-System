<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Complaint List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/complaints">Complaints</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/notifications">Notifications</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-4">
        <h1>Admin - Complaint List</h1>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through complaints -->
                <c:forEach var="complaint" items="${complaints}">
                    <tr>
                        <td>${complaint.id}</td>
                        <td>${complaint.title}</td>
                        <td>
                            <c:choose>
                                <c:when test="${complaint.status.toLowerCase() == 'pending'}">
                                    <span class="badge bg-warning">Pending</span>
                                </c:when>
                                <c:when test="${complaint.status.toLowerCase() == 'resolved'}">
                                    <span class="badge bg-success">Resolved</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary">Unknown</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/complaint-details/${complaint.id}" class="btn btn-sm btn-primary">Details</a>
                            <a href="${pageContext.request.contextPath}/admin/complaint-edit/${complaint.id}" class="btn btn-sm btn-warning">Edit</a>
                            <a href="${pageContext.request.contextPath}/admin/chat/${complaint.id}" class="btn btn-sm btn-primary">Chat</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
