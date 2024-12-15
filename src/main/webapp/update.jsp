<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Password</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .update-container {
            display: flex;
            flex-direction: row;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            width: 100%;
            height: 500px;
        }

        .update-left {
            background-color: #007BFF;
            color: white;
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
            text-align: center;
        }

        .update-left h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .update-left p {
            font-size: 1.2rem;
            opacity: 0.8;
        }

        .update-right {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: #f9f9f9;
        }

        .update-right h2 {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #333;
        }

        .update-right p {
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

        .update-button {
            padding: 15px;
            background-color: #007BFF;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 1.2rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .update-button:hover {
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
            .update-container {
                flex-direction: column;
                height: auto;
            }

            .update-left {
                display: none;
            }

            .update-right {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="update-container">
    <div class="update-left">
        <div>
            <h2>Update Your Password</h2>
            <p>Make your account more secure</p>
        </div>
    </div>
    <div class="update-right">
        <h2>Update Password</h2>
        <p>Please enter your details to update your password</p>
        <form action="UpdateServlet" method="post">
            <input type="text" name="username" placeholder="Enter your username" class="form-input" required>
            <input type="email" name="email" placeholder="Enter your email" class="form-input" required>
            <input type="password" name="password" placeholder="Enter your new password" class="form-input" required>
            <button type="submit" class="update-button">Update Password</button>
        </form>
        <div class="links">
            <p>Remember your password? <a href="login.jsp">Log In</a></p>
        </div>
    </div>
</div>

</body>
</html>
