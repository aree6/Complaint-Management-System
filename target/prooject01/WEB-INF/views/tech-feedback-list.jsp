<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback List</title>
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
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/technician/dashboard">Dashboard</a></li>
                    
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/technician/feedback">Feedback List</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <h1>Feedback List</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>technician Name</th>
                    <th>Feedback</th>
                    <th>Complaint ID</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>Great service, resolved quickly.</td>
                    <td>101</td>
                    <td><a href="${pageContext.request.contextPath}/technician/feedback-details?id=1" class="btn btn-info">View</a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jane Smith</td>
                    <td>Issue resolved but took longer than expected.</td>
                    <td>102</td>
                    <td><a href="${pageContext.request.contextPath}/technician/feedback-details?id=2" class="btn btn-info">View</a></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
