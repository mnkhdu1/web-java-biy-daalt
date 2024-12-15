<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .signup-container {
            display: flex;
            flex-direction: row;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 900px;
            width: 100%;
            height: 500px;
        }

        .signup-left {
            background-color: #007BFF;
            color: #fff;
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
        }

        .signup-left h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .signup-left p {
            font-size: 1rem;
            opacity: 0.8;
        }

        .signup-right {
            flex: 1;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: #f9f9f9;
        }

        .signup-right h2 {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #333;
        }

        .signup-right p {
            font-size: 1rem;
            color: #777;
            margin-bottom: 25px;
        }

        .form-input {
            padding: 15px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .form-input:focus {
            border-color: #007BFF;
        }

        .signup-button {
            padding: 15px;
            background-color: #007BFF;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 1.2rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .signup-button:hover {
            background-color: #0056b3;
        }

        .links {
            margin-top: 20px;
            text-align: center;
        }

        .links a {
            color: #007BFF;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        .links a:hover {
            color: #0056b3;
        }

        @media (max-width: 768px) {
            .signup-container {
                flex-direction: column;
                height: auto;
            }

            .signup-left {
                display: none;
            }

            .signup-right {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="signup-container">
    <div class="signup-left">
        <div>
            <h2>Join Us</h2>
            <p>Create your account and start shopping with us!</p>
        </div>
    </div>
    <div class="signup-right">
        <h2>Create an Account</h2>
        <p>Please fill in your details below.</p>
        <form action="SignupServlet" method="post">
            <input type="text" name="username" placeholder="Username" class="form-input" required>
            <input type="email" name="email" placeholder="Email Address" class="form-input" required>
            <input type="password" name="password" placeholder="Password" class="form-input" required>
            <input type="password" name="confirmPassword" placeholder="Confirm Password" class="form-input" required>
            <button type="submit" class="signup-button">Sign Up</button>
        </form>
        <div class="links">
            <p>Already have an account? <a href="login.jsp">Log In</a></p>
        </div>
    </div>
</div>

</body>
</html>
