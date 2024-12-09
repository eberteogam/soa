<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking @ MITA</title>
    <style><%@include file="flightoption.css"%></style>
</head>

<body>

<!-- Navigation Bar -->
    <%@ include file="navbar.jsp" %>

    <!-- Flight Selection Section -->
    <section class="flight-options">
      <h2>Flight Options</h2>
        <p>From: ${fromLocation}</p>
        <p>To: ${toLocation}</p>
        <div id="flight-options-container">

            <c:if test="${empty flights}">
                <p>No flights available for the selected route</p>
            </c:if>

        <form:form id="flightForm" action="/selectedFlight" method="GET">
            <input type="hidden" id="selectedFlightId" name="flightId" value=""/>
            <c:forEach var="flight" items="${flights}">
                <div class="flight-card">
                    <h3>${flight.flightNumber}</h3>
                    <p>${flight.airportDeparture.airportName} - ${flight.airportDestination.airportName}</p>
                    <p>Departure: ${flight.flightDepartureTime} - Arrival: ${flight.flightDestinationTime}</p>
                    <p>Price: $${flight.flightPrice}</p>
                    <button type="button" class="select-btn" onclick="selectFlight(${flight.flightId})">Select</button>
                </div>
            </c:forEach>
        </form:form>

    <script>
    function selectFlight(flightId) {
        document.getElementById("selectedFlightId").value = flightId;
        document.getElementById("flightForm").submit();
    }
</script>

    </div>
    </section>
    <%@ include file="footer.jsp" %>
</body>
</html>