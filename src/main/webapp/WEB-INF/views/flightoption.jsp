<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking @ MITA</title>
    <link rel="stylesheet" href="mitastyle.css">
    <style>
        /* Flight Option */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #004d1f;
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

        /* Flight Options Section */
        .flight-options {
            width: 80%;
            margin: 2rem auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .flight-options h2 {
            font-size: 1.8rem;
            color: #28a745;
            /* MITA Green */
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .flight-card {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .flight-card h3 {
            font-size: 1.5rem;
            color: #333;
        }

        .flight-card p {
            font-size: 1.1rem;
            color: #555;
            margin: 0.5rem 0;
        }

        .select-btn {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            font-size: 1.1rem;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .select-btn:hover {
            background-color: #218838;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 30px;
            border-radius: 8px;
            width: 50%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .modal-content p {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 1.5rem;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-button {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            margin: 10px 0;
            border: none;
            cursor: pointer;
            font-size: 18px;
            border-radius: 4px;
        }

        .modal-button:hover {
            background-color: #218838;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: white;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo">MITA</div>
        <ul class="nav-links">
            <li><a href="mitaindex.jsp" class="home-link">Home</a></li>
            <li><a href="signup.jsp">Log In / Sign Up</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
    </nav>


    <!-- Flight Selection Section -->
    <section class="flight-options">
        <h2>Flight Options</h2>
        <div id="flight-options-container">
            <!-- Flight 111 -->
            <div class="flight-card">
                <h3>Spirit111 </h3>
                <p>LAX - JFK</p>
                <p>Departure: 8:00 AM - Arrival: 12:00 PM</p>
                <p>Price: $90</p>
                <button class="select-btn" onclick="selectFlight('Spirit111')">Select</button>
            </div>

            <!-- Flight 102 -->
            <div class="flight-card">
                <h3>AmericanAir101</h3>
                <p>LAX - JFK</p>
                <p>Departure: 2:00 PM - Arrival: 6:00 PM</p>
                <p>Price: $150</p>
                <button class="select-btn" onclick="selectFlight('AmericanAir101')">Select</button>
            </div>

            <!-- Flight 103 -->
            <div class="flight-card">
                <h3>Southwest403</h3>
                <p>LAX - JFK</p>
                <p>Departure: 6:00 PM - Arrival: 10:00 PM</p>
                <p>Price: $200</p>
                <button class="select-btn" onclick="selectFlight('Southwest403')">Select</button>
            </div>

            <!-- Flight 104 -->
            <div class="flight-card">
                <h3>Delta312</h3>
                <p>LAX - JFK</p>
                <p>Departure: 6:00 PM - Arrival: 10:00 PM</p>
                <p>Price: $135</p>
                <button class="select-btn" onclick="selectFlight('Delta112')">Select</button>
            </div>

            <!-- Flight 105 -->
            <div class="flight-card">
                <h3>Frontier210</h3>
                <p>LAX - JFK</p>
                <p>Departure: 6:00 PM - Arrival: 10:00 PM</p>
                <p>Price: $135</p>
                <button class="select-btn" onclick="selectFlight('Frontier210')">Select</button>
            </div>
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

    <footer>
        <p>&copy; 2024 MITA Airlines | All rights reserved</p>
    </footer>

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
            window.location.href = `passengerdetails.html?flight=${encodeURIComponent(flight)}`;
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