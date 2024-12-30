<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/asus"
                   user="root" password="12345679"/>
<sql:query var="products" dataSource="${dataSource}">
    SELECT product_id, product_name, description, price, image FROM products WHERE product_name LIKE ?
    <sql:param value="%${param.query}%" />
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #1a1a1a;
            color: #e6d5c7;
            font-family: 'Lato', sans-serif;
        }

        header {
            background-color: #2c1810;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #d4a373;
            font-family: 'Playfair Display', serif;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            padding: 0 2rem 2rem;
            max-width: 1200px;
            margin: 5rem auto;
        }

        .grid-item {
            background-color: #2c1810;
            border: 1px solid #d4a373;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            padding: 1rem;
            color: #e6d5c7;
        }

        .grid-item:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(212, 163, 115, 0.6);
        }

        .grid-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 0.5rem;
        }

        .grid-item h3 {
            font-family: 'Playfair Display', serif;
            font-size: 1.2rem;
            color: #d4a373;
            margin-bottom: 0.5rem;
        }

        .grid-item p {
            font-size: 0.9rem;
            line-height: 1.4;
        }

        .no-results {
            text-align: center;
            color: #d4a373;
            font-size: 1.2rem;
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .grid-container {
                grid-template-columns: repeat(2, 1fr);
                gap: 1rem;
            }
        }

        @media (max-width: 480px) {
            .grid-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<h1>Search Results for "${param.query}"</h1>

<div class="grid-container">
    <c:forEach var="product" items="${products.rows}">
        <div class="grid-item">
            <img src="image?id=${product.product_id}" alt="${product.product_name}">
            <h3>${product.product_name}</h3>
            <p>${product.description}</p>
            <p><strong>Price:</strong> $${product.price}</p>
        </div>
    </c:forEach>

    <c:if test="${empty products.rows}">
        <p class="no-results">No products found for "${param.query}".</p>
    </c:if>
</div>
</body>
</html>
