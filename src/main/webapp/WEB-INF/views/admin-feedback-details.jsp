<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Details</title>
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

        .feedback-card {
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
            0% { transform: translate(0, 0); }
            25% { transform: translate(calc(100% - 0px), 0); }
            50% { transform: translate(calc(100% - 0px), calc(100% - 0px)); }
            75% { transform: translate(0, calc(100% - 0px)); }
            100% { transform: translate(0, 0); }
        }

        .content {
            position: relative;
            z-index: 3;
            width: 100%;
            padding: 2rem;
        }

        .detail-row {
            margin: 1rem 0;
            padding: 1rem;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0);
        }

        .detail-label {
            font-weight: 500;
            color: #555;
        }

        .rating-stars {
            color: #db161c;
            font-size: 1.5rem;
            margin: 1rem 0;
        }

        .emoji-reaction {
            font-size: 3.5rem;
            margin: 1rem 0;
            text-align: center;
        }

        .custom-navbar {
            background: rgba(248, 249, 252, 0.2) !important;
            backdrop-filter: blur(10px);
        }
    </style>
</head>
<body>
   

    <!-- Main Content -->
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="mb-4"><i class="bi bi-star me-2"></i>Feedback Details</h1>
        </div>

        <div class="feedback-card">
            <div class="bg"></div>
            <div class="blob"></div>
            <div class="content">
                <div class="detail-row text-center">
                    <div class="emoji-reaction">
                        <c:choose>
                            <c:when test="${complaint.feedbackRating >= 4}">&#128516;</c:when>
                            <c:when test="${complaint.feedbackRating == 3}">&#128522;</c:when>
                            <c:when test="${complaint.feedbackRating == 2}">&#128528;</c:when>
                            <c:otherwise>&#128542;</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="rating-stars">
                        <c:forEach begin="1" end="5" var="star">
                            <i class="bi ${star <= complaint.feedbackRating ? 'bi-star-fill' : 'bi-star'} me-1"></i>
                        </c:forEach>
                    </div>
                </div>

                <!-- <div class="row">
                    <div class="col-md-6">
                        <div class="detail-row">
                            <h5 class="detail-label">Student Information</h5>
                            <p class="mb-1"><i class="bi bi-person me-2"></i>${complaint.student.name}</p>
                            <p class="mb-0"><i class="bi bi-card-text me-2"></i>ID: ${complaint.student.id}</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="detail-row">
                            <h5 class="detail-label">Complaint Information</h5>
                            <p class="mb-1"><i class="bi bi-ticket me-2"></i>${complaint.title}</p>
                            <p class="mb-0"><i class="bi bi-chat-text me-2"></i>${complaint.description}</p>
                        </div>
                    </div>
                </div> -->

                <div class="detail-row" style=" background: rgba(248, 249, 252, 0.3) !important;">
                    <h5 class="detail-label"></h5>
                    <p class="mb-0"><i class="bi bi-chat-quote me-2"></i>${complaint.feedbackContent}</p>
                </div>

                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-primary mt-3">
                    <i class="bi bi-arrow-left me-2"></i>Back to Dashboard
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>