<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up @ MITA</title>
    <style><%@include file="styles.css"%></style>
</head>

<body>
    <!-- Navigation Bar -->
    <%@ include file="navbar.jsp" %>

        <div id="signupForm" class="auth-form">

            <h2>Sign Up</h2>
            <form action="/auth/signup" method="post">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="userEmail" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit">Sign Up</button>
            </form>

            <p class="toggle-link"><a href="login">Already have an account? Click here to log in</a></p>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 MITA Airlines | All rights reserved</p>
    </footer>

    <script>

    </script>
</body>

</html>