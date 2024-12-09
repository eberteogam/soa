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
<%--        <div id="flight-options-container">--%>
<%--            <!-- Flight 111 -->--%>
<%--            <div class="flight-card">--%>
<%--                <h3>Spirit111 </h3>--%>
<%--                <p>LAX - JFK</p>--%>
<%--                <p>Departure: 8:00 AM - Arrival: 12:00 PM</p>--%>
<%--                <p>Price: $90</p>--%>
<%--                <button class="select-btn" onclick="selectFlight('Spirit111')">Select</button>--%>
<%--            </div>--%>
    </section>

  <!-- Flight Selection Section -->
    <section class="flight-options">
        <h2>Flight Options</h2>
        <div id="flight-options-container">
            <c:forEach var="flight" items="${flights}">
                <div class="flight-card">
                    <h3>${flight.flightNumber}</h3>
                    <p>${flight.airportDeparture.airportName} - ${flight.airportDestination.airportName}</p>
                    <p>Departure: ${flight.flightDepartureTime} - Arrival: ${flight.flightDestinationTime}</p>
                    <p>Price: $${flight.flightPrice}</p>
                    <button class="select-btn" onclick="selectFlight('${flight.flightNumber}')">Select</button>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- Modal for Flight Confirmation -->
    <div id="flightConfirmModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <p id="modalMessage"></p>
            <button class="modal-button" onclick="confirmFlight()">Confirm</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        // open the modal and show the flight details
        function selectFlight(flight) {
            const modalMessage = document.getElementById("modalMessage");
            modalMessage.textContent = `You have selected: ${flight}. Are you sure you want to confirm this flight?`;
            document.getElementById("flightConfirmModal").style.display = "block";
        }

        // confirm the flight and redirect
        function confirmFlight() {
            const flight = document.getElementById("modalMessage").textContent.split(": ")[1].split(".")[0];
            // Redirect to the passenger details page
            <%--window.location.href = `passengerdetails.html?flight=${encodeURIComponent(flight)}`;--%>
        }


        // Function to close the modal
        function closeModal() {
            document.getElementById("flightConfirmModal").style.display = "none";
        }

        // Close the modal when clicked outside the modal
        window.onclick = function (event) {
            const modal = document.getElementById("flightConfirmModal");
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>

</html>