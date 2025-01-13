<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>UTM-DCS | Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <style>
        :root {
            --background: #0F0817;
            --text-primary: #ffffff;
            --purple-bright: #B347FF;
            --purple-light: #E4CCFF;
            --purple-dark: #2D1645;
        }

        body {
            background: radial-gradient(circle at top right, #2D1645, #0F0817);
            color: var(--text-primary);
            min-height: 100vh;
        }

        .login-container {
            max-width: 400px;
            margin-top: 100px;
        }

        .card {
            background: rgba(45, 22, 69, 0.4);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(179, 71, 255, 0.1);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        h2.text-primary {
            background: linear-gradient(to right, #B347FF, #E4CCFF);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2.5rem;
        }

        .text-muted {
            color: var(--purple-light) !important;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(179, 71, 255, 0.2);
            color: var(--text-primary);
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: var(--purple-bright);
            color: var(--text-primary);
            box-shadow: 0 0 0 0.25rem rgba(179, 71, 255, 0.25);
        }

        .form-label {
            color: var(--purple-light);
        }

        .btn-primary {
            background: var(--purple-bright);
            border: none;
            padding: 0.75rem 1.5rem;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: #9935FF;
            transform: translateY(-2px);
        }

        .floating-icon {
            background: rgba(45, 22, 69, 0.4);
            border: 1px solid rgba(179, 71, 255, 0.2);
            color: var(--purple-bright);
        }

        .floating-icon:hover {
            background: rgba(45, 22, 69, 0.6);
            border-color: var(--purple-bright);
        }

        .icon-text {
            color: var(--purple-light);
        }

        .alert-danger {
            background: rgba(220, 53, 69, 0.1);
            border: 1px solid rgba(220, 53, 69, 0.2);
            color: #ff6b6b;
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
            color: linear-gradient(to right, #B347FF, #E4CCFF);
            font-size: 2.5rem;
            cursor: pointer;
        }

        .icon-text {
            display: block;
            font-size: 0.8rem;
            margin-top: 8px;
            color: #5c8ed9;
            opacity: 0.8;
            transition: all 0.3s ease;
        }

        .icon-1 { top: 20%; left: 10%; animation-delay: 0s; }
        .icon-2 { top: 30%; right: 15%; animation-delay: 0s; width: 175px}
        .icon-3 { bottom: 20%; left: 16%; animation-delay: 0s; }

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
















        /* From Uiverse.io by Matilemak */ 
    .animated-button {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center; /* Center the button content */
        gap: 4px;
        padding: 16px 36px;
        border: 3px solid;
        border-color: transparent;
        font-size: 16px;
        background-color: var(--purple-bright);
        border-radius: 50px;
        font-weight: 600;
        color: var(--text-primary);
        box-shadow: 0 0 0 2px var(--purple-bright);
        cursor: pointer;
        overflow: hidden;
        transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        margin: 0 auto; /* Center the button itself */
    }

    .animated-button svg {
      position: absolute;
      width: 24px;
      fill: #1e1e1e;
      z-index: 9;
      transition: all 0.8s cubic-bezier(0.23, 1, 0.32, 1);
    }

    .animated-button .arr-1 {
      right: 16px;
    }

    .animated-button .arr-2 {
      left: -25%;
    }

    .animated-button .circle {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 20px;
      height: 20px;
      background-color: var(--purple-light);
      border-radius: 50%;
      opacity: 0;
      transition: all 0.8s cubic-bezier(0.23, 1, 0.32, 1);
    }

    .animated-button .text {
      position: relative;
      z-index: 1;
      transform: translateX(-12px);
      transition: all 0.8s cubic-bezier(0.23, 1, 0.32, 1);
    }

    .animated-button:hover {
      box-shadow: 0 0 0 12px transparent;
      color: var(--purple-dark);
      border-radius: 12px;
    }

    .animated-button:hover .arr-1 {
      right: -25%;
    }

    .animated-button:hover .arr-2 {
      left: 16px;
    }

    .animated-button:hover .text {
      transform: translateX(12px);
    }

    .animated-button:hover svg {
      fill: var(--purple-dark);
    }

    .animated-button:active {
      scale: 0.95;
      box-shadow: 0 0 0 4px var(--purple-light);
      
    }

    .animated-button:hover .circle {
      width: 220px;
      height: 220px;
      opacity: 1;
    }

    .heading-text {
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    font-family: "Permanent Marker", serif;
    background: linear-gradient(to right, #B347FF, #E4CCFF, #ec0606);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    padding: 1rem;
    
    z-index: 1001;
    white-space: nowrap;
    font-size: 3.0rem;
    line-height: 1.1;
    letter-spacing: 6px;
} 

.magic {
            /* Core text styling */
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-family: "Permanent Marker", serif;
            padding: 1rem;
    
            z-index: 1001;
            white-space: nowrap;
            font-size: 3.0rem;
            line-height: 1.1;
    letter-spacing: 6px;
            /* Make background show through text */
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;

            /* Gradient with matching start/end colors for seamless loop */
            background-image: linear-gradient(
                74deg,
                #4285f4 0%,
                #9b72cb 16.66%,
                #d96570 33.33%,
                #4285f4 50%,
                #9b72cb 66.66%,
                #d96570 83.33%,
                #4285f4 100%
            );
            background-size: 200% 100%;

            /* Center the text */
            display: inline-block;
            text-align: center;

            /* Animation properties */
            animation: gradient 4s cubic-bezier(0.45, 0.05, 0.55, 0.95) infinite;
            -webkit-animation: gradient 4s cubic-bezier(0.45, 0.05, 0.55, 0.95) infinite;
        }

        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            100% {
                background-position: -200% 50%;
            }
        }

        @-webkit-keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            100% {
                background-position: -200% 50%;
            }
        }







    </style>
</head>
<body>
    <!-- Floating Icons with Labels -->
    <div class="floating-icon icon-1" onclick="fillCredentials('Student1', '123')">
        <i class="fas fa-user-graduate"></i>
        <span class="icon-text">username: Student1</span>
        <span class="icon-text">password: 123</span>
        <span class="icon-text">Quickfill</span>
    </div>
    
    <div class="floating-icon icon-2" onclick="fillCredentials('Admin', '123')">
        <i class="fas fa-user-shield"></i>
        <span class="icon-text">username: Admin</span>
        <span class="icon-text">password: 123</span>
        <span class="icon-text">Quickfill</span>
    </div>
    
    <div class="floating-icon icon-3" onclick="fillCredentials('Technician1', '123')">
        <i class="fas fa-user-cog"></i>
        <span class="icon-text">username: Technician1</span>
        <span class="icon-text">password: 123</span>
        <span class="icon-text">Quickfill</span>
    </div>

    <div class="container p-5">
        <div class="login-container mx-auto ">
            <!-- <div class="text-center mb-4">
                <h2 class="text-primary">UTM Complaint Management System</h2>
            </div> -->
            
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
                        
                        <!-- <button type="submit" class="btn btn-primary w-100">Login</button> -->
                        <button class="animated-button">
                        <svg xmlns="http://www.w3.org/2000/svg" class="arr-2" viewBox="0 0 24 24">
                            <path
                            d="M16.1716 10.9999L10.8076 5.63589L12.2218 4.22168L20 11.9999L12.2218 19.778L10.8076 18.3638L16.1716 12.9999H4V10.9999H16.1716Z"
                            ></path>
                        </svg>
                        <span class="text">Login</span>
                        <span class="circle"></span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="arr-1" viewBox="0 0 24 24">
                            <path
                            d="M16.1716 10.9999L10.8076 5.63589L12.2218 4.22168L20 11.9999L12.2218 19.778L10.8076 18.3638L16.1716 12.9999H4V10.9999H16.1716Z"
                            ></path>
                        </svg>
                        </button>

                    </form>
                </div>
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
    <h1 class="magic">
        UTM COMPLAINT MANAGEMENT SYSTEM
    </h1>
</body>
</html>