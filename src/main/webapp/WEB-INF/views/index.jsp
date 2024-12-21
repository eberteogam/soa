<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking @ MITA</title>
    <style><%@include file="index.css"%></style>
</head>

<body>
    <!-- Navigation Bar -->
    <%@ include file="navbar.jsp" %>

    <!-- Intro Section -->
    <section id="intro-section" class="intro">
        <div class="intro-content">
            <h1>Welcome to MITA</h1>
            <p>Book your dream flight</p>
        </div>
    </section>

    <!-- Main Content -->
    <div class="container">
        <!-- Tabs -->
        <div class="main-tabs">
            <button id="flight-tab" class="tab active">Flight</button>
            <button id="checkin-tab" class="tab">Check-in</button>
        </div>

        <!-- Flight Form Section -->
        <div id="flight-form-section" class="form-section">
            <!-- Trip Type Buttons -->
            <div class="booking-tabs">
                <button id="one-way-tab" class="tab active">One Way</button>
                <button id="round-trip-tab" class="tab">Round Trip</button>
            </div>

            <!-- Form -->
            <form action="/searchFlights" method="GET">
                <!-- From & To Airports -->
                <div class="form-group">
                    <div class="input-group">
                        <label for="from-location">From:</label>
                        <select id="from-location" name="fromLocation" required>
                            <option value="">Select a departure city</option>
                            <c:forEach var="airport" items="${airports}">
                                <option value="${airport.airportId}">${airport.airportName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="input-group">
                        <label for="to-location">To:</label>
                        <select id="to-location" name="toLocation" required>
                            <option value="">Select a destination city</option>
                            <c:forEach var="airport" items="${airports}">
                                <option value="${airport.airportId}">${airport.airportName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <!-- Dates -->
                <div class="form-group">
                    <div class="input-group">
                        <label>Departure Date:</label>
                        <input type="date" name="departureDate">
                    </div>
                    <div class="input-group return-group" style="display: none;">
                        <label>Return Date:</label>
                        <input type="date" name="returnDate">
                    </div>
                </div>

                <!-- Passengers -->
                <div class="form-group">
                    <label>Number of Passengers:</label>
                    <input type="number" name="numPassengers" min="1" required>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="search-btn">Search Flights</button>
            </form>
        </div>

        <!-- Check-in Section (Hidden by Default) -->
        <div id="checkin-form-section" class="form-section" style="display: none;">
            <h2>Check-in</h2>
            <form action="/checking" method="POST">
                <div class="form-group">
                    <label for="booking-reference">Booking Reference:</label>
                    <input type="text" id="booking-reference" name="bookingReference" placeholder="Enter booking reference" required>
                </div>
                <div class="form-group">
                    <label for="last-name">Last Name:</label>
                    <input type="text" id="last-name" name="lastName" placeholder="Enter your last name" required>
                </div>
                <button type="submit" class="submit-btn">Check-in</button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <script>
        // Initialize forms based on tab selection
        const flightTab = document.getElementById("flight-tab");
        const checkinTab = document.getElementById("checkin-tab");
        const flightFormSection = document.getElementById("flight-form-section");
        const checkinFormSection = document.getElementById("checkin-form-section");
        const oneWayTab = document.getElementById("one-way-tab");
        const roundTripTab = document.getElementById("round-trip-tab");
        const returnDateGroup = document.querySelector(".return-group");

        // Default display (Flight tab and One Way option)
        flightTab.classList.add("active");
        flightFormSection.style.display = "block";
        returnDateGroup.style.display = "none"; // Ensure Return Date is hidden for One Way

        // Tab switching logic
        flightTab.addEventListener("click", () => {
            flightTab.classList.add("active");
            checkinTab.classList.remove("active");
            flightFormSection.style.display = "block";
            checkinFormSection.style.display = "none";
        });

        checkinTab.addEventListener("click", () => {
            checkinTab.classList.add("active");
            flightTab.classList.remove("active");
            flightFormSection.style.display = "none";
            checkinFormSection.style.display = "block";
        });

        // Trip type switching logic
        oneWayTab.addEventListener("click", () => {
            oneWayTab.classList.add("active");
            roundTripTab.classList.remove("active");
            returnDateGroup.style.display = "none"; // Hide return date for One Way
        });

        roundTripTab.addEventListener("click", () => {
            roundTripTab.classList.add("active");
            oneWayTab.classList.remove("active");
            returnDateGroup.style.display = "block"; // Show return date for Round Trip
        });
    </script>
</body>
</html>
