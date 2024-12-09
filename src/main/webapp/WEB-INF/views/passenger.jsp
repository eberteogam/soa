<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking @ MITA</title>
    <style><%@include file="passenger.css"%></style>
</head>

<body>

<!-- Navigation Bar -->
<%@ include file="navbar.jsp" %>

    <div class="passenger-details-section">
        <h2>Passenger Details</h2>
        <p><strong>Selected Flight:</strong> <span id="selected-flight"></span></p>

        <!-- Passenger Details Form -->
        <form id="passengerForm" autocomplete="on">
            <div class="form-group">
                <label for="first-name">First Name:</label>
                <input type="text" id="first-name" name="first-name" autocomplete="given-name" required>
            </div>

            <div class="form-group">
                <label for="last-name">Last Name:</label>
                <input type="text" id="last-name" name="last-name" autocomplete="family-name" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" autocomplete="tel" required>
            </div>

            <div class="form-group">
                <button type="submit" class="submit-btn">Submit</button>
            </div>
        </form>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>