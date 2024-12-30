<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Take Action - UTM DCS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card shadow-lg">
            <div class="card-header bg-primary text-white">
                <h3><i class="bi bi-tools me-2"></i> Assign Technician to Complaint #${complaint.id}</h3>
            </div>
            <div class="card-body">
                <h5 class="mb-3"><i class="bi bi-info-circle me-2"></i> Complaint Details</h5>
                <ul class="list-unstyled">
                    <li><strong>Title:</strong> ${complaint.title}</li>
                    <li><strong>Description:</strong> ${complaint.description}</li>
                    <li><strong>Status:</strong> ${complaint.status}</li>
                </ul>

                <form action="${pageContext.request.contextPath}/admin/assignTechnician" method="post">
                    <input type="hidden" name="complaintId" value="${complaint.id}">

                    <div class="form-group mb-3">
                        <label for="technicianSelect" class="form-label"><i class="bi bi-person-check me-2"></i>Select Technician:</label>
                        <select id="technicianSelect" name="technicianId" class="form-select" required>
                            <option value="">Select a technician...</option>
                            <c:forEach items="${availableTechnicians}" var="tech">
                                <option value="${tech.id}" ${tech.isBusy() ? 'disabled class="text-muted"' : ''}>
                                    ${tech.name} ${tech.isBusy() ? '(BUSY)' : '(AVAILABLE)'}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="btn-group">
                        <button class="btn btn-sm btn-outline-primary" 
                            onclick="window.location.href='${pageContext.request.contextPath}/admin/chat?complaintId=${complaint.id}'">
                            <i class="bi bi-chat-dots"></i> Chat with User
                        </button>
                        <button class="btn btn-sm btn-outline-danger"
                            onclick="window.location.href='${pageContext.request.contextPath}/admin/deleteComplaint/${complaint.id}'">
                            <i class="bi bi-trash"></i> Delete this complaint
                        </button>
                        <button class="btn btn-sm btn-outline-success"
                            onclick="window.location.href='${pageContext.request.contextPath}/admin/takeAction/${complaint.id}'">
                            <i class="bi bi-check-circle me-1"></i> Assign now
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
