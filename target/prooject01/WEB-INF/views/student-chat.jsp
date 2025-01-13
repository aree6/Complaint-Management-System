<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Chat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/emoji-mart@latest/css/emoji-mart.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/emoji-mart@latest/dist/emoji-mart.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            min-height: 100vh;
            background-image: 
                radial-gradient(at 91% 62%, hsla(37,86%,88%,1) 0px, transparent 50%),
                radial-gradient(at 53% 29%, hsla(349,100%,84%,1) 0px, transparent 50%),
                radial-gradient(at 11% 45%, hsla(137,82%,83%,1) 0px, transparent 50%),
                radial-gradient(at 51% 94%, hsla(178,59%,76%,1) 0px, transparent 50%);
            position: relative;
            overflow-x: hidden;
        }

        /* Glass Container */
        .glass-container {
            background: rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.8);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.1);
            padding: 20px;
            position: relative;
            z-index: 1;
            margin: 20px;
        }

        .chat-box {
            height: 70vh;
            overflow-y: auto;
            padding: 1.5rem;
            margin-bottom: 20px;
            background: rgba(255, 255, 255, 0.5);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .chat-bubble {
            padding: 1rem;
            border-radius: 15px;
            max-width: 70%;
            margin-bottom: 1rem;
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            position: relative;
        }

        .sent {
            background: rgba(79, 70, 229, 0.1);
            color: #1e293b;
            margin-left: auto;
            border: 1px solid rgba(79, 70, 229, 0.2);
        }

        .received {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(0, 0, 0, 0.1);
            color: #1e293b;
        }

        .message-time {
            font-size: 0.75rem;
            opacity: 0.6;
            color: #475569;
        }

        /* Input Area */
        .input-group {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            overflow: hidden;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .form-control {
            background: transparent;
            border: none;
            color: #1e293b;
            padding: 15px;
        }

        .form-control::placeholder {
            color: #64748b;
        }

        .form-control:focus {
            background: transparent;
            box-shadow: none;
            color: #1e293b;
        }

        .btn-send {
            background: rgba(79, 70, 229, 0.1);
            border: 1px solid rgba(79, 70, 229, 0.2);
            color: #4f46e5;
            padding: 10px 20px;
            border-radius: 0 15px 15px 0;
            transition: all 0.3s ease;
        }

        .btn-send:hover {
            background: rgba(79, 70, 229, 0.2);
        }

        /* Header */
        .chat-header {
            color: #1e293b;
            margin-bottom: 20px;
        }

        .btn-back {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(0, 0, 0, 0.1);
            color: #4f46e5;
            padding: 8px 20px;
            border-radius: 10px;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .btn-back:hover {
            background: rgba(79, 70, 229, 0.1);
            color: #4f46e5;
        }

        /* Scrollbar */
        .chat-box::-webkit-scrollbar {
            width: 6px;
        }

        .chat-box::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.3);
        }

        .chat-box::-webkit-scrollbar-thumb {
            background: rgba(79, 70, 229, 0.2);
            border-radius: 3px;
        }

        .chat-box::-webkit-scrollbar-thumb:hover {
            background: rgba(79, 70, 229, 0.3);
        }

        strong {
            color: #1e293b;
        }

        /* Message options and reactions */
        .message-options {
            display: none;
            position: absolute;
            right: -40px;
            top: 50%;
            transform: translateY(-50%);
        }
        
        .chat-bubble:hover .message-options {
            display: flex;
        }
        
        .reaction-button {
            padding: 4px;
            border-radius: 50%;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            cursor: pointer;
            margin: 2px;
        }
        
        /* Typing indicator */
        .typing-indicator {
            display: none;
            padding: 10px;
            margin: 10px 0;
        }
        
        .typing-dot {
            display: inline-block;
            width: 8px;
            height: 8px;
            margin-right: 4px;
            background: #90cdf4;
            border-radius: 50%;
            animation: typing 1s infinite ease-in-out;
        }
        
        /* File attachment preview */
        .attachment-preview {
            max-width: 200px;
            margin: 10px 0;
            border-radius: 8px;
            overflow: hidden;
        }
        
        /* Message timestamp tooltip */
        .timestamp-tooltip {
            position: absolute;
            background: rgba(0,0,0,0.8);
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            display: none;
        }
        
        .chat-bubble:hover .timestamp-tooltip {
            display: block;
        }



        button {
  font-family: inherit;
  font-size: 20px;
  background: transparent;
  color: royalblue;
  padding: 0.7em 1em;
  padding-left: 0.9em;
  display: flex;
  align-items: center;
  border: 0px solid royalblue;
  border-radius: 16px;
  overflow: hidden;
  transition: all 0.1s;
  cursor: pointer;
}

button span {
  display: block;
  margin-left: 0.3em;
  transition: all 0.2s ease-in-out;
}

button svg {
  display: block;
  transform-origin: center center;
  transition: transform 0.2s ease-in-out;
}

button:hover .svg-wrapper {
  animation: fly-1 0.3s ease-in-out infinite alternate;
}

button:hover svg {
  transform: translateX(1.2em) rotate(45deg) scale(1.1);
}

button:hover span {
  transform: translateX(5em);
}

button:active {
  transform: scale(0.95);
}

@keyframes fly-1 {
  from {
    transform: translateY(0.1em);
  }

  to {
    transform: translateY(-0.1em);
  }
}



    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="glass-container">
                    <div class="chat-header d-flex justify-content-between align-items-center" style="background: rgba(248, 249, 252, 0.01) !important;">
                        <h2>Chat - Complaint #${complaintId}</h2>
                        <a href="${pageContext.request.contextPath}/student/dashboard" class="btn-back">
                            <i class="fas fa-arrow-left"></i> Back
                        </a>
                    </div>

                    <div class="chat-box" id="chatBox" style="background: rgba(248, 249, 252, 0.1) !important;">
                        <div class="messages-wrapper">
                            <c:forEach items="${messages}" var="message">
                                <div class="d-flex flex-column ${message.sender.id eq currentUserId ? 'align-items-end' : 'align-items-start'}">
                                    <div class="chat-bubble ${message.sender.id eq currentUserId ? 'sent' : 'received'}">
                                        <div class="message-content">
                                            <p class="mb-1" style="font-size: 1.2rem;">${message.content}</p>
                                            <div class="message-options">
                                                <span class="reaction-button" onclick="toggleEmojiPicker(this)">
                                                    <i class="far fa-smile"></i>
                                                </span>
                                                <span class="reaction-button" onclick="toggleReply(this)">
                                                    <i class="fas fa-reply"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="message-footer">
                                            <small class="message-time">
                                                ${message.sender.id eq currentUserId ? 'You' : message.sender.name}
                                                <span class="timestamp-tooltip">${message.createdAt}</span>
                                            </small>
                                            <i class="fas fa-check-double text-primary"></i>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/student/chat/send" method="POST">
                        <input type="hidden" name="complaintId" value="${complaintId}">
                        <div class="input-group">
                            <input type="text" name="content" class="form-control" placeholder="Type your message...">
                            <button>
                                <div class="svg-wrapper-1">
                                  <div class="svg-wrapper">
                                    <svg
                                      xmlns="http://www.w3.org/2000/svg"
                                      viewBox="0 0 24 24"
                                      width="24"
                                      height="24"
                                    >
                                      <path fill="none" d="M0 0h24v24H0z"></path>
                                      <path
                                        fill="currentColor"
                                        d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z"
                                      ></path>
                                    </svg>
                                  </div>
                                </div>
                                <span>Send</span>
                              </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const chatBox = document.getElementById('chatBox');
        
        function scrollToBottom() {
            chatBox.scrollTo({
                top: chatBox.scrollHeight,
                behavior: 'smooth'
            });
        }

        // Initial scroll to bottom
        scrollToBottom();
    
        // Auto-scroll on new messages
        const observer = new MutationObserver(scrollToBottom);
        observer.observe(chatBox, { childList: true, subtree: true });
    
        // Auto-refresh every 30 seconds
        setInterval(() => {
            const isAtBottom = chatBox.scrollHeight - chatBox.scrollTop === chatBox.clientHeight;
            location.reload();
            if (isAtBottom) {
                scrollToBottom();
            }
        }, 30000);
    </script>
</body>
</html>