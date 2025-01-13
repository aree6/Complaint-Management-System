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
        button[disabled] {
    text-decoration: line-through;
}

        /* Navbar Styles */
        .custom-navbar {
            background: rgba(248, 249, 252, 0.2) !important;
            backdrop-filter: blur(10px);
            height: var(--nav-height);
            
            
        }

        .navbar-brand {
            font-weight: 600;
            font-size: 1.25rem;
            color: black;
        }

        .nav-link {
            position: relative;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
            color: black;
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
            background: rgba(255, 255, 255, 0.2) !important;
            backdrop-filter: blur(10px);
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
            background: rgba(248, 249, 252, 0.2) !important;
            backdrop-filter: blur(5px);
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
            background: rgba(248, 249, 252, 0.2) !important;
        }

        .table tbody tr {
            transition: all 0.2s ease;
            background: rgba(248, 249, 252, 0.2) !important;
        }

        .table tbody tr:nth-of-type(odd) {
            background-color: rgba(78, 115, 223, 0.02);
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
/* From Uiverse.io by mRcOol7 */ 
.Btn-logout {
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
  transition-duration: 0.4s;
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
  transition-duration: 0.4s;
}

.Btn-logout:hover {
  width: 150px;
  border-radius: 20px;
  transition-duration: 0.4s;
  background: linear-gradient(to right, #3498db, #e74c3c);
}

.Btn-logout:hover .sign {
  width: 30%;
  transition-duration: 0.4s;
  padding-left: 12px;
}

.Btn-logout:hover .text {
  opacity: 1;
  width: 70%;
  transition-duration: 0.4s;
  padding-right: 10px;
}

.Btn-logout:active {
  transform: translate(2px, 2px);
  box-shadow: 0 0 0 rgba(0, 0, 0, 0.2);
}



/* From Uiverse.io by simplicitywebdesign */ 
.btnDone {
    position: relative;
    padding: 6px 11px;
    background: transparent;
    color: #0275d8; /* Bootstrap primary color */
    border: 1px solid #0275d8; /* Bootstrap primary color outline */
    border-radius: 5px;
    box-shadow: 0 0 0 rgba(2, 117, 216, 0.5); /* Light primary color shadow */
    transition: all 0.3s ease-in-out;
    cursor: pointer;
}

.star-1, .star-2, .star-3, .star-4, .star-5, .star-6 {
    opacity: 0;
    transition: all 0.3s ease-in-out;
}

.btnDone:hover .star-1,
.btnDone:hover .star-2,
.btnDone:hover .star-3,
.btnDone:hover .star-4,
.btnDone:hover .star-5,
.btnDone:hover .star-6 {
    opacity: 1;
    fill: #00ff00; /* Green color for stars */
}

.star-1 {
    position: absolute;
    top: 20%;
    left: 20%;
    width: 25px;
    height: auto;
    filter: drop-shadow(0 0 0 rgba(2, 117, 216, 0.5)); /* Light primary color shadow */
    z-index: -5;
    transition: all 1.5s cubic-bezier(0.05, 0.83, 0.43, 0.96);
}

.star-2 {
    position: absolute;
    top: 45%;
    left: 45%;
    width: 15px;
    height: auto;
    filter: drop-shadow(0 0 0 #d6cbe4);
    z-index: -5;
    transition: all 1s cubic-bezier(0, 0.4, 0, 1.01);
}

.star-3 {
    position: absolute;
    top: 40%;
    left: 40%;
    width: 5px;
    height: auto;
    filter: drop-shadow(0 0 0 rgba(2, 117, 216, 0.5)); /* Light primary color shadow */
    z-index: -5;
    transition: all 1s cubic-bezier(0, 0.4, 0, 1.01);
}

.star-4 {
    position: absolute;
    top: 20%;
    left: 40%;
    width: 8px;
    height: auto;
    filter: drop-shadow(0 0 0 rgba(2, 117, 216, 0.5)); /* Light primary color shadow */
    z-index: -5;
    transition: all 0.8s cubic-bezier(0, 0.4, 0, 1.01);
}

.star-5 {
    position: absolute;
    top: 25%;
    left: 45%;
    width: 15px;
    height: auto;
    filter: drop-shadow(0 0 0 #d6cbe4);
    z-index: -5;
    transition: all 0.6s cubic-bezier(0, 0.4, 0, 1.01);
}

.star-6 {
    position: absolute;
    top: 5%;
    left: 50%;
    width: 5px;
    height: auto;
    filter: drop-shadow(0 0 0 rgba(2, 117, 216, 0.5)); /* Light primary color shadow */
    z-index: -5;
    transition: all 0.8s ease;
}

.btnDone:hover {
    background: #0275d8; /* Bootstrap primary background color */
    box-shadow: 0 0 25px rgba(2, 117, 216, 0.5); /* Light primary shadow on hover */
    color: white;
}

.btnDone:hover .star-1 {
    position: absolute;
    top: -80%;
    left: -30%;
    width: 25px;
    height: auto;
    filter: drop-shadow(0 0 10px #fffdef);
    z-index: 2;
    transform: rotate(15deg);
}

.btnDone:hover .star-2 {
    position: absolute;
    top: -25%;
    left: 10%;
    width: 15px;
    height: auto;
    filter: drop-shadow(0 0 10px #fffdef);
    z-index: 2;
    transform: rotate(-20deg);
}

.btnDone:hover .star-3 {
    position: absolute;
    top: 55%;
    left: 25%;
    width: 5px;
    height: auto;
    filter: drop-shadow(0 0 10px #fffdef);
    z-index: 2;
    transform: rotate(50deg);
}

.btnDone:hover .star-4 {
    position: absolute;
    top: 30%;
    left: 80%;
    width: 8px;
    height: auto;
    filter: drop-shadow(0 0 10px #fffdef);
    z-index: 2;
}

.btnDone:hover .star-5 {
    position: absolute;
    top: 25%;
    left: 115%;
    width: 15px;
    height: auto;
    filter: drop-shadow(0 0 10px #fffdef);
    z-index: 2;
    transform: rotate(-25deg);
}

.btnDone:hover .star-6 {
    position: absolute;
    top: 5%;
    left: 60%;
    width: 5px;
    height: auto;
    filter: drop-shadow(0 0 10px #fffdef);
    z-index: 2;
    transform: rotate(60deg);
}

/* Root Variables and Background */
html, body {
    min-height: 100vh;
    background-color: #f8f9fc;
    background-image: 
        radial-gradient(at 91% 62%, hsla(37,86%,88%,1) 0px, transparent 50%),
        radial-gradient(at 53% 29%, hsla(349,100%,84%,1) 0px, transparent 50%),
        radial-gradient(at 11% 45%, hsla(137,82%,83%,1) 0px, transparent 50%),
        radial-gradient(at 51% 94%, hsla(178,59%,76%,1) 0px, transparent 50%);
    background-attachment: fixed;
    font-family: var(--font-family);
}

    </style>
</head>
<body class="bg-light">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg  custom-navbar sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="bi bi-tools me-2"></i>Technician Portal
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item ">
                        <a class="nav-link " href="${pageContext.request.contextPath}/technician/dashboard">
                            <i class="bi bi-speedometer2 me-1"></i>Dashboard
                        </a>
                    </li>
                    <!-- <li class="nav-item">
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
                    </li> -->
                </ul>
                <div class="d-flex align-items-center">
                   
                    <button class="Btn-logout" >
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

    <div class="container py-4">
        <!-- Statistics Cards -->
        <!-- <div class="row mb-4">
            <div class="col-md-4 mb-3">
                <div class="card bg-gradient-primary text-white stats-card shadow">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-subtitle mb-2">Total Complaints</h6>
                                <h2 class="card-title mb-0">${technicianComplaints.size()}</h2>
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
                                <h2 class="card-title mb-0">${resolvedTechnicianComplaints.size()}</h2>
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
                                <h2 class="card-title mb-0">${pendingTechnicianComplaints.size()}</h2>
                            </div>
                            <i class="bi bi-clock-history display-4 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->

        <!-- Complaints Tables -->
        <div class="custom-table-card card mx-3">
            <div class="card-header border-bottom-0" style="background: rgba(248, 249, 252, 0.2) !important;">
                <ul class="nav custom-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-bs-toggle="tab" href="#all">
                            <i class="bi bi-clock me-2"></i>To do
                            <span class="badge rounded-pill bg-primary ms-2">${technicianComplaints != null ? technicianComplaints.size() : 0}</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#resolved">
                            <i class="bi bi-check-circle me-2"></i>Resolved
                            <span class="badge rounded-pill bg-success ms-2">${resolvedTechnicianComplaints.size()}</span>
                        </a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#pending">
                            <i class="bi bi-clock me-2"></i>Pending
                            <span class="badge rounded-pill bg-warning ms-2">${pendingTechnicianComplaints.size()}</span>
                        </a>
                    </li> -->
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
                                    <c:forEach items="${technicianComplaints}" var="complaint">
                                        <tr data-status="${complaint.status}">
                                            <td>#${complaint.id}</td>
                                            <td class="description-cell">
                                                ${complaint.title}
                                                <a href="${pageContext.request.contextPath}/technician/complaint/detail/${complaint.id}" class="detail-link ms-2">
                                                    <i class="bi bi-info-circle-fill"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <span class="badge status-badge ${complaint.status == 'PENDING' ? 'badge-pending' : 'badge-resolved'}">
                                                    Assigned to me
                                                </span>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/technician/chat/${complaint.id}'">
                                                    <i class="bi bi-chat-dots me-1"></i>Chat
                                                </button>
                                                <!-- <button class="btn btn-sm btn-outline-success action-btn"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/technician/resolve/${complaint.id}'">
                                                    <i class="bi bi-check-circle me-1"></i> Mark as Done
                                            </button> -->
                                                 
 
                                        <!-- <button class="StartButton bi-check2-circle " onclick="window.location.href='${pageContext.request.contextPath}/technician/resolve/${complaint.id}'">
                                            Mark as Done
                                         -->
                                         <button class="btnDone bi-check2-circle " onclick="window.location.href='${pageContext.request.contextPath}/technician/resolve/${complaint.id}'" >
                                            Mark as Done
                                           <div class="star-1">
                                             <svg
                                               version="1.1"
                                               id="Layer_1"
                                               xmlns="http://www.w3.org/2000/svg"
                                               xmlns:xlink="http://www.w3.org/1999/xlink"
                                               x="0px"
                                               y="0px"
                                               viewBox="0 0 100 100"
                                               style="enable-background:new 0 0 100 100;"
                                               xml:space="preserve"
                                             >
                                               <path
                                                 class="st1"
                                                 d="M54.7,6.1l9.6,24.6c0.7,1.8,2.4,3,4.4,3.1l26.7,1.4c4.6,0.2,6.4,6,2.8,8.8L77.5,60.4c-1.6,1.2-2.2,3.3-1.7,5.2
                                             l6.9,25.3c1.2,4.4-3.6,7.9-7.4,5.5L52.6,81.9c-1.6-1-3.7-1-5.3,0L24.7,96.3c-3.8,2.4-8.6-1.1-7.4-5.5l6.9-25.2
                                             c0.5-1.9-0.1-3.9-1.7-5.2L1.9,44c-3.6-2.8-1.7-8.6,2.8-8.8l26.7-1.3c1.9-0.1,3.7-1.3,4.4-3.1l9.7-24.6C47.1,1.9,53,1.9,54.7,6.1z"
                                               ></path>
                                             </svg>
                                           </div>
                                           <div class="star-2">
                                             <svg
                                               version="1.1"
                                               id="Layer_1"
                                               xmlns="http://www.w3.org/2000/svg"
                                               xmlns:xlink="http://www.w3.org/1999/xlink"
                                               x="0px"
                                               y="0px"
                                               viewBox="0 0 100 100"
                                               style="enable-background:new 0 0 100 100;"
                                               xml:space="preserve"
                                             >
                                               <path
                                                 class="st2"
                                                 d="M54.7,6.1l9.6,24.6c0.7,1.8,2.4,3,4.4,3.1l26.7,1.4c4.6,0.2,6.4,6,2.8,8.8L77.5,60.4c-1.6,1.2-2.2,3.3-1.7,5.2
                                             l6.9,25.3c1.2,4.4-3.6,7.9-7.4,5.5L52.6,81.9c-1.6-1-3.7-1-5.3,0L24.7,96.3c-3.8,2.4-8.6-1.1-7.4-5.5l6.9-25.2
                                             c0.5-1.9-0.1-3.9-1.7-5.2L1.9,44c-3.6-2.8-1.7-8.6,2.8-8.8l26.7-1.3c1.9-0.1,3.7-1.3,4.4-3.1l9.7-24.6C47.1,1.9,53,1.9,54.7,6.1z"
                                               ></path>
                                             </svg>
                                           </div>
                                           <div class="star-3">
                                             <svg
                                               version="1.1"
                                               id="Layer_1"
                                               xmlns="http://www.w3.org/2000/svg"
                                               xmlns:xlink="http://www.w3.org/1999/xlink"
                                               x="0px"
                                               y="0px"
                                               viewBox="0 0 100 100"
                                               style="enable-background:new 0 0 100 100;"
                                               xml:space="preserve"
                                             >
                                               <path
                                                 class="st1"
                                                 d="M54.7,6.1l9.6,24.6c0.7,1.8,2.4,3,4.4,3.1l26.7,1.4c4.6,0.2,6.4,6,2.8,8.8L77.5,60.4c-1.6,1.2-2.2,3.3-1.7,5.2
                                             l6.9,25.3c1.2,4.4-3.6,7.9-7.4,5.5L52.6,81.9c-1.6-1-3.7-1-5.3,0L24.7,96.3c-3.8,2.4-8.6-1.1-7.4-5.5l6.9-25.2
                                             c0.5-1.9-0.1-3.9-1.7-5.2L1.9,44c-3.6-2.8-1.7-8.6,2.8-8.8l26.7-1.3c1.9-0.1,3.7-1.3,4.4-3.1l9.7-24.6C47.1,1.9,53,1.9,54.7,6.1z"
                                               ></path>
                                             </svg>
                                           </div>
                                           <div class="star-4">
                                             <svg
                                               version="1.1"
                                               id="Layer_1"
                                               xmlns="http://www.w3.org/2000/svg"
                                               xmlns:xlink="http://www.w3.org/1999/xlink"
                                               x="0px"
                                               y="0px"
                                               viewBox="0 0 100 100"
                                               style="enable-background:new 0 0 100 100;"
                                               xml:space="preserve"
                                             >
                                               <path
                                                 class="st1"
                                                 d="M54.7,6.1l9.6,24.6c0.7,1.8,2.4,3,4.4,3.1l26.7,1.4c4.6,0.2,6.4,6,2.8,8.8L77.5,60.4c-1.6,1.2-2.2,3.3-1.7,5.2
                                             l6.9,25.3c1.2,4.4-3.6,7.9-7.4,5.5L52.6,81.9c-1.6-1-3.7-1-5.3,0L24.7,96.3c-3.8,2.4-8.6-1.1-7.4-5.5l6.9-25.2
                                             c0.5-1.9-0.1-3.9-1.7-5.2L1.9,44c-3.6-2.8-1.7-8.6,2.8-8.8l26.7-1.3c1.9-0.1,3.7-1.3,4.4-3.1l9.7-24.6C47.1,1.9,53,1.9,54.7,6.1z"
                                               ></path>
                                             </svg>
                                           </div>
                                           <div class="star-5">
                                             <svg
                                               version="1.1"
                                               id="Layer_1"
                                               xmlns="http://www.w3.org/2000/svg"
                                               xmlns:xlink="http://www.w3.org/1999/xlink"
                                               x="0px"
                                               y="0px"
                                               viewBox="0 0 100 100"
                                               style="enable-background:new 0 0 100 100;"
                                               xml:space="preserve"
                                             >
                                               <path
                                                 class="st2"
                                                 d="M54.7,6.1l9.6,24.6c0.7,1.8,2.4,3,4.4,3.1l26.7,1.4c4.6,0.2,6.4,6,2.8,8.8L77.5,60.4c-1.6,1.2-2.2,3.3-1.7,5.2
                                             l6.9,25.3c1.2,4.4-3.6,7.9-7.4,5.5L52.6,81.9c-1.6-1-3.7-1-5.3,0L24.7,96.3c-3.8,2.4-8.6-1.1-7.4-5.5l6.9-25.2
                                             c0.5-1.9-0.1-3.9-1.7-5.2L1.9,44c-3.6-2.8-1.7-8.6,2.8-8.8l26.7-1.3c1.9-0.1,3.7-1.3,4.4-3.1l9.7-24.6C47.1,1.9,53,1.9,54.7,6.1z"
                                               ></path>
                                             </svg>
                                           </div>
                                           <div class="star-6">
                                             <svg
                                               version="1.1"
                                               id="Layer_1"
                                               xmlns="http://www.w3.org/2000/svg"
                                               xmlns:xlink="http://www.w3.org/1999/xlink"
                                               x="0px"
                                               y="0px"
                                               viewBox="0 0 100 100"
                                               style="enable-background:new 0 0 100 100;"
                                               xml:space="preserve"
                                             >
                                               <path
                                                 class="st1"
                                                 d="M54.7,6.1l9.6,24.6c0.7,1.8,2.4,3,4.4,3.1l26.7,1.4c4.6,0.2,6.4,6,2.8,8.8L77.5,60.4c-1.6,1.2-2.2,3.3-1.7,5.2
                                             l6.9,25.3c1.2,4.4-3.6,7.9-7.4,5.5L52.6,81.9c-1.6-1-3.7-1-5.3,0L24.7,96.3c-3.8,2.4-8.6-1.1-7.4-5.5l6.9-25.2
                                             c0.5-1.9-0.1-3.9-1.7-5.2L1.9,44c-3.6-2.8-1.7-8.6,2.8-8.8l26.7-1.3c1.9-0.1,3.7-1.3,4.4-3.1l9.7-24.6C47.1,1.9,53,1.9,54.7,6.1z"
                                               ></path>
                                             </svg>
                                           </div>
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
                                    <c:forEach items="${technicianComplaints}" var="complaint">
                                        <tr data-status="${complaint.status}">
                                            <td>#${complaint.id}</td>
                                            <td class="description-cell">
                                                ${complaint.title}
                                                <a href="${pageContext.request.contextPath}/technician/complaint/detail/${complaint.id}" 
                                                   class="detail-link ms-2">
                                                    <i class="bi bi-info-circle-fill"></i>
                                                </a>
                                            </td>
                                            
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/technician/chat/${complaint.id}'">
                                                    <i class="bi bi-chat-dots me-1"></i>Chat
                                                </button>
                                                <button class="btn btn-sm btn-outline-success action-btn"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/technician/resolve/${complaint.id}'">
                                                    <i class="bi bi-check-circle me-1"></i> Mark as Done
                                                </button>
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
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${resolvedTechnicianComplaints}" var="complaint">
                                        <tr data-status="${complaint.status}">
                                            <td>#${complaint.id}</td>
                                            <td class="description-cell">
                                                ${complaint.title}
                                                <a href="${pageContext.request.contextPath}/technician/complaint/detail/${complaint.id}" class="detail-link ms-2">
                                                    <i class="bi bi-info-circle-fill"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <span class="badge status-badge badge-resolved">RESOLVED</span>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-info action-btn ${empty complaint.feedbackContent ? 'disabled' : ''}"
                                                        onclick="window.location.href='${pageContext.request.contextPath}/technician/feedback-details/${complaint.id}'"
                                                        ${empty complaint.feedbackContent ? 'disabled' : ''}
                                                        title="${empty complaint.feedbackContent ? 'No feedback available yet' : 'View feedback details'}">
                                                     <i class="bi bi-eye me-1"></i>View Feedback
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


