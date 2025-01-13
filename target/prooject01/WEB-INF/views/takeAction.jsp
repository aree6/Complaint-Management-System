<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Take Action - UTM DCS</title>
    <link rel="preconnect" href="https://rsms.me/">
    <link rel="stylesheet" href="https://rsms.me/inter/inter.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Inter', sans-serif;
        }

        .action-card {
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
            box-shadow: 20px 20px 60px #bebebe, -20px -20px 60px #ffffff;
            margin: 2rem 0;
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
            outline: 2px solid white;
        }

        .blob {
            position: absolute;
            z-index: 1;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background-color: #007bff;
            opacity: 1;
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

        .detail-row {
            margin: 1rem 0;
            padding: 1.5rem;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.5);
            transition: all 0.3s ease;
        }

        .detail-row:hover {
            background: rgba(255, 255, 255, 0.8);
            transform: translateY(-2px);
        }

        .detail-label {
            font-weight: 600;
            color: #555;
            margin-bottom: 1rem;
        }

        .form-select {
            border-radius: 8px;
            padding: 0.8rem;
            border: 2px solid #e0e0e0;
            transition: all 0.3s ease;
        }

        .form-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn-action {
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .back-btn {
            background: white;
            width: 200px;
            height: 56px;
            border-radius: 16px;
            position: relative;
            font-weight: 600;
            font-size: 18px;
            border: none;
            cursor: pointer;
            overflow: hidden;
        }

        .back-btn-slider {
            background: #a32336;
            height: 48px;
            width: 25%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            left: 4px;
            top: 4px;
            border-radius: 12px;
            transition: width 0.5s;
            z-index: 1;
        }

        .back-btn:hover .back-btn-slider {
            width: calc(100% - 8px);
        }

        .back-btn-text {
            position: relative;
            z-index: 2;
            transition: color 0.3s;
        }

        .back-btn:hover .back-btn-text {
            color: #a32336;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="action-card">
            <div class="bg"></div>
            <div class="blob"></div>
            <div class="content">
                <div class="detail-row">
                    <h3 class="mb-4">
                        <i class="bi bi-tools me-2"></i>
                        Assign Technician to Complaint #${complaint.id}
                    </h3>
                    <div class="mb-3">
                        <h5 class="detail-label">
                            <i class="bi bi-info-circle me-2"></i>Complaint Details
                        </h5>
                        <p class="mb-2"><strong>Title:</strong> ${complaint.title}</p>
                        <p class="mb-2"><strong>Description:</strong> ${complaint.description}</p>
                        <p class="mb-0"><strong>Status:</strong> ${complaint.status}</p>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/admin/assignTechnician" method="post">
                    <input type="hidden" name="complaintId" value="${complaint.id}">
                    
                    <div class="detail-row">
                        <div class="form-group">
                            <h5 class="detail-label">
                                <i class="bi bi-person-check me-2"></i>Select Technician
                            </h5>
                            <select id="technicianSelect" name="technicianId" class="form-select" required>
                                <option value="">Choose a technician...</option>
                                <c:forEach items="${availableTechnicians}" var="tech">
                                    <option value="${tech.id}" ${tech.isBusy() ? 'disabled' : ''}>
                                        ${tech.name} ${tech.isBusy() ? '(🔴 BUSY)' : '(🟢 AVAILABLE)'}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="action-buttons">
                        
                        <button type="button" class="btn btn-action btn-outline-danger"
                            onclick="window.location.href='${pageContext.request.contextPath}/admin/dashboard'">
                            <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
                        </button>

                        <button type="submit" class="btn btn-action btn-outline-success">
                            <i class="bi bi-check-circle me-2"></i>Assign Technician
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
