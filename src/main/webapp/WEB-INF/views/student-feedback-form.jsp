<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>✨ Share Your Feedback ✨</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            margin: 2rem 0;
            background: rgba(248, 249, 252, 0) !important;
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
            
        }

        .star-rating {
            direction: rtl;
            display: inline-block;
            padding: 20px;
        }
        .star-rating input[type="radio"] {
            display: none;
        }
        .star-rating label {
            color: #bbb;
            font-size: 2.5rem;
            padding: 0;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .star-rating label:hover,
        .star-rating label:hover ~ label,
        .star-rating input[type="radio"]:checked ~ label {
            color: yellow;
            transform: scale(1.2);
        }
        .feedback-card {
            /* background: #f8f9fa; */
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .feedback-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
        }
        .details-box {
            background: rgba(255, 255, 255, 0.7);
            border-radius: 15px;
            transition: all 0.3s ease;
            padding: 20px;
            border: 2px solid transparent;
        }
        .details-box:hover {
            background: rgba(255, 255, 255, 0.9);
            border-color: #e9ecef;
            transform: translateY(-3px);
        }
        .emoji-title {
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 1rem;
        }
        .custom-btn {
            transition: all 0.3s ease;
            border-radius: 12px;
            font-weight: 600;
            padding: 10px 25px;
        }
        .custom-btn:hover {
            transform: translateY(-2px);
        }
        .feedback-textarea {
            border-radius: 15px;
            padding: 15px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        .feedback-textarea:focus {
            border-color: #f9d71c;
            box-shadow: 0 0 0 0.2rem rgba(249, 215, 28, 0.25);
        }
        
        @media (max-width: 768px) {
            .border-end {
                border-right: none !important;
                border-bottom: 1px solid #dee2e6;
                margin-bottom: 1rem;
                padding-bottom: 1rem;
            }
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="feedback-card">
                    <div class="bg"></div>
                    <div class="blob"></div>
                    <div class="content">
                        <div class="emoji-title">
                            ✨ Share Your Feedback ✨
                        </div>
                        
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <div class="details-box h-100 border-end">
                                    <h5>🎫 Complaint Details</h5>
                                    <p class="mb-2">📝 <strong>Title:</strong> ${complaint.title}</p>
                                    <p class="mb-0">📊 <strong>Status:</strong> 
                                        <span class="badge bg-success">✅ RESOLVED</span>
                                    </p>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="details-box h-100">
                                    <h5>👨‍🔧 Resolved By</h5>
                                    <p class="mb-2">👤 <strong>Name:</strong> ${complaint.technician.name}</p>
                                    <p class="mb-0">🆔 <strong>ID:</strong> ${complaint.technician.id}</p>
                                </div>
                            </div>
                        </div>
                    
                        <form action="${pageContext.request.contextPath}/student/submitFeedback/${complaint.id}" method="post">
                            <input type="hidden" name="complaint.id" value="${complaint.id}">
                            
                            <div class="mb-1 text-center">
                                <label class="form-label d-block">⭐ Rate your experience ⭐</label>
                                <div class="star-rating">
                                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" class="fas fa-star"></label>
                                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" class="fas fa-star"></label>
                                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" class="fas fa-star"></label>
                                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" class="fas fa-star"></label>
                                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" class="fas fa-star"></label>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="content" class="form-label">💭 Your Feedback</label>
                                <textarea class="form-control feedback-textarea" id="content" name="feedbackContent" rows="5" 
                                        placeholder="✍️ Please share your experience with the complaint resolution..."
                                        required></textarea>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary custom-btn px-4 py-2">
                                    Submit Feedback 📨
                                </button>
                                <a href="${pageContext.request.contextPath}/student/dashboard" 
                                class="btn btn-outline-secondary custom-btn px-4 py-2 ms-2">
                                    Cancel ❌
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>