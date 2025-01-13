<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Complaint</title>
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
            margin: 2rem 0;
            background: rgba(248, 249, 252, 0.1) !important;
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
            background-color: #0088ff;
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
            padding: 2rem;
        }

        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.7);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 1rem;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.9);
            box-shadow: none;
            border-color: rgba(79, 70, 229, 0.4);
        }

        .form-label {
            font-weight: 500;
            color: #444;
            margin-bottom: 0.5rem;
        }

        .btn-submit {
            background: linear-gradient(45deg, hsla(178,59%,76%,1), hsla(137,82%,83%,1));
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 10px;
            color: #2c3e50;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            background: linear-gradient(45deg, hsla(178,59%,76%,1), hsla(178,59%,76%,0.8));
        }

        .custom-navbar {
            background: rgba(248, 249, 252, 0.2) !important;
            backdrop-filter: blur(10px);
        }

        .navbar-brand, .nav-link {
            color: #2c3e50 !important;
        }

        .nav-link:hover {
            color: #4e73df !important;
        }
    </style>
</head>
<body>
   

    <div class="container ">
        <div class="complaint-card ">
            <div class="bg"></div>
            <div class="blob"></div>
            <div class="content w-100">
                <h3 class="mb-4">
                    <i class="bi bi-plus-circle me-2"></i>Submit New Complaint
                </h3>
                <form action="${pageContext.request.contextPath}/student/submitComplaint" method="POST">
                    <div class="mb-3">
                        <label for="complaintTitle" class="form-label">
                            <i class="bi bi-tag me-2"></i>Title
                        </label>
                        <input type="text" class="form-control" id="complaintTitle" name="title" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">
                            <i class="bi bi-text-paragraph me-2"></i>Description
                        </label>
                        <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                    </div>
                    <div class="mb-4">
                        <label for="priority" class="form-label">
                            <i class="bi bi-exclamation-triangle me-2"></i>Priority
                        </label>
                        <select class="form-select" id="priority" name="priority" required>
                            <option value="Low">Low</option>
                            <option value="Medium">Medium</option>
                            <option value="High">High</option>
                        </select>
                    </div>
                    <button type="submit" class=" btn-submit">
                        <i class="bi bi-send me-2"></i>Submit Complaint
                    </button>
                    </form>
                    <button class=" btn-submit mt-3" onclick="window.location.href='${pageContext.request.contextPath}/student/dashboard'">
                        <i class="bi bi-arrow-left me-2"></i> Dashboard
                    </button>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>