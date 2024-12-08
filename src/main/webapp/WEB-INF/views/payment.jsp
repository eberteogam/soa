<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking @ MITA</title>
    <link rel="stylesheet" href="mitastyle.css">
    <style>
        /* Paymenttt */
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

        /* Payment Form Section */
        .payment-form {
            width: 100%;
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .payment-form h2 {
            font-size: 1.8rem;
            color: #28a745;
            /* MITA Green */
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .payment-form p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 2rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 0.5rem;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            font-size: 1.1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        .form-group input:focus {
            outline: none;
            border-color: #28a745;
        }

        .submit-btn {
            padding: 0.75rem;
            font-size: 1.2rem;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #218838;
        }

        /* Modal styles */
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
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 8px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
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
            width: 100%;
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

        /* submitbtn */
        @media (max-width: 768px) {
            .payment-form {
                padding: 1rem;
            }

            .form-group input {
                font-size: 1rem;
            }

            .submit-btn {
                font-size: 1rem;
            }
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


    <!-- PAYMENT SECTION -->
    <section class="payment-form">
        <h2>Payment Method</h2>
        <p><strong>Selected Flight:</strong> <span id="selected-flight"></span></p>
        <form id="paymentForm" onsubmit="confirmBooking(event)">
            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" placeholder="Enter card number" maxlength="16" pattern="\d{16}"
                    title="Card number must be 16 digits" required>
            </div>
            <div class="form-group">
                <label for="expiryDate">Expiry Date</label>
                <input type="month" id="expiryDate" required>
            </div>
            <div class="form-group">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" placeholder="Enter CVV" pattern="\d{3}" title="CVV must be 3 digits"
                    required>
            </div>
            <button type="submit" class="submit-btn">Confirm Booking</button>
        </form>
    </section>

    <!-- Modal for Booking Confirmation -->
    <div id="bookingModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="modalMessage"></p>
            <button class="modal-button" onclick="closeModal()">Okay</button>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 MITA Airlines | All rights reserved</p>
    </footer>

    <script>
        // Function to retrieve query parameters from the URL
        function getQueryParam(param) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
        }

        // Display the selected flight on the payment page
        document.getElementById("selected-flight").textContent = getQueryParam("flight");

        // Show modal with booking confirmation
        function confirmBooking(event) {
            event.preventDefault(); // Prevent form from submitting normally

            // Get the flight information
            const selectedFlight = getQueryParam("flight") || "Not selected";

            //  card number length
            const cardNumber = document.getElementById("cardNumber").value;
            if (cardNumber.length !== 16) {
                alert("Card number must be exactly 16 digits.");
                return;
            }

            //  expiry date 
            const expiryDate = document.getElementById("expiryDate").value;
            if (!expiryDate) {
                alert("Please select a valid expiry date.");
                return;
            }

            // Set the modal message & show the modal
            document.getElementById("modalMessage").textContent = `Booking confirmed for ${selectedFlight}! Your payment was successful.`;
            document.getElementById("bookingModal").style.display = "block";
        }

        // Close the modal when clicked close button
        function closeModal() {
            document.getElementById("bookingModal").style.display = "none";
        }

        // Close the modal when clicked outside of the modal
        window.onclick = function (event) {
            const modal = document.getElementById("bookingModal");
            if (event.target === modal) {
                modal.style.display = "none";
            } document.getElementById("paymentForm").addEventListener("submit", function (event) {
                event.preventDefault();

                alert("Payment successful! Your booking is confirmed.");
                // Redirect to a confirmation page or user profile
                window.location.href = "user.html";
            });

        }


    </script>
</body>

</html>