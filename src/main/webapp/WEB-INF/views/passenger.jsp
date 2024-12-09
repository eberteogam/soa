<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking @ MITA</title>
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

        .passenger-details-section {
            width: 100%;
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .passenger-details-section h2 {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 1.5rem;
            text-align: center;
            color: #28a745;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-size: 1rem;
            color: #555;
            margin-bottom: 0.5rem;
        }

        .form-group input,
        .form-group select {
            padding: 0.75rem;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s ease;
            width: 100%;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #28a745;
        }

        .submit-btn {
            width: 100%;
            padding: 0.75rem;
            font-size: 1.1rem;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #218838;
        }

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
<%@ include file="navbar.jsp" %>

    <div class="passenger-details-section">
        <h2>Passenger Details</h2>
        <p><strong>Selected Flight:</strong> <span id="selected-flight"></span></p>

        <!-- Passenger Details Form -->
        <form id="passengerForm" autocomplete="on" onsubmit="redirectToPayment(event)">
            <div class="form-group">
                <label for="first-name">First Name:</label>
                <input type="text" id="first-name" name="first-name" autocomplete="given-name" required>
            </div>

            <div class="form-group">
                <label for="last-name">Last Name:</label>
                <input type="text" id="last-name" name="last-name" autocomplete="family-name" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" autocomplete="email" required>
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

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 MITA Airlines | All rights reserved</p>
    </footer>
</body>

<script>
    document.getElementById("passengerForm").addEventListener("submit", function (event) {
        event.preventDefault();

        const passengerDetails = {
            firstName: document.getElementById("first-name").value,
            lastName: document.getElementById("last-name").value,
            email: document.getElementById("email").value,
            phone: document.getElementById("phone").value,
            flightId: getQueryParam("flight") // Assuming flight ID is passed in the query params
        };

        fetch('http://localhost:8080/api/v1/passenger', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(passengerDetails)
        })
            .then(response => {
                if (response.ok) {
                    alert("Passenger details submitted successfully.");
                    window.location.href = `payment.html?flight=${passengerDetails.flightId}`;
                } else {
                    alert("Failed to submit passenger details.");
                }
            })
            .catch(error => console.error('Error submitting passenger details:', error));
    });
    window.location.href = `payment.html?flight;

</script>
</body>

</html>