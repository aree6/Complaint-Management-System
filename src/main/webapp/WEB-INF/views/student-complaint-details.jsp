<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Complaint Details</title>
    <link rel="preconnect" href="https://rsms.me/">
    <link rel="stylesheet" href="https://rsms.me/inter/inter.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #f0f2f5;
            background-image: 
                radial-gradient(at 91% 62%, hsla(37,86%,88%,1) 0px, transparent 50%),
                radial-gradient(at 53% 29%, hsla(349,100%,84%,1) 0px, transparent 50%),
                radial-gradient(at 11% 45%, hsla(137,82%,83%,1) 0px, transparent 50%),
                radial-gradient(at 51% 94%, hsla(178,59%,76%,1) 0px, transparent 50%);
            font-family: 'Inter', sans-serif;
            background-attachment: fixed;
        }

        .complaint-card {
            position: relative;
            width: 100%;
            min-height: 500px;
            border-radius: 14px;
            z-index: 1;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            /* box-shadow: 20px 20px 60px #bebebe, -20px -20px 60px #ffffff; */
            margin: 2rem 0;
            background: rgba(248, 249, 252, 0.2) !important;
        }

        .bg {
            position: absolute;
            top: 5px;
            left: 5px;
            width: calc(100% - 10px);
            height: calc(100% - 10px);
            z-index: 2;
            background: rgba(255, 255, 255, .95);
            backdrop-filter: blur(24px);
            border-radius: 10px;
            overflow: hidden;
            /* outline: 2px solid white; */
            background: rgba(248, 249, 252, 0.2) !important;
        }

        .blob {
            position: absolute;
            z-index: 1;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background-color: #007bff;
            opacity: 0.3;
            filter: blur(50px);
            animation: blob-bounce 10s infinite ease-in-out;
            top: -150px;
            left: -150px;
        }

        @keyframes blob-bounce {
            0% {
                transform: translate(0, 0);
            }
            25% {
                transform: translate(calc(100% - 0px), 0);
            }
            50% {
                transform: translate(calc(100% - 0px), calc(100% - 0px));
            }
            75% {
                transform: translate(0, calc(100% - 0px));
            }
            100% {
                transform: translate(0, 0);
            }
        }

        .content {
            position: relative;
            z-index: 3;
            width: 100%;
            padding: 2rem;
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 500;
        }

        .detail-row {
            margin: 1rem 0;
            padding: 1rem;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.5);
        }

        .detail-label {
            font-weight: 600;
            color: #555;
        }

        .nav-link.active {
            background-color: #007bff !important;
        }

        /* Navbar Styles */
        .custom-navbar {
            background: #f8f9fc;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
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
    </style>
</head>
<body>
  
    
    <!-- Main Content -->
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center">
            <h1>
                <i class="bi bi-file-text me-2"></i> Details
            </h1>
        </div>




        <div class="complaint-card" style="background: rgba(248, 249, 252, 0.2) !important;">
            <div class="bg"></div>
            <div class="blob"></div>
            <div class="content">
                <div class="detail-row">
                    <h3 class="mb-3">${complaint.title}</h3>
                    <span class="status-badge ${complaint.status == 'PENDING' ? 'bg-warning' : complaint.status == 'RESOLVED' ? 'bg-success' : 'bg-primary'} text-white">
                        ${complaint.status == 'PENDING' ? '⏳' : complaint.status == 'RESOLVED' ? '🎉' : '🔧'}
                        ${complaint.status}
                    </span>
                </div>

                <div class="detail-row">
                    <h5 class="detail-label">Description</h5>
                    <p class="mb-0">${complaint.description}</p>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="detail-row">
                            <h5 class="detail-label">Student Information</h5>
                            <p class="mb-1"><i class="bi bi-person me-2"></i>${complaint.student.name}</p>
                            <p class="mb-0"><i class="bi bi-card-text me-2"></i>ID: ${complaint.student.id}</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="detail-row">
                            <h5 class="detail-label">Technician Assignment</h5>
                            <p class="mb-0"><i class="bi bi-tools me-2"></i>${complaint.technician != null ? complaint.technician.name : 'Not Assigned'}</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="detail-row">
                            <h5 class="detail-label">Submission Date</h5>
                            <p class="mb-0"><i class="bi bi-calendar-event me-2"></i>${complaint.createdAt}</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="detail-row">
                            <h5 class="detail-label">Last Updated</h5>
                            <p class="mb-0"><i class="bi bi-clock-history me-2"></i>${complaint.updatedAt}</p>
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/student/dashboard" class="btn btn-outline-primary mt-3">
                    <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
                </a>
           
            </div>
        
        </div>
        
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>







