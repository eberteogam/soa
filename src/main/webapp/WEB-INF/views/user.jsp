<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile @ MITA</title>
    <link rel="stylesheet" href="mitastyle.css">
    <style>
        /* header */
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

        .user-container {
            max-width: 700px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 20px;
        }

        .user-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 2px solid #2e7d32;
            margin: 0 auto 20px auto;
            display: block;
            object-fit: cover;
            background-color: #eaeaea;
            /* Placeholder background */
        }

        .user-info {
            margin-bottom: 15px;
            text-align: left;
        }

        .user-info p {
            margin: 10px 0;
        }

        .user-info strong {
            display: inline-block;
            width: 120px;
        }

        .booking-info {
            margin-top: 30px;
            text-align: left;
        }
    </style>
</head>

<body>
    <!-- Header -->
    <nav class="navbar">
        <div class="logo">MITA</div>
        <ul class="nav-links">
            <li><a href="mitaindex.jsp">Home</a></li>
            <li><a href="signup.jsp">Sign Up/Log In</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
    </nav>

    <!-- User Information Section -->
    <div class="user-container">
        <h2>User Profile</h2>

        <!-- User Image -->
        <img src="" alt="User Image" class="user-image" id="userImage">

        <div class="user-info">
            <p><strong>Name:</strong> <span id="userName"></span></p>
            <p><strong>Email:</strong> <span id="userEmail"></span></p>
            <p><strong>Phone:</strong> <span id="userPhone"></span></p>
            <p><strong>Password:</strong> <span id="userPassword"></span></p>
        </div>

        <!-- Booking Information -->
        <div class="booking-info">
            <h3>Your Bookings</h3>
            <p>No bookings available. Start by booking a flight!</p>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 MITA Airlines | All rights reserved</p>
    </footer>

    <script>

        // Fetch user data from localStorage
        const userName = localStorage.getItem("userName") || "Guest";
        const userEmail = localStorage.getItem("email") || "Not Provided";
        const userPhone = localStorage.getItem("phone") || "Not Provided";
        const userPassword = localStorage.getItem("password") || "Not Provided";

        // Update user profile data
        document.getElementById("userName").textContent = userName;
        document.getElementById("userEmail").textContent = userEmail;
        document.getElementById("userPhone").textContent = userPhone;
        document.getElementById("userPassword").textContent = userPassword;

        // Placeholder image logic
        const userImage = document.getElementById("userImage");
        userImage.src = "https://via.placeholder.com/150"; // Placeholder image URL
    </script>
</body>

</html>