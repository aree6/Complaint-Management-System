<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Technician Chat</title>
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
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/technician/complaints">Complaints</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/technician/chat">Chat</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/technician/notifications">Notifications</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <h1>Chat with Admin</h1>
        <div class="card">
            <div class="card-body">
                <div class="chat-box mb-3" style="height: 300px; overflow-y: auto; background-color: #f8f9fa; padding: 15px;">
                    <!-- Sample Messages -->
                    <p><b>Admin:</b> Is the complaint resolved?</p>
                    <p><b>Technician:</b> Not yet, still working on it.</p>
                </div>
                <form action="${pageContext.request.contextPath}/tech/chat" method="POST">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Type your message..." name="message">
                        <button type="submit" class="btn btn-primary">Send</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
