<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>UTM-DCS | Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin-top: 100px;
        }
        .brand-logo {
            width: 120px;
            margin-bottom: 20px;
        }
        .floating-icon {
            position: absolute;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: all 0.3s ease;
            opacity: 0.6;
            animation: float 6s ease-in-out infinite;
            color: #0d6efd;
            font-size: 2.5rem;
            cursor: pointer;
        }

        .icon-text {
            display: block;
            font-size: 0.8rem;
            margin-top: 8px;
            color: #0d6efd;
            opacity: 0.8;
            transition: all 0.3s ease;
        }

        .icon-1 { top: 20%; left: 10%; animation-delay: 0.5s; }
        .icon-2 { top: 30%; right: 15%; animation-delay: 0.5s; }
        .icon-3 { bottom: 20%; left: 16%; animation-delay: 0.5s; }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }

        .floating-icon:hover {
            transform: scale(1.1);
            background: rgba(255, 255, 255, 0.2);
            opacity: 1;
        }

        .floating-icon:hover .icon-text {
            opacity: 1;
            transform: scale(1.1);
        }

        [data-tooltip]:hover:after {
            content: attr(data-tooltip);
            position: absolute;
            background: rgba(0,0,0,0.8);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.8rem;
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <!-- Floating Icons with Labels -->
    <div class="floating-icon icon-1" onclick="fillCredentials('student1', 'student123')">
        <i class="fas fa-user-graduate"></i>
        <span class="icon-text">username: student1</span>
        <span class="icon-text">password: student123</span>
        <span class="icon-text">Quickfill</span>
    </div>
    
    <div class="floating-icon icon-2" onclick="fillCredentials('admin1', 'admin123')">
        <i class="fas fa-user-shield"></i>
        <span class="icon-text">username: admin1</span>
        <span class="icon-text">password: admin123</span>
        <span class="icon-text">Quickfill</span>
    </div>
    
    <div class="floating-icon icon-3" onclick="fillCredentials('technician1', 'tech123')">
        <i class="fas fa-user-cog"></i>
        <span class="icon-text">username: technician1</span>
        <span class="icon-text">password: technician123</span>
        <span class="icon-text">Quickfill</span>
    </div>

    <div class="container">
        <div class="login-container mx-auto">
            <div class="text-center mb-4">
                <h2 class="text-primary">UTM DCS</h2>
                <p class="text-muted">Damage Control System</p>
            </div>
            
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <% if(request.getParameter("error") != null) { %>
                        <div class="alert alert-danger" role="alert">
                            Invalid username or password
                        </div>
                    <% } %>
                    
                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" id="username" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" id="password" class="form-control" required>
                        </div>
                        
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>
                </div>
            </div>
            
            <div class="text-center mt-3">
                <small class="text-muted">&copy; 2024 UTM DCS. All rights reserved.</small>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function fillCredentials(username, password) {
        document.getElementById('username').value = username;
        document.getElementById('password').value = password;
    }
    </script>
</body>
</html>