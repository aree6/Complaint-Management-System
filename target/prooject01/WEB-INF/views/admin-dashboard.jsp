<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en"></html>
<head>
    <meta charset="UTF-8">
    <meta name="""viewport" content="""width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            --font-family: 'Avenir Next', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif !important;
        }

        /* Body and Background */
        body {
            background-color: hsla(344,0%,100%,1);
            background-image: 
                radial-gradient(at 91% 62%, hsla(37,86%,88%,1) 0px, transparent 50%),
                radial-gradient(at 53% 29%, hsla(349,100%,84%,1) 0px, transparent 50%),
                radial-gradient(at 11% 45%, hsla(137,82%,83%,1) 0px, transparent 50%),
                radial-gradient(at 51% 94%, hsla(178,59%,76%,1) 0px, transparent 50%);
            font-family: var(--font-family);
            background-attachment: fixed;
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
            background: rgba(248, 249, 252, 0.2) !important;
            backdrop-filter: blur(10px);
            height: var(--nav-height);
        }

        .navbar-brand, 
        .nav-link {
            color: #2c3e50 !important;
        }

        .nav-link:hover {
            color: #4e73df !important;
        }

        .nav-link.active {
            color: #4e73df !important;
            font-weight: 600;
        }

        .btn-outline-light {
            color: #2c3e50;
            border-color: #2c3e50;
        }

        .btn-outline-light:hover {
            color: #fff;
            background-color: #2c3e50;
        }

        /* Statistics Cards */
        .stats-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.07);
            background: rgba(255, 255, 255, 0.1) !important;
            backdrop-filter: blur(5px);
            background-image: 
                radial-gradient(at 91% 62%, hsla(37,86%,88%,1) 0px, transparent 50%),
                radial-gradient(at 53% 29%, hsla(349,100%,84%,1) 0px, transparent 50%),
                radial-gradient(at 11% 45%, hsla(137,82%,83%,1) 0px, transparent 50%),
                radial-gradient(at 51% 94%, hsla(178,59%,76%,1) 0px, transparent 50%) !important;
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
            background: rgba(248, 249, 252, 0.2) !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(227, 230, 240, 0.3);
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
            background: rgba(248, 249, 252, 0.2) !important;
        }

        .table thead th {
            background: rgba(248, 249, 252, 0.2) !important;
            backdrop-filter: blur(5px);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            padding: 1rem;
            border-bottom: 2px solid rgba(227, 230, 240, 0.3);
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
        }

        .table tbody tr {
            transition: all 0.2s ease;
            background: rgba(248, 249, 252, 0.2) !important;
        }

        .table tbody tr:nth-child(odd) {
            background: rgba(248, 249, 252, 0.1) !important;
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
        .table thead th {
    background: #f8f9fc;
    border-bottom: 2px solid #e3e6f0;
    font-weight: 600;
    color: #4e73df;
}
        .action-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
.table td, .table th {
    border-top: 1px solid #e3e6f0;
    padding: 1rem;
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
            background: rgba(248, 249, 252, 0.2) !important;

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

        .disabled {
            opacity: 0.6;
            cursor: not-allowed;
            pointer-events: none;
        }






        .Btn {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  width: 50px;
  height: 50px;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition-duration: 0.4s;
  box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
  background: linear-gradient(to right, #3498db, #e74c3c);
}

.sign {
  width: 100%;
  transition-duration: 0.3s;
  display: flex;
  align-items: center;
  justify-content: center;
}

.sign svg {
  width: 17px;
}

.sign svg path {
  fill: white;
}

.text {
  position: absolute;
  right: 0%;
  width: 0%;
  opacity: 0;
  color: #ecf0f1;
  /* font-size: 1.2em;
  font-weight: 600; */
  transition-duration: 0.3s;
}

.Btn:hover {
  width: 150px;
  border-radius: 20px;
  transition-duration: 0.25s;
  background: linear-gradient(to right, #3498db, #e74c3c);
}

.Btn:hover .sign {
  width: 30%;
  transition-duration: 0.2s;
  padding-left: 12px;
}
button[disabled] {
    text-decoration: line-through;
}

.Btn:hover .text {
  opacity: 1;
  width: 70%;
  transition-duration: 0.2s;
  padding-right: 10px;
}

.Btn:active {
  transform: translate(2px, 2px);
  box-shadow: 0 0 0 rgba(0, 0, 0, 0.2);
}
    </style>
</head>
<body class="bg-light">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard">
                <i class="bi bi-shield-lock-fill me-2"></i>Admin Portal
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/dashboard">
                            <i class="bi bi-speedometer2 me-1"></i>Dashboard
                        </a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/complaints">
                            <i class="bi bi-folder2 me-1"></i>Complaints
                        </a>
                    </li> -->
                    <li class="nav-item">
                        <!-- <a class="nav-link position-relative" href="${pageContext.request.contextPath}/admin/notifications">
                            <i class="bi bi-bell me-1"></i>Notifications
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill ">
                                
                            </span>
                        </a> -->
                    </li>
                </ul>
                <div class="d-flex align-items-center">
                    <span class="text-light me-3">
                        <i class="bi bi-person-circle me-1"></i>Admin
                    </span>
                    <!-- <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm">
                        <i class="bi bi-box-arrow-right me-1"></i>Logout
                    </a> -->
                    <button class="Btn">
                        <div class="sign">
                          <svg viewBox="0 0 512 512">
                            <path
                              d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"
                            ></path>
                          </svg>
                        </div>
                      
                        <div class="text" onclick="window.location.href='${pageContext.request.contextPath}/logout'" >Logout</div>
                      </button>
                      
                </div>
            </div>
        </div>
    </nav>
    <div class="container py-4">  <!-- Changed from container-container -->
        <!-- Statistics Cards -->
        <div class="row g-4 px-3">  <!-- Added px-3 for horizontal padding -->
            <!-- Total Complaints Card -->
            <div class="col-xl-3 col-md-6 fade-in">
                <div class="stats-card bg-gradient-primary text-black">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-uppercase mb-2 opacity-75">Total Complaints</h6>
                                <h2 class="mb-0 display-6">${allComplaints.size()}</h2>
                            </div>
                            <div class="icon-container">
                                <i class="bi bi-folder2-open display-4"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Resolved Card -->
            <div class="col-xl-3 col-md-6 fade-in" style="animation-delay: 0.1s">
                <div class="stats-card bg-gradient-success text-black">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-uppercase mb-2 opacity-75">Resolved</h6>
                                <h2 class="mb-0 display-6">${resolvedComplaints.size()}</h2>
                            </div>
                            <div class="icon-container">
                                <i class="bi bi-check-circle display-4"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Pending Complaints Card -->
            <div class="col-xl-3 col-md-6 fade-in" style="animation-delay: 0.2s">
                <div class="stats-card bg-gradient-warning text-black">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-uppercase mb-2 opacity-75">Pending</h6>
                                <h2 class="mb-0 display-6">${pendingComplaints.size()}</h2>
                            </div>
                            <div class="icon-container">
                                <i class="bi bi-clock display-4"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Assigned Complaints Card -->
            <div class="col-xl-3 col-md-6 fade-in" style="animation-delay: 0.3s">
                <div class="stats-card bg-gradient-info text-black">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-uppercase mb-2 opacity-75">Assigned</h6>
                                <h2 class="mb-0 display-6">${assignedComplaints.size()}</h2>
                            </div>
                            <div class="icon-container">
                                <i class="bi bi-person-check display-4"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    </div>


       <!-- New Complaints Table Section -->
<div class="custom-table-card card mx-3">  <!-- Added mx-3 for horizontal margin -->
    <div class="card-header border-bottom-0" style="background: rgba(248, 249, 252, 0.2)">
        <ul class="nav custom-tabs" role="tablist">
            <li class="nav-item" >
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
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#assigned">
                    <i class="bi bi-person-fill me-2"></i>Assigned
                    <span class="badge rounded-pill bg-info ms-2">${assignedComplaints.size()}</span>
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
                            <c:forEach var="complaint" items="${allComplaints}">
                                <tr data-status="${complaint.status}">
                                    <td>${complaint.id}</td>
                                    <td class="description-cell">
                                        ${complaint.title}
                                        <a href="${pageContext.request.contextPath}/admin/complaint-details/${complaint.id}" 
                                           class="detail-link">
                                            <i class="bi bi-info-circle-fill"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <span class="badge status-badge ${complaint.status eq 'PENDING' ? 'badge-pending' : 
                                                                        complaint.status eq 'RESOLVED' ? 'badge-resolved' : 
                                                                        complaint.status eq 'ASSIGNED' ? 'badge-assigned' : ''}">${complaint.status}</span>
                                    </td>
                                    <td>
                                        <!-- <button class="btn btn-sm btn-outline-primary"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/chat?complaintId=${complaint.id}'">
                                            <i class="bi bi-chat-dots me-1"></i>Chat
                                        </button> -->
                                        <button class="btn btn-sm btn-outline-danger ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/deleteComplaint/${complaint.id}'"
                                            ${complaint.status eq 'RESO""LVED' ? 'disabled' : ''}>
                                            <i class="bi bi-trash me-1"></i>Delete
                                        </button>
                                        <c:choose>
                                            <c:when test="${complaint.status eq 'RESOLVED'}">
                                                <button class="btn btn-sm btn-outline-info action-btn ${complaint.feedbackContent == null ? 'disabled' : ''}"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/feedback-details/${complaint.id}'"
                                                    ${complaint.feedbackContent == null ? 'disabled' : ''}>
                                                    <i class="bi bi-star me-1"></i>
                                                    ${complaint.feedbackContent == null ? 'No Feedback' : 'See Feedback'}
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-sm btn-outline-success ${complaint.status eq 'ASSIGNED' || complaint.status eq 'RESOLVED' ? 'disabled' : ''}"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/takeAction/${complaint.id}'"
                                                    ${complaint.status eq 'ASSIGNED' || complaint.status eq 'RESOLVED' ? 'disabled' : ''}>
                                                    <i class="bi bi-check-circle me-1"></i>Take Action
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Resolved Complaints Tab -->
            <div class="tab-pane fade" id="resolved">
                <div class="table-responsive">
                    <table class="table table-striped table-hover mb-0">
                        <thead>
                            <tr>
                                <th>Complaint ID</th>
                                <th>Description</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="complaint" items="${resolvedComplaints}">
                                <tr data-status="${complaint.status}">
                                    <td>${complaint.id}</td>
                                    <td class="description-cell">
                                        ${complaint.title}
                                        <a href="${pageContext.request.contextPath}/admin/complaint-details/${complaint.id}" 
                                           class="detail-link">
                                            <i class="bi bi-info-circle-fill"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-info action-btn ${complaint.feedbackContent == null ? 'disabled' : ''}"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/feedback-details/${complaint.id}'"
                                            ${complaint.feedbackContent == null ? 'disabled' : ''}>
                                            <i class="bi bi-star me-1"></i>
                                            ${complaint.feedbackContent == null ? 'No Feedback' : 'See Feedback'}
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
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="complaint" items="${pendingComplaints}">
                                <tr data-status="${complaint.status}">
                                    <td>${complaint.id}</td>
                                    <td class="description-cell">
                                        ${complaint.title}
                                        <a href="${pageContext.request.contextPath}/admin/complaint-details/${complaint.id}" 
                                           class="detail-link">
                                            <i class="bi bi-info-circle-fill"></i>
                                        </a>
                                    </td>
                                  
                                    <td>
                                        <!-- <button class="btn btn-sm btn-outline-primary"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/chat?complaintId=${complaint.id}'">
                                            <i class="bi bi-chat-dots me-1"></i>Chat
                                        </button> -->
                                        <button class="btn btn-sm btn-outline-danger"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/deleteComplaint/${complaint.id}'">
                                            <i class="bi bi-trash me-1"></i>Delete
                                        </button>
                                        <button class="btn btn-sm btn-outline-success"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/takeAction/${complaint.id}'">
                                            <i class="bi bi-check-circle me-1"></i>Take Action
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Assigned Complaints Tab -->
            <div class="tab-pane fade" id="assigned">
                <div class="table-responsive">
                    <table class="table table-striped table-hover mb-0">
                        <thead>
                            <tr>
                                <th>Complaint ID</th>
                                <th>Description</th>
                                <th>Assigned to</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="complaint" items="${assignedComplaints}">
                                <tr data-status="${complaint.status}">
                                    <td>${complaint.id}</td>
                                    <td class="description-cell">
                                        ${complaint.title}
                                        <a href="${pageContext.request.contextPath}/admin/complaint-details/${complaint.id}" 
                                           class="detail-link">
                                            <i class="bi bi-info-circle-fill"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <span class="badge status-badge ${complaint.status eq 'PENDING' ? 'badge-pending' : 
                                                                        complaint.status eq 'RESOLVED' ? 'badge-resolved' : 
                                                                        complaint.status eq 'ASSIGNED' ? 'badge-assigned' : ''}">${complaint.getTechnician().name}</span>
                                    </td>
                                    <td>
                                        <!-- <button class="btn btn-sm btn-outline-primary"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/chat?complaintId=${complaint.id}'">
                                            <i class="bi bi-chat-dots me-1"></i>Chat
                                        </button> -->
                                        <button class="btn btn-sm btn-outline-danger ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/deleteComplaint/${complaint.id}'"
                                            ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}>
                                            <i class="bi bi-trash me-1"></i>Delete
                                        </button>
                                        <!-- <button class="btn btn-sm btn-outline-success"
                                            onclick="window.location.href='${pageContext.request.contextPath}/admin/takeAction/${complaint.id}'">
                                            <i class="bi bi-check-circle me-1"></i>Take Action
                                        </button> -->
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

