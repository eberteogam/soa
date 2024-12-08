<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking @ MITA</title>
    <link rel="stylesheet" href="mitastyle.css">
</head>

<style>
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


    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="number"],
    .form-group select,
    .form-group textarea {
        width: 100%;
        padding: 0.75rem;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
        border-color: #28a745;
        outline: none;
    }

    textarea {
        resize: vertical;
        box-sizing: border-box;
    }

    /* Intro Section */
    .intro {
        position: relative;
        height: 400px;
        background: url('bg.png') no-repeat center center/cover;
        display: flex;
        align-items: flex-end;
        justify-content: center;
    }

    .intro-content {
        background-color: rgba(18, 64, 5, 0.5);
        color: white;
        padding: 20px;
        text-align: center;
        width: 100%;
        max-width: 1200px;
        box-sizing: border-box;
    }

    .intro h1 {
        font-size: 36px;
        margin: 0;
        padding-bottom: 10px;
    }

    .intro p {
        font-size: 18px;
    }

    /* Flight Booking Section */
    .container {
        background-color: white;
        padding: 50px;
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: 20px auto;
        max-width: 2400px;
        width: 100%;
    }

    .booking-tabs {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    /* Tabs styling */
    .main-tabs,
    .booking-tabs {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .tab {
        background-color: #ccc;
        padding: 10px 20px;
        margin: 0 5px;
        cursor: pointer;
        border: none;
        border-radius: 5px;
    }

    .tab.active {
        background-color: #28a745;
        color: white;
    }

    .form-section {
        display: none;
    }

    .form-section.active {
        display: block;
    }

    #airport-list {
        margin-top: 20px;
        display: flex;
        background-color: #fff;
        flex-direction: column;
        border-radius: 8px;
        gap: 20px;
        padding: 10px;
    }

    .airport-item {
        margin-bottom: 10px;
        padding: 10px;
        background-color: #f9f9f9;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }


    .airport-item h3 {
        margin: 0;
        font-size: 1.2em;
    }

    .airport-item p {
        margin: 5px 0;
        font-size: 1em;
    }


    /* Input group styling */
    .input-group {
        margin-bottom: 15px;
    }

    .input-group label {
        display: block;
        margin-bottom: 5px;
    }

    .input-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    /* search button */
    .search-btn {
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }

    .search-btn:hover {
        background-color: #218838;
    }

    /* Filter Group */
    .filter-group {
        margin-bottom: 15px;
    }

    .filter-group label {
        display: block;
        font-size: 16px;
        margin-bottom: 5px;
        color: #333;
    }

    .filter-group input,
    .filter-group select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    .filter-btn {
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }

    .filter-btn:hover {
        background-color: #218838;
    }
</style>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo">MITA</div>
        <ul class="nav-links">
            <li><a href="#intro-section" class="home-link">Home</a></li>
            <li><a href="signup">Sign Up/Log In</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
    </nav>

    <!-- Intro Section -->
    <section id="intro-section" class="intro">
        <div class="intro-content">
            <h1>Welcome to MITA</h1>
            <p>Book your dream flight</p>
        </div>
    </section>

    <!-- Book/Check-in Tabs -->
    <div class="container">
        <div class="main-tabs">
            <button id="flight-tab" class="tab active">Flight</button>
            <button id="checkin-tab" class="tab">Check-in</button>
        </div>

        <!-- Flight Booking Section -->
        <div id="flight-form-section" class="form-section">
            <div class="booking-tabs">
                <button id="one-way-tab" class="tab active">One Way</button>
                <button id="round-trip-tab" class="tab">Return</button>
                <button id="multi-city-tab" class="tab">Multi City</button>
            </div>

            <form class="flight-form" id="flightForm" action="">
                <!-- Trip type forms -->
                <div class="input-group">
                    <div id="airport-list">
                        <label for="from-location">From:</label>
                        <select id="from-location" required>
                            <option value="">Select a departure city</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label for="to-location">To:</label>
                        <select id="to-location" required>
                            <option value="">Select a destination city</option>
                        </select>
                    </div>
                </div>

                <!-- Date Fields (One-Way/Return) -->
                <div class="form-group">
                    <div class="input-group">
                        <label for="departure-date">Departure Date:</label>
                        <input type="date" id="departure-date" required>
                    </div>
                    <div class="input-group return-group">
                        <label for="return-date">Return Date:</label>
                        <input type="date" id="return-date">
                    </div>
                </div>

                <!-- Passengers -->
                <div class="form-group">
                    <div class="input-group">

                        <label for="numPassengers">Number of Passengers:</label>
                        <input type="number" id="numPassengers" name="numPassengers" min="1" required>

                    </div>
                    <div id="passenger-forms-container"></div>

                    <!-- Submit Button -->
                    <div id="search-flight-section">
                        <button type="submit" class="search-btn">Search Flights</button>
                    </div>

            </form>
        </div>


        <!--Checkin-tab-->
        <div id="checkin-form-section" class="form-section" style="display:none;">
            <h2>Check-in</h2>
            <form class="checkin-form">
                <!-- Booking reference or e-ticket -->
                <div class="form-group">
                    <div class="input-group">
                        <label for="booking-reference">Booking Reference:</label>
                        <input type="text" id="booking-reference" placeholder="Enter booking reference">
                    </div>
                </div>

                <!-- Last name -->
                <div class="form-group">
                    <div class="input-group">
                        <label for="last-name">Last Name:</label>
                        <input type="text" id="last-name" placeholder="Enter your last name">
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="submit-btn">Check-in</button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 MITA Airlines | All rights reserved</p>
    </footer>

    <script>
        // Function to populate a dropdown menu with data from JSON
        function populateDropdown(data, dropdownId) {
            const dropdown = document.getElementById(dropdownId);
            dropdown.innerHTML = ""; // Clear existing options

            data.forEach(item => {
                const option = document.createElement("option");
                option.value = item.id;
                option.textContent = `${item.airportName} (${item.airportCode})`;
                dropdown.appendChild(option);
            });
        }

        // Fetch airport data and populate the dropdowns
        document.addEventListener("DOMContentLoaded", function () {
            fetch('http://localhost:8080/api/v1/airport')
                .then(response => response.json())
                .then(data => {
                    populateDropdown(data, "from-location"); // Populate "From" dropdown
                    populateDropdown(data, "to-location");   // Populate "To" dropdown
                })
                .catch(error => console.error('Error fetching airport data:', error));
        });
        // Display the list of airports
        function displayAirports(airports) {
            const airportList = document.getElementById('airport-list');  // Ensure this ID matches your container element
            if (!Array.isArray(airports)) {
                console.error('Expected an array of airports');
                return;
            }

            // Clear previous list if any
            airportList.innerHTML = '';

            airports.forEach(airport => {
                const airportItem = document.createElement('div');
                airportItem.classList.add('airport-item');

                airportItem.innerHTML = `
                <h3>${airport.airportName} (${airport.airportCode})</h3>
                <p>Location: ${airport.airportLocation}</p>
                <p>Timezone: ${airport.airportTimezone}</p>
            `;

                airportList.appendChild(airportItem);
            });
        }

        // Tab switching logic
        const flightTab = document.getElementById("flight-tab");
        const checkinTab = document.getElementById("checkin-tab");
        const flightFormSection = document.getElementById("flight-form-section");
        const checkinFormSection = document.getElementById("checkin-form-section");
        const oneWayTab = document.getElementById("one-way-tab");
        const roundTripTab = document.getElementById("round-trip-tab");
        const multiCityTab = document.getElementById("multi-city-tab");
        const returnDateGroup = document.querySelector(".return-group");

        // Book/Check-in tab switching
        function activateMainTab(selectedTab) {
            // Reset all tabs
            flightTab.classList.remove("active");
            checkinTab.classList.remove("active");

            // Activate selected tab
            selectedTab.classList.add("active");

            // Show the corresponding form section
            if (selectedTab === flightTab) {
                flightFormSection.style.display = "block";
                checkinFormSection.style.display = "none";
            } else {
                flightFormSection.style.display = "none";
                checkinFormSection.style.display = "block";
            }
        }

        flightTab.addEventListener("click", function () {
            activateMainTab(flightTab);
        });

        checkinTab.addEventListener("click", function () {
            activateMainTab(checkinTab);
        });

        // Trip type tab switching
        function activateFlightTab(selectedTab) {
            oneWayTab.classList.remove("active");
            roundTripTab.classList.remove("active");
            multiCityTab.classList.remove("active");

            selectedTab.classList.add("active");

            // Show return date field for round-trip only
            if (returnDateGroup) {
                returnDateGroup.style.display = (selectedTab === roundTripTab) ? "block" : "none";
            }
        }

        oneWayTab.addEventListener("click", function () {
            activateFlightTab(oneWayTab);
        });

        roundTripTab.addEventListener("click", function () {
            activateFlightTab(roundTripTab);
        });

        multiCityTab.addEventListener("click", function () {
            activateFlightTab(multiCityTab);
        });

        // Smooth scroll for Home link
        const homeLink = document.querySelector('.home-link');
        homeLink.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent default anchor behavior
            const introSection = document.getElementById('intro-section');
            introSection.scrollIntoView({ behavior: 'smooth' }); // Smooth scroll to the intro section
        });

        // Handle form submission for flight search
        const searchButton = document.querySelector('.submit-btn');
        searchButton.addEventListener("click", function (event) {
            event.preventDefault(); // Prevent page reload on form submission
            searchFlights();
        });

        // Search flights and redirect with query parameters
        function searchFlights() {
            // Get values from the form
            const fromLocation = document.getElementById('from-location').value;
            const toLocation = document.getElementById('to-location').value;
            const departureDate = document.getElementById('departure-date').value;
            const returnDate = document.getElementById('return-date').value;
            const numPassengers = document.getElementById('numPassengers').value;

            // Construct the URL with query parameters
            <%--const url = `flightoption.html?from=${encodeURIComponent(fromLocation)}&to=${encodeURIComponent(toLocation)}&departure=${encodeURIComponent(departureDate)}&return=${encodeURIComponent(returnDate)}&passengers=${encodeURIComponent(numPassengers)}`;--%>

            // Redirect to the flightoption page with the query parameters
            window.location.href = 'flightoption.jsp';
        }
    </script>
</body>


</html>