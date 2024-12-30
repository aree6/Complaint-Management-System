<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Technician Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        /* Root Variables */
        :root {
            --primary-gradient: linear-gradient(45deg, #4e73df, #224abe);
            --success-gradient: linear-gradient(45deg, #1cc88a, #13855c);
            --warning-gradient: linear-gradient(45deg, #f6c23e, #dda20a);
            --info-gradient: linear-gradient(45deg, #36b9cc, #258391);
            --nav-height: 60px;
            --font-family: 'Avenir Next', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        /* Body and General Styles */
        body {
            background-color: #f8f9fc;
            font-family: var(--font-family);
        }

        /* All text elements */
        h1, h2, h3, h4, h5, h6, 
        .navbar-brand, 
        .nav-link, 
        .btn, 
        .table, 
        .card-title,
        .badge {
            font-family: var(--font-family);
        }

        /* Navbar Styles */
        .custom-navbar {
            background: #2c3e50;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height: var(--nav-height);
        }

        .navbar-brand {
            font-weight: 600;
            font-size: 1.25rem;
        }

        .nav-link {
            position: relative;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #d61ed3 !important;
            transform: translateY(-1px);
        }

        .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 1rem;
            right: 1rem;
            height: 2px;
            background-color: #fff;
            border-radius: 2px;
        }

        /* Statistics Cards */
        .stats-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.07);
        }

        .stats-card:hover {
            transform: translateY(-5px) scale(1.01);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .bg-gradient-primary { background: var(--primary-gradient); }
        .bg-gradient-success { background: var(--success-gradient); }
        .bg-gradient-warning { background: var(--warning-gradient); }
        .bg-gradient-info { background: var(--info-gradient); }

        .stats-card .card-body {
            padding: 1.75rem;
        }

        .icon-container {
            opacity: 0.85;
            transition: all 0.3s ease;
        }

        .stats-card:hover .icon-container {
            opacity: 1;
            transform: scale(1.1) rotate(5deg);
        }

        /* Table Styles */
        .custom-table-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            overflow: hidden;
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

        .custom-tabs {
            padding: 0.5rem 1rem 0;
            border-bottom: none;
        }

        .custom-tabs .nav-link {
            color: #6c757d;
            border: none;
            padding: 1rem 1.5rem;
            font-weight: 500;
            position: relative;
            transition: all 0.3s ease;
        }

        .custom-tabs .nav-link:hover {
            color: #4a5568;
            background: rgba(0,0,0,0.02);
        }

        .custom-tabs .nav-link.active {
            color: #4e73df;
            background: transparent;
        }

        .custom-tabs .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: #4e73df;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background: #f8f9fc;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            padding: 1rem;
            border-bottom: 2px solid #e3e6f0;
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
        }

        .table tbody tr {
            transition: all 0.2s ease;
        }

        .table tbody tr:hover {
            background-color: rgba(78,115,223,0.05);
        }

        /* Status Badges */
        .status-badge {
            padding: 0.5em 1em;
            border-radius: 50rem;
            font-weight: 500;
            font-size: 0.85rem;
        }

        .badge-pending {
            background-color: #ffeeba;
            color: #856404;
        }

        .badge-resolved {
            background-color: #d4edda;
            color: #155724;
        }

        .badge-assigned {
            background-color: #cce5ff;
            color: #004085;
        }

        /* Action Buttons */
        .action-btn {
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
            border-radius: 0.5rem;
            transition: all 0.2s ease;
            margin: 0 0.2rem;
        }

        .action-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        /* Animation */
        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .stats-card .card-body {
                padding: 1.25rem;
            }
            
            .custom-tabs .nav-link {
                padding: 0.75rem 1rem;
            }

            .action-btn {
                padding: 0.25rem 0.5rem;
                font-size: 0.8rem;
            }
        }

        /* Container Spacing */
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }

        .custom-table-card {
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

        /* Responsive margins */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
        }

        /* Table Row Styling */
        .table tbody tr {
            transition: all 0.2s ease;
            border-left: 3px solid transparent;
        }

        .table tbody tr:nth-of-type(odd) {
            background-color: rgba(78, 115, 223, 0.02);
        }

        .table tbody tr:hover {
            background-color: rgba(78, 115, 223, 0.08);
            transform: translateX(3px);
        }

        /* Status-based Border Colors */
        .table tr[data-status="PENDING"] {
            border-left-color: #f6c23e;
        }

        .table tr[data-status="RESOLVED"] {
            border-left-color: #1cc88a;
        }

        .table tr[data-status="ASSIGNED"] {
            border-left-color: #36b9cc;
        }

        /* Table Cell Styling */
        .table td, .table th {
            border-top: 1px solid #e3e6f0;
            padding: 1.2rem 1rem;
            vertical-align: middle;
        }

        .table thead th {
            background: #f8f9fc;
            border-bottom: 2px solid #e3e6f0;
            font-weight: 600;
            color: #4e73df;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="bi bi-tools me-2"></i>Technician Portal
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/technician/dashboard">
                            <i class="bi bi-speedometer2 me-1"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/technician/complaints">
                            <i class="bi bi-folder2 me-1"></i>Complaints
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/technician/chat">
                            <i class="bi bi-chat-dots me-1"></i>Chat
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link position-relative" href="${pageContext.request.contextPath}/technician/notifications">
                            <i class="bi bi-bell me-1"></i>Notifications
                            <span class="position-absolute top-0 start-100 translate-middle badge ">
                             
                                <span class="visually-hidden">unread notifications</span>
                            </span>
                        </a>
                    </li>
                </ul>
                <div class="d-flex align-items-center">
                   
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light">
                        <i class="bi bi-box-arrow-right me-1"></i>Logout
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-4">
        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-4 mb-3">
                <div class="card bg-gradient-primary text-white stats-card shadow">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-subtitle mb-2">Total Complaints</h6>
                                <h2 class="card-title mb-0">${allComplaints.size()}</h2>
                            </div>
                            <i class="bi bi-folder2-open display-4 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card bg-gradient-success text-white stats-card shadow">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-subtitle mb-2">Resolved</h6>
                                <h2 class="card-title mb-0">${resolvedComplaints.size()}</h2>
                            </div>
                            <i class="bi bi-check-circle display-4 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card bg-gradient-warning text-white stats-card shadow">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-subtitle mb-2">Pending</h6>
                                <h2 class="card-title mb-0">${pendingComplaints.size()}</h2>
                            </div>
                            <i class="bi bi-clock-history display-4 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Complaints Tables -->
        <div class="custom-table-card card mx-3">
            <div class="card-header bg-white border-bottom-0">
                <ul class="nav custom-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-bs-toggle="tab" href="#all">
                            <i class="bi bi-grid me-2"></i>All Complaints
                            <span class="badge rounded-pill bg-primary ms-2">${allComplaints.size()}</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#resolved">
                            <i class="bi bi-check-circle me-2"></i>Resolved
                            <span class="badge rounded-pill bg-success ms-2">${resolvedComplaints.size()}</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#pending">
                            <i class="bi bi-clock me-2"></i>Pending
                            <span class="badge rounded-pill bg-warning ms-2">${pendingComplaints.size()}</span>
                        </a>
                    </li>
                </ul>
            </div>
            
            <div class="card-body p-0">
                <div class="tab-content">
                    <!-- All Complaints Tab -->
                    <div class="tab-pane fade show active" id="all">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>Complaint ID</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${assignedComplaints}" var="complaint">
                                        <tr data-status="${complaint.status}">
                                            <td>#${complaint.id}</td>
                                            <td class="description-cell">
                                                ${complaint.title}
                                                <a href="#" class="detail-link ms-2">
                                                    <i class="bi bi-info-circle-fill"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <span class="badge status-badge ${complaint.status == 'PENDING' ? 'badge-pending' : 'badge-resolved'}">
                                                    ${complaint.status}
                                                </span>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary action-btn" 
                                                    onclick="window.location.href='${pageContext.request.contextPath}/technician/chat?complaintId=${complaint.id}'">
                                                    <i class="bi bi-chat-dots me-1"></i>Chat
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Apply the same styling to Resolved and Pending tabs -->
                    <!-- Resolved Complaints Tab -->
                    <div class="tab-pane fade" id="resolved">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>Complaint ID</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${resolvedComplaints}" var="complaint">
                                        <tr data-status="${complaint.status}">
                                            <td>#${complaint.id}</td>
                                            <td class="description-cell">
                                                ${complaint.title}
                                                <a href="#" class="detail-link ms-2">
                                                    <i class="bi bi-info-circle-fill"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <span class="badge status-badge badge-resolved">RESOLVED</span>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-info action-btn"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/technician/feedback-list?complaintId=${complaint.id}'">
                                                    <i class="bi bi-eye me-1"></i>View Feedback
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Pending Complaints Tab -->
                    <div class="tab-pane fade" id="pending">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>Complaint ID</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pendingComplaints}" var="complaint">
                                        <tr data-status="${complaint.status}">
                                            <td>#${complaint.id}</td>
                                            <td class="description-cell">
                                                ${complaint.title}
                                                <a href="#" class="detail-link ms-2">
                                                    <i class="bi bi-info-circle-fill"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <span class="badge status-badge badge-pending">PENDING</span>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary action-btn"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/technician/chat?complaintId=${complaint.id}'">
                                                    <i class="bi bi-chat-dots me-1"></i>Chat
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>