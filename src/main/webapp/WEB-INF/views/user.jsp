<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile @ MITA</title>
    <style><%@include file="user.css"%></style>
</head>

<body>

<!-- Navigation Bar -->
<%@ include file="navbar.jsp" %>

    <!-- User Information Section -->
    <div class="user-container">
        <h2>User Profile</h2>

        <!-- User Image -->
        <img src="/images/profilepic.jpg" alt="User Image" class="user-image" id="userImage">

        <div class="user-info">
            <p><strong>Name:</strong> <span id="userName">${user.userName}</span></p>
            <p><strong>Email:</strong> <span id="userEmail">${user.userEmail}</span></p>
            <p><strong>Phone:</strong> <span id="userPhone">${user.userPhone}</span></p>
            <p><strong>Password:</strong> <span id="userPassword">${user.userPassword}</span></p>
        </div>

        <!-- Booking Information -->
        <div class="booking-info">
            <h3>Your Bookings</h3>
            <p>No bookings available. Start by booking a flight!</p>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>
</body>

</html>