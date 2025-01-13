<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="""en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
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

        /* General Styles */
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

        .navbar-brand {
            font-weight: 600;
            font-size: 1.25rem;
            color: #2c3e50 !important;
        }

        .nav-link {
            position: relative;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
            color: #2c3e50 !important;
        }

        .nav-link:hover {
            color: #4e73df !important;
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

        .nav-link.active {
            color: #4e73df !important;
            font-weight: 600;
        }

        /* Quick Actions Card */
        .quick-actions-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.7);
            margin-bottom: 2rem;
            background: rgba(255, 255, 255, 0.2) !important;
            backdrop-filter: blur(5px);
        }

        .quick-actions-card .card-body {
            padding: 1.75rem;
        }

        .quick-actions-card .btn {
            border-radius: 0.5rem;
            padding: 0.5rem 1.25rem;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .quick-actions-card .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
            /* margin-top: 2rem; */
            margin-bottom: 2rem;
            background: rgba(255, 255, 255, 0.2) !important;
            backdrop-filter: blur(5px);
        }

        .custom-tabs {
            padding: 0.5rem 1rem 0;
            border-bottom: none;
            background: rgba(255, 255, 255, 0.2) !important;
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
            backdrop-filter: blur(5px);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            padding: 1rem;
            border-bottom: 2px solid #e3e6f0;
            background: rgba(255, 255, 255, 0.4) !important;
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
            background: rgba(255, 255, 255, 0.2) !important;
        }

        .table tbody tr {
            transition: all 0.2s ease;
            background: rgba(255, 255, 255, 0.2) !important;
        }

        .table tbody tr:hover {
            background-color: rgba(78,115,223,0.05);
            background: rgba(255, 255, 255, 0.2) !important;
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
            background-color: rgba(248, 249, 252, 0.3);
        }

        .table tbody tr:nth-of-type(even) {
            background-color: rgba(255, 255, 255, 0.3);
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

        .description-cell {
            max-width: 300px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .detail-link {
            color: #4e73df;
            text-decoration: none;
            opacity: 0.7;
            transition: opacity 0.2s ease;
        }

        .detail-link:hover {
            opacity: 1;
        }

        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: rgba(78, 115, 223, 0.02);
        }




        .btn-donate {
  --clr-font-main: hsla(0 0% 20% / 100);
  --btn-bg-1: hsla(194 100% 69% / 1);
  --btn-bg-2: hsla(217 100% 56% / 1);
  --btn-bg-color: hsla(360 100% 100% / 1);
  --radii: 0.5em;
  cursor: pointer;
  padding: 0.9em 1.4em;
  min-width: 120px;
  min-height: 44px;
  font-size: var(--size, 1rem);
  font-weight: 500;
  transition: 0.8s;
  background-size: 280% auto;
  background-image: linear-gradient(
    325deg,
    var(--btn-bg-2) 0%,
    var(--btn-bg-1) 55%,
    var(--btn-bg-2) 90%
  );
  border: none;
  border-radius: var(--radii);
  color: var(--btn-bg-color);
  box-shadow:
    0px 0px 20px rgba(71, 184, 255, 0.5),
    0px 5px 5px -1px rgba(58, 125, 233, 0.25),
    inset 4px 4px 8px rgba(175, 230, 255, 0.5),
    inset -4px -4px 8px rgba(19, 95, 216, 0.35);
}

.btn-donate:hover {
  background-position: right top;
}

.btn-donate:is(:focus, :focus-visible, :active) {
  outline: none;
  box-shadow:
    0 0 0 3px var(--btn-bg-color),
    0 0 0 6px var(--btn-bg-2);
}

@media (prefers-reduced-motion: reduce) {
  .btn-donate {
    transition: linear;
  }
}




.continue-application {
    --color: #333;
    --background: transparent;
    --background-hover: rgba(255, 182, 193, 0.2); /* Light pink hover background */

    --background-left: rgba(255, 182, 193, 0.5); /* Light pink background */

    --folder: rgba(255, 240, 245, 0.8); /* Light pinkish white */

    --folder-inner: rgba(255, 228, 225, 0.8); /* Light pastel pink */

    --paper: #FFFFFF;

    --paper-lines: rgba(255, 182, 193, 0.8); /* Light pink lines */

    --paper-behind: rgba(255, 240, 245, 0.8); /* Light pinkish white */
    --pencil-cap: #fff;
    --pencil-top: rgba(255, 182, 193, 0.8); /* Light pink */
    --pencil-middle: #fff;
    --pencil-bottom: rgba(255, 105, 180, 0.8); /* Hot pink */
    --shadow: rgba(255, 182, 193, 0.2); /* Light pink shadow */
    border: none;
    outline: none;
    cursor: pointer;
    position: relative;
    border-radius: 20px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 350;
    line-height: 10px;
    -webkit-appearance: none;
    -webkit-tap-highlight-color: transparent;
    padding: 17px 29px 17px 69px;

    transition: background 0.3s;
    color: var(--color);
    background: var(--bg, var(--background));
}

.continue-application > div {
  top: 0;
  left: 0;
  bottom: 0;
  /* width: 53px; */
  width: 45px;
  position: absolute;
  overflow: hidden;
  border-radius: 5px 0 0 5px;
  background: var(--background-left);
}

.continue-application > div .folder {
  width: 23px;
  height: 27px;
  position: absolute;
  left: 15px;
  top: 13px;
}

.continue-application > div .folder .top {
  left: 0;
  top: 0;
  z-index: 2;
  position: absolute;
  transform: translateX(var(--fx, 0));
  transition: transform 0.4s ease var(--fd, 0.3s);
}

.continue-application > div .folder .top svg {
  width: 24px;
  height: 27px;
  display: block;
  fill: var(--folder);
  transform-origin: 0 50%;
  transition: transform 0.3s ease var(--fds, 0.45s);
  transform: perspective(120px) rotateY(var(--fr, 0deg));
}

.continue-application > div .folder:before, .continue-application > div .folder:after,
.continue-application > div .folder .paper {
  content: "";
  position: absolute;
  left: var(--l, 0);
  top: var(--t, 0);
  width: var(--w, 100%);
  height: var(--h, 100%);
  border-radius: 1px;
  background: var(--b, var(--folder-inner));
}

.continue-application > div .folder:before {
  box-shadow: 0 1.5px 3px var(--shadow), 0 2.5px 5px var(--shadow), 0 3.5px 7px var(--shadow);
  transform: translateX(var(--fx, 0));
  transition: transform 0.4s ease var(--fd, 0.3s);
}

.continue-application > div .folder:after,
.continue-application > div .folder .paper {
  --l: 1px;
  --t: 1px;
  --w: 21px;
  --h: 25px;
  --b: var(--paper-behind);
}

.continue-application > div .folder:after {
  transform: translate(var(--pbx, 0), var(--pby, 0));
  transition: transform 0.4s ease var(--pbd, 0s);
}

.continue-application > div .folder .paper {
  z-index: 1;
  --b: var(--paper);
}

.continue-application > div .folder .paper:before, .continue-application > div .folder .paper:after {
  content: "";
  width: var(--wp, 14px);
  height: 2px;
  border-radius: 1px;
  transform: scaleY(0.5);
  left: 3px;
  top: var(--tp, 3px);
  position: absolute;
  background: var(--paper-lines);
  box-shadow: 0 12px 0 0 var(--paper-lines), 0 24px 0 0 var(--paper-lines);
}

.continue-application > div .folder .paper:after {
  --tp: 6px;
  --wp: 10px;
}

.continue-application > div .pencil {
  height: 2px;
  width: 3px;
  border-radius: 1px 1px 0 0;
  top: 8px;
  left: 105%;
  position: absolute;
  z-index: 3;
  transform-origin: 50% 19px;
  background: var(--pencil-cap);
  transform: translateX(var(--pex, 0)) rotate(35deg);
  transition: transform 0.4s ease var(--pbd, 0s);
}

.continue-application > div .pencil:before, .continue-application > div .pencil:after {
  content: "";
  position: absolute;
  display: block;
  background: var(--b, linear-gradient(var(--pencil-top) 55%, var(--pencil-middle) 55.1%, var(--pencil-middle) 60%, var(--pencil-bottom) 60.1%));
  width: var(--w, 5px);
  height: var(--h, 20px);
  border-radius: var(--br, 2px 2px 0 0);
  top: var(--t, 2px);
  left: var(--l, -1px);
}

.continue-application > div .pencil:before {
  -webkit-clip-path: polygon(0 5%, 5px 5%, 5px 17px, 50% 20px, 0 17px);
  clip-path: polygon(0 5%, 5px 5%, 5px 17px, 50% 20px, 0 17px);
}

.continue-application > div .pencil:after {
  --b: none;
  --w: 3px;
  --h: 6px;
  --br: 0 2px 1px 0;
  --t: 3px;
  --l: 3px;
  border-top: 1px solid var(--pencil-top);
  border-right: 1px solid var(--pencil-top);
}

.continue-application:before, .continue-application:after {
  content: "";
  position: absolute;
  width: 10px;
  height: 2px;
  border-radius: 1px;
  background: var(--color);
  transform-origin: 9px 1px;
  transform: translateX(var(--cx, 0)) scale(0.5) rotate(var(--r, -45deg));
  top: 26px;
  right: 16px;
  transition: transform 0.3s;
}

.continue-application:after {
  --r: 45deg;
}

.continue-application:hover {
  --cx: 2px;
  --bg: var(--background-hover);
  --fx: -40px;
  --fr: -60deg;
  --fd: .15s;
  --fds: 0s;
  --pbx: 3px;
  --pby: -3px;
  --pbd: .15s;
  --pex: -24px;
}

/* From Uiverse.io by mRcOol7 */ 
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


button[disabled] {
    text-decoration: line-through;
}

/* Add disabled button styles */
.btn-chat.disabled {
    background: #e2e8f0 !important;
    color: #94a3b8 !important;
    cursor: not-allowed;
    opacity: 0.7;
    pointer-events: none;
    text-decoration: line-through;
}

    .btn-chat {
        background: #536bb3;
        color: white;
        border: none;
        padding: 0.375rem 0.75rem;
        font-size: 0.875rem;
        line-height: 1.5;
        border-radius: 0.2rem;
        transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .btn-chat:hover {
        background: #2e59d9;
        color: white;
    }

    .btn-chat.disabled {
        background: #e2e8f0;
        color: #94a3b8;
        cursor: not-allowed;
        opacity: 0.7;
        pointer-events: none;
    }
</style>
</head>
<body class="bg-light">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="bi bi-mortarboard-fill me-2"></i>Student Portal
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/student/dashboard">
                            <i class="bi bi-speedometer2 me-1"></i>Dashboard
                        </a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link position-relative" href="${pageContext.request.contextPath}/student/notification">
                            <i class="bi bi-bell me-1"></i>Notifications
                            <span class="position-absolute top-0 start-100 translate-middle badge ">
                                
                                <span class="visually-hidden">unread notifications</span>
                            </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/student/feedback-list">
                            <i class="bi bi-chat-dots me-1"></i>Feedback History
                        </a>
                    </li> -->
                </ul>
                <div class="d-flex align-items-center">
                   
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

        <!-- Quick Actions -->
        <div class="row  fade-in">
            <div class="col-12">
                <div class="quick-actions-card card shadow-sm">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Quick Actions</h4>
                        <div>
                            <button class="btn-donate me-2" 
                                onclick="window.location.href='${pageContext.request.contextPath}/student/complaint-form'">
                                <i class="bi bi-plus-circle me-1"></i>New Complaint
                            </button>
                            <!-- <button class="btn btn-outline-primary" onclick="window.location.href='${pageContext.request.contextPath}/student/feedback-form'">
                                <i class="bi bi-chat-right-text me-1"></i>Add Feedback
                            </button> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Feedback Status Alerts -->
        <c:if test="${param.error eq 'feedbackExists'}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle"></i> Feedback has already been submitted for this complaint.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${param.success eq 'feedbackSubmitted'}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle"></i> Thank you! Your feedback has been submitted successfully.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>


        <div class="container py-4 ">  <!-- Changed from container-container -->
            <!-- Statistics Cards -->
            <div class="row g-4 mb-0 px-3">  <!-- Added px-3 for horizontal padding -->
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
        

        <!-- Complaints Tables -->
        <div class="custom-table-card card mx-3">
            <div class="card-header bg-white border-bottom-0" style="background: rgba(255, 255, 255, 0.2) !important;">
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
                                            <td>#${complaint.id}</td>
                                            <td class="description-cell">
                                                ${complaint.title}
                                                <a href="${pageContext.request.contextPath}/student/complaint-details/${complaint.id}" class="detail-link ms-2">
                                                    <i class="bi bi-info-circle-fill"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <span class="badge status-badge ${complaint.status eq 'PENDING' ? 'badge-pending' : 
                                                                            complaint.status eq 'RESOLVED' ? 'badge-resolved' : 
                                                                            'badge-assigned'}">${complaint.status}</span>
                                            </td>
                                            <td>
                                                <div class="btn-group">
                                                    <button class="btn btn-chat ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}"
                                                            onclick="window.location.href='${pageContext.request.contextPath}/student/chat/${complaint.id}'"
                                                            ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}>
                                                        <i class="fas fa-comments"></i> Chat
                                                    </button>
                                                    <button class="btn btn-sm btn-outline-danger action-btn ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}"
                                                            onclick="window.location.href='${pageContext.request.contextPath}/student/deleteComplaint/${complaint.id}'"
                                                            ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}>
                                                        <i class="bi bi-trash me-1"></i> Delete
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Similar updates for resolved and pending tabs -->
                    <div class="tab-pane fade" id="resolved">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${resolvedComplaints}" var="complaint">
                                        <tr>
                                            <td>#${complaint.id}</td>
                                            <td>${complaint.title}</td>
                                            <td>
                                                <!-- <button class="btn btn-sm btn-outline-primary action-btn"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/student/feedback-form/${complaint.id}'">
                                                    <i class="bi bi-chat-right-text me-1"></i>Write Feedback
                                                </button> -->
                                                <a href="${pageContext.request.contextPath}/student/feedback-form/${complaint.id}" class="continue-application">
                                                    <div>
                                                        <div class="pencil"></div>
                                                        <div class="folder">
                                                            <div class="top">
                                                                <svg viewBox="0 0 24 27">
                                                                    <path d="M1,0 L23,0 C23.5522847,-1.01453063e-16 24,0.44771525 24,1 L24,8.17157288 C24,8.70200585 23.7892863,9.21071368</svg> 23.4142136,9.58578644 L20.5857864,12.4142136 C20.2107137,12.7892863 20,13.2979941 20,13.8284271 L20,26 C20,26.5522847 19.5522847,27 19,27 L1,27 C0.44771525,27 6.76353751e-17,26.5522847 0,26 L0,1 C-6.76353751e-17,0.44771525 0.44771525,1.01453063e-16 1,0 Z"></path>
                                                                </svg>
                                                            </div>
                                                            <div class="paper"></div>
                                                        </div>
                                                    </div>
                                                    Give Feedback
                                                </a>
                                                
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
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pendingComplaints}" var="complaint">
                                        <tr>
                                            <td>#${complaint.id}</td>
                                            <td>${complaint.title}</td>
                                            <td>
                                                <div class="btn-group">
                                                    <a href="${pageContext.request.contextPath}/student/chat/${complaint.id}"
                                                       class="btn btn-chat ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}"
                                                       ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}>
                                                        <i class="fas fa-comments"></i> Chat
                                                    </a>
                                                    <button class="btn btn-sm btn-outline-danger action-btn"
                                                        onclick="window.location.href='${pageContext.request.contextPath}/student/deleteComplaint/${complaint.id}'">
                                                        <i class="bi bi-trash me-1"></i>Delete
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
                                            <td>#${complaint.id}</td>
                                            <td class="description-cell">
                                                ${complaint.title}
                                                <a href="${pageContext.request.contextPath}/student/complaint-details/${complaint.id}" class="detail-link ms-2">
                                                    <i class="bi bi-info-circle-fill"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <span class="badge status-badge badge-assigned">${complaint.getTechnician().name}</span>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/student/chat/${complaint.id}"
                                                   class="btn btn-chat ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}"
                                                   ${complaint.status eq 'RESOLVED' ? 'disabled' : ''}>
                                                    <i class="fas fa-comments"></i> Chat
                                                </a>
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