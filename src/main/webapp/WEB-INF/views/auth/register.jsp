<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MovieMate - Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/footer.css" rel="stylesheet">
    <style>
        :root {
            --primary-red: #e50914;
            --dark-bg: #121212;
            --darker-bg: #1e1e1e;
            --light-text: #ffffff;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--dark-bg);
            color: var(--light-text);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 0;
        }

        .auth-container {
            max-width: 450px;
            width: 100%;
            padding: 2.5rem;
            background: var(--darker-bg);
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
            border-top: 3px solid var(--primary-red);
        }

        .auth-title {
            color: var(--light-text);
            margin-bottom: 1.5rem;
            text-align: center;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .auth-title::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: var(--primary-red);
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.08);
            border: none;
            color: var(--light-text);
            height: 45px;
            padding: 0.75rem;
            margin-bottom: 1.25rem;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.12);
            color: var(--light-text);
            box-shadow: 0 0 0 0.25rem rgba(229, 9, 20, 0.25);
        }

        .btn-register {
            background-color: var(--primary-red);
            border: none;
            padding: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }

        .btn-register:hover {
            background-color: #f40612;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(229, 9, 20, 0.4);
        }

        .auth-link {
            color: var(--primary-red);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .auth-link:hover {
            color: #ff6b6b;
            text-decoration: underline;
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .alert-danger {
            background-color: rgba(229, 9, 20, 0.15);
            border-color: rgba(229, 9, 20, 0.3);
            color: #ff6b6b;
        }

        .alert-success {
            background-color: rgba(25, 135, 84, 0.15);
            border-color: rgba(25, 135, 84, 0.3);
            color: #6bd39a;
        }
    </style>
</head>
<body>
<%@ include file="../partials/navbar.jsp" %>

<main class="main-content">
    <div class="auth-container">
        <h2 class="auth-title">Create an Account</h2>

        <c:choose>
            <c:when test="${not empty error}">
                <div class="alert alert-danger mb-4">${error}</div>
            </c:when>
            <c:when test="${not empty success}">
                <div class="alert alert-success mb-4">${success}</div>
            </c:when>
        </c:choose>

        <form action="${pageContext.request.contextPath}/auth/register" method="post">
            <div class="row">
                <div class="mb-3">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" required>
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required
                       pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$"
                       title="Must contain at least 8 characters, one uppercase, one lowercase, one number and one special character">
                <small class="form-text text-muted">
                    Password must contain at least 8 characters with uppercase, lowercase, number and special character
                </small>
            </div>
            <button type="submit" class="btn btn-register w-100">Create Account</button>
        </form>

        <div class="mt-4 text-center">
            <p>Already have an account? <a href="${pageContext.request.contextPath}/auth/login" class="auth-link">Sign In</a></p>
        </div>
    </div>
</main>

<%@ include file="../partials/footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}static/js/home.js"></script>
<script>
    document.querySelector('form').addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const pattern = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$/;

        if (!pattern.test(password)) {
            e.preventDefault();
            alert('Password must contain at least 8 characters with uppercase, lowercase, number and special character');
        }
    });
</script>
</body>
</html>