<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MovieMate - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/auth.css">
</head>
<body>
<jsp:include page="../partials/navbar.jsp" />

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="card shadow">
                <div class="card-body p-5">
                    <h3 class="card-title text-center mb-4">Login To MovieMate</h3>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <c:if test="${not empty success}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                ${success}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/auth/login" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">Sign In</button>
                        </div>
                    </form>

                    <div class="text-center mt-3">
                        <p>Don't have an account? <a href="${pageContext.request.contextPath}/auth/register">Register here</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    body {
        background-color: #000000;
        color: #ffffff;
        font-family: 'Poppins', sans-serif;
    }

    .card {
        background-color: #1a1a1a;
        border: 1px solid #333;
    }

    .card-title {
        color: #ffffff;
        position: relative;
        padding-bottom: 15px;
        margin-bottom: 25px;
    }

    .card-title::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 3px;
        background-color: #e50914;
        border-radius: 2px;
    }


    .form-label {
        color: #ffffff;
    }

    .form-control {
        background-color: #2a2a2a;
        border: 1px solid #444;
        color: #ffffff;
    }

    .form-control:focus {
        background-color: #2a2a2a;
        border-color: #e50914;
        color: #ffffff;
        box-shadow: 0 0 0 0.2rem rgba(229, 9, 20, 0.25);
    }

    .btn-primary {
        background-color: #e50914;
        border-color: #e50914;
    }

    .btn-primary:hover {
        background-color: #b8070f;
        border-color: #b8070f;
    }

    a {
        color: #e50914;
    }

    a:hover {
        color: #b8070f;
    }

    .alert {
        border: none;
        border-radius: 5px;
    }

    .alert-danger {
        background-color: rgba(229, 9, 20, 0.2);
        color: #ff6b6b;
    }

    .alert-success {
        background-color: rgba(46, 204, 113, 0.2);
        color: #2ecc71;
    }
    .text-center{
        color: white;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>