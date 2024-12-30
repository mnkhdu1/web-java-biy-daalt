<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <style> 
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Orbitron', sans-serif;
        }

        body {
            background: #1a1a1a;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            color: #ffffff;
        }

        .signup-container {
            position: relative;
            width: 400px;
            padding: 30px;
            background-color: #2c1810;
            border: 1px solid #d4a373;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.7);
            overflow: hidden;
        }

        /* Flowing Neon Borders */
        .signup-container::before {
            content: '';
            position: absolute;
            top: -3px;
            left: -3px;
            right: -3px;
            bottom: -3px;
            z-index: -1;
            border-radius: 20px;
            background-size: 300% 300%;
            animation: flowingColors 6s infinite linear;
        }

        @keyframes flowingColors {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo img {
            width: 180px;
            filter: drop-shadow(0 0 20px #00ffff);
        }

        h2 {
            font-size: 26px;
            text-align: center;
            color: #d4a373;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 13px;
            color: #ffffff;
            margin-bottom: 8px;
            text-transform: uppercase;
        }

        input {
            width: 100%;
            padding: 12px;
            background: rgba(230, 213, 199, 0.1);
            color: #e6d5c7;
            border: 1px solid #333;
            border-radius: 8px;
            font-size: 14px;
            transition: border 0.3s, box-shadow 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #d4a373;
        }

        .signup-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            color: #ffffff;
            text-transform: uppercase;
            cursor: pointer;
            transition: box-shadow 0.3s ease, transform 0.2s ease;
            background-color: #2c1810;
        }

        .additional-text {
            text-align: center;
            font-size: 14px;
            margin-top: 20px;
        }

        .additional-text a {
            color: #d4a373;
            text-decoration: none;
            font-weight: bold;
        }

        /* Responsive adjustments for medium screens (tablets) */
        @media (max-width: 768px) {
            .signup-container {
                width: 90%;
                padding: 20px;
            }

            .logo img {
                width: 150px;
            }

            h2 {
                font-size: 22px;
            }

            input, .signup-btn {
                padding: 10px;
                font-size: 13px;
            }

            .additional-text {
                font-size: 12px;
            }
        }

        /* Responsive adjustments for small screens (mobile phones) */
        @media (max-width: 480px) {
            body {
                justify-content: flex-start;
                padding-top: 20px;
            }

            .signup-container {
                width: 95%;
                padding: 15px;
            }

            .logo img {
                width: 120px;
            }

            h2 {
                font-size: 18px;
            }

            input, .signup-btn {
                padding: 8px;
                font-size: 12px;
            }

            .additional-text {
                font-size: 10px;
            }

            .accent-line {
                display: none; /* Hide accent lines for smaller screens to reduce clutter */
            }
        }
    </style>
</head>
<body>
<div class="accent-line"></div>
<div class="accent-line"></div>
<div class="accent-line"></div>
<div class="signup-container">
    <h2>Signup</h2>
    <form action="SignupServlet" method="post">
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-group">
            <label for="phone_number">Phone Number</label>
            <input type="number" id="phone_number" name="phone_number" placeholder="Enter your phone number">
        </div>
        <button type="submit" class="signup-btn">Signup</button>
    </form>
    <p class="additional-text">Already have an account? <a href="login.jsp">Login</a></p>
</div>
</body>
</html>
