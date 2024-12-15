<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<sql:setDataSource var="con"
                   driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/bookstore?allowPublicKeyRetrieval=true"
                   user="root"
                   password="admin" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bookstore Dashboard</title>
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
            background-color: #007bff;
            padding: 10px;
            text-align: center;
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
    <h1>Bookstore Dashboard</h1>
</header>

<div class="menu">
    <button class="menu-item" onclick="show_content('add_book')">Add Book</button>
    <button class="menu-item" onclick="show_content('update_book')">Update Books</button>
    <button class="menu-item" onclick="window.location.href='/'">View Books</button>
    <a href="logout.jsp" class="menu-item">Logout</a>
</div>

<!-- Add Book Form -->
<div id="add_book" class="content active">
    <h2>Add a New Book</h2>
    <form method="post" action="AddBookServlet" enctype="multipart/form-data">
        <div>
            <label for="name">Book Title:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
        </div>
        <div>
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required>
        </div>
        <div>
            <label for="stock_quantity">Stock Quantity:</label>
            <input type="number" id="stock_quantity" name="stock_quantity" required>
        </div>
        <div>
            <label for="category_id">Category:</label>
            <select id="category_id" name="category_id" required>
                <option value="1" selected>Fiction</option>
                <option value="2">Non-Fiction</option>
                <option value="3">Science</option>
                <option value="4">History</option>
            </select>
        </div>
        <div>
            <label for="image">Cover Image:</label>
            <input type="file" id="image" name="image">
        </div>
        <button type="submit">Add Book</button>
    </form>
</div>

<!-- Update Book Prices and Quantities -->
<div id="update_book" class="content">
    <h2>Update Books</h2>
    <form method="post" action="UpdateBookServlet">
        <table>
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Price</th>
                <th>Stock Quantity</th>
                <th>Actions</th>
            </tr>
            <sql:query dataSource="${con}" var="books">
                SELECT book_id, name, price, stock_quantity FROM Books;
            </sql:query>

            <c:forEach var="book" items="${books.rows}">
                <tr>
                    <td>${book.book_id}</td>
                    <td>${book.name}</td>
                    <td><input type="number" name="price_${book.book_id}" value="${book.price}" step="0.01" min="0"></td>
                    <td><input type="number" name="stock_quantity_${book.book_id}" value="${book.stock_quantity}" min="0"></td>
                    <td>
                        <button type="submit" name="action" value="update_${book.book_id}">Update</button>
                        <button type="submit" name="action" value="delete_${book.book_id}">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>

<% String error = (String) request.getAttribute("error");
    if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>

<script>
    function show_content(content_id) {
        const contents = document.querySelectorAll('.content');
        contents.forEach(content => content.classList.remove('active'));
        document.getElementById(content_id).classList.add('active');
    }
</script>
</body>
</html>
