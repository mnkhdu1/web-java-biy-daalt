<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
    // Get the username from session
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Database connection -->
<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/asus"
                   user="root" password="12345679"/>

<sql:query var="cartCount" dataSource="${dataSource}">
    SELECT COUNT(*) AS item_count FROM cart WHERE user_id = (SELECT user_id FROM users WHERE username = ?);
    <sql:param value="${username}"/>
</sql:query>

<sql:query var="products" dataSource="${dataSource}">
    SELECT product_id, product_name, description, price, stock_quantity, image FROM products;
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
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

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            padding: 7rem 2rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
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
            transition: transform 0.3s ease;
        }

        .grid-item img:hover {
            transform: scale(1.1);
        }

        .grid-item h3 {
            margin: 1rem 0 0.5rem;
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            color: #d4a373;
        }

        .grid-item p {
            font-size: 0.9rem;
            line-height: 1.4;
        }

        .cartServlet {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
        }

        .cartServlet input[type="number"] {
            width: 60px;
            padding: 0.4rem;
            border: 1px solid #d4a373;
            border-radius: 4px;
            background: rgba(230, 213, 199, 0.1);
            color: #e6d5c7;
            text-align: center;
        }

        .cartServlet button {
            padding: 0.5rem 1rem;
            background-color: #d4a373;
            color: #2c1810;
            border: none;
            border-radius: 4px;
            font-family: 'Lato', sans-serif;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .cartServlet button:hover {
            background-color: #c89b6d;
        }

        @media (max-width: 768px) {
            .grid-container {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
        }

        @media (max-width: 480px) {
            .grid-container {
                padding: 6rem 1rem 1rem;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="header.jsp" />

<!-- Grid container -->
<div class="grid-container">
    <c:forEach var="product" items="${products.rows}">
        <div class="grid-item">
            <img src="image?id=${product.product_id}" alt="${product.product_name}">
            <h3>${product.product_name}</h3>
            <p>${product.description}</p>
            <p>Stock: ${product.stock_quantity}</p>
            <p>Price: $${product.price}</p>

            <!-- Add to Cart -->
            <form action="CartServlet" method="post" class="cartServlet">
                <input type="hidden" name="productId" value="${product.product_id}" />
                <input type="number" name="quantity" value="1" min="1" />
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </c:forEach>

    <c:if test="${empty products.rows}">
        <p>No products available.</p>
    </c:if>
</div>

<script>
    function searchProducts() {
        var query = document.getElementById('searchInput').value;
        if (query) {
            window.location.href = 'search.jsp?query=' + encodeURIComponent(query);
        }
    }
</script>

</body>
</html>
