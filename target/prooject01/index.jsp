<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>UTM-DCS | Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f0f4ff 0%, #e0f7fa 100%);
            min-height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            color: #333;
        }
        .hero-container {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }
        .hero-content {
            max-width: 800px;
            animation: fadeIn 0.3s ease-in;
        }
        .hero-title {
            font-size: 3.5rem;
            font-weight: bold;
            margin-bottom: 1rem;
            color: #212529;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }
        .hero-subtitle {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            color: #495057;
        }
        .btn-hero {
            padding: 12px 30px;
            font-size: 1.1rem;
            margin: 10px;
            transition: all 0.1s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            color: #333;
            background-color: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(200, 200, 200, 0.5);
        }
        .btn-hero:hover {
            transform: translateY(-5px);
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(100px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="hero-container">
        <div class="hero-content">
            <h1 class="hero-title">Welcome to UTM DCS</h1>
            <p class="hero-subtitle">Streamlined Damage Control System for Better Management</p>
            <div class="button-group">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-hero">Login</a>
                <a href="${pageContext.request.contextPath}/signup" class="btn btn-hero">Sign Up</a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
