<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <form action="/submitPassengerDetails" method="POST" autocomplete="on">
            <input type="hidden" name="numPassengers" value="${numPassengers}">
            <c:forEach var="i" begin="1" end="${numPassengers}">
                <div class="form-group">
                    <h3>Passenger ${i}</h3>
                    <label>First Name:</label>
                    <input type="text" name="passenger[${i}].firstName" autocomplete="given-name" required>

                    <label>Last Name:</label>
                    <input type="text" name="passenger[${i}].lastName" autocomplete="family-name" required>

                    <label>Phone Number:</label>
                    <input type="tel" name="passenger[${i}].phone" autocomplete="tel" required>
                </div>
            </c:forEach>
            <div class="form-group">
                <button type="submit" class="submit-btn">Submit</button>
            </div>
        </form>

    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>