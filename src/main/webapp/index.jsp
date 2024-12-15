<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #343a40;
            color: #fff;
            padding: 15px;
            text-align: center;
        }
        .menu {
            display: flex;
            background-color: #007bff;
            padding: 10px;
            text-align: center;
            justify-content: center;
        }
        .menu-item {
            color: white;
            background-color: #0056b3;
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 4px;
        }
        .menu-item:hover {
            background-color: #004085;
        }
        .content {
            display: none;
            margin: 20px;
        }
        .content.active {
            display: block;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        form div {
            margin-bottom: 10px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input, select, textarea, button {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<header>
    <h1>Book Shop</h1>
</header>

<div class="menu">
    <a href="/" class="menu-item">Home</a>
    <a href="seller_dashboard.jsp" class="menu-item">Upload</a>
    <% if (username == null) { %>
    <a href="login.jsp" class="menu-item">Login</a>
    <% } else { %>
    <span><%= username %></span>
    <a href="logout.jsp" class="menu-item">Logout</a>
    <% } %>
</div>


<sql:setDataSource var="dataSource"
                   driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/bookstore?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"
                   user="root"
                   password="admin" />

<sql:query dataSource="${dataSource}" var="books">
    SELECT b.book_id, b.name, b.description, b.price, b.stock_quantity, c.category_name
    FROM Books b
    JOIN Categories c ON b.category_id = c.category_id;
</sql:query>

<div class="grid-container">
    <c:forEach var="book" items="${books.rows}">
        <div class="grid-item">
            <!-- Placeholder for book image, replace with real image if available -->
            <img src="/image?id=${book.book_id}" alt="${book.name}" />
            <p><strong>${book.name}</strong></p>
            <p>${book.author}</p>
            <p><strong>Price: $${book.price}</strong></p>
            <p><em>Category: ${book.category_name}</em></p>
            <p><em>Stock: ${book.stock_quantity}</em></p>
        </div>
    </c:forEach>
</div>

<footer>
    &copy; 2024 Bookstore. All rights reserved.
</footer>

</body>
</html>
