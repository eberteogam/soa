<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In/Sign Up @ MITA</title>
    <link rel="stylesheet" href="mitastyle.css">
    <style>
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #004d1f;
            /* MITA Green */
            color: white;
            padding: 25px;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .nav-links {
            list-style: none;
            display: flex;
        }

        .nav-links li {
            margin-left: 15px;
            margin-right: 25px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 20px;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }

        .auth-container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #2e7d32;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #256a28;
        }

        .toggle-link {
            text-align: center;
            margin-top: 15px;
            color: #2e7d32;
            cursor: pointer;
        }

        .toggle-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <!-- Header -->
    <nav class="navbar">
        <div class="logo">MITA</div>
        <ul class="nav-links">
            <li><a href="index.html">Home</a></li>
            <li><a href="signup.html">Log In/Sign Up</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
    </nav>

    <!-- Login/Signup Card -->
    <div class="auth-container">
        <!-- Login Form -->
        <div id="loginForm" class="auth-form">
            <h2>Log In</h2>
            <form id="login">
                <div class="form-group">
                    <label for="loginEmail">Email</label>
                    <input type="email" id="loginEmail" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="loginPassword">Password</label>
                    <input type="password" id="loginPassword" placeholder="Enter your password" required>
                </div>
                <button type="button" onclick="handleLogin()">Log In</button>
            </form>
            <p class="toggle-link" onclick="showSignup()">Don’t have an account? Click here to sign up</p>
        </div>

        <!-- Signup Form -->
        <div id="signupForm" class="auth-form" style="display: none;">

            <h2>Sign Up</h2>
            <form action="/auth/signup" method="post">
                <div class="form-group">
                    <label for="signupEmail">Email</label>
                    <input type="email" id="signupEmail" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="signupPassword">Password</label>
                    <input type="password" id="signupPassword" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit">Sign Up</button>
            </form>


<%--            <h2>Sign Up</h2>--%>
<%--            <form action="/auth/signup" method="post">--%>
<%--                <div class="form-group">--%>
<%--                    <label for="signupName">Full Name</label>--%>
<%--                    <input type="text" id="signupName" placeholder="Enter your full name" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="signupEmail">Email</label>--%>
<%--                    <input type="email" id="signupEmail" placeholder="Enter your email" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="signupPhone">Phone</label>--%>
<%--                    <input type="text" id="signupPhone" placeholder="Enter your phone number" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="signupPassword">Password</label>--%>
<%--                    <input type="password" id="signupPassword" placeholder="Enter your password" required>--%>
<%--                </div>--%>
<%--                <button type="button" onclick="handleSignup()">Sign Up</button>--%>
<%--            </form>--%>
            <p class="toggle-link" onclick="showLogin()">Already have an account? Click here to log in</p>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 MITA Airlines | All rights reserved</p>
    </footer>

    <script>
        // Toggle between login and signup forms
        function showSignup() {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("signupForm").style.display = "block";
        }

        function showLogin() {
            document.getElementById("loginForm").style.display = "block";
            document.getElementById("signupForm").style.display = "none";
        }

        // Handle Signup
        function handleSignup() {
            // Get form values
            const name = document.getElementById("signupName").value;
            const email = document.getElementById("signupEmail").value;
            const phone = document.getElementById("signupPhone").value;
            const password = document.getElementById("signupPassword").value;

            // Save data to localStorage
            localStorage.setItem("userName", name);
            localStorage.setItem("email", email);
            localStorage.setItem("phone", phone);
            localStorage.setItem("password", password);

            // Redirect to user page
            alert("Signup successful! Redirecting to your profile...");
            window.location.href = "user";
        }

        // Handle Login
        function handleLogin() {
            // Get form values
            const email = document.getElementById("loginEmail").value;
            const password = document.getElementById("loginPassword").value;

            // Retrieve stored data
            const storedEmail = localStorage.getItem("email");
            const storedPassword = localStorage.getItem("password");

            // Validate user credentials
            if (email === storedEmail && password === storedPassword) {
                alert("Login successful! Redirecting to your profile...");
                window.location.href = "user";
            } else {
                alert("Invalid email or password. Please try again.");
            }
        }
    </script>
</body>

</html>