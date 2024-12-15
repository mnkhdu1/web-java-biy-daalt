<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login</title>
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

        .login-container {
            display: flex;
            flex-direction: row;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 900px;
            width: 100%;
            height: 500px;
        }

        .login-left {
            background-color: #007BFF;
            color: #fff;
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
        }

        .login-left h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .login-left p {
            font-size: 1rem;
            opacity: 0.8;
        }

        .login-right {
            flex: 1;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: #f9f9f9;
        }

        .login-right h2 {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #333;
        }

        .login-right p {
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

        .login-button {
            padding: 15px;
            background-color: #007BFF;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 1.2rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
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
            .login-container {
                flex-direction: column;
                height: auto;
            }

            .login-left {
                display: none;
            }

            .login-right {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="login-left">
        <div>
            <h2>Welcome Back!</h2>
            <p>Log in to your account and continue shopping.</p>
        </div>
    </div>
    <div class="login-right">
        <h2>Customer Login</h2>
        <p>Please enter your credentials to login.</p>
        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="Email Address" class="form-input" required>
            <input type="password" name="password" placeholder="Password" class="form-input" required>
            <button type="submit" class="login-button">Log In</button>
        </form>
        <div class="links">
            <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
            <p>Forgot your password? <a href="update.jsp">Reset Password</a></p>
        </div>
    </div>
</div>

</body>
</html>
