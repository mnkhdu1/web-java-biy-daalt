<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
    // Get the username and userId from session
    String username = (String) session.getAttribute("username");
    Integer userId = (Integer) session.getAttribute("userId");

    if (username == null || userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Database connection -->
<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/asus"
                   user="root" password="12345679"/>

<!-- Query to fetch cart items -->
<sql:query var="cartItems" dataSource="${dataSource}">
    SELECT p.product_id, p.product_name, p.price, c.quantity
    FROM cart c
    JOIN products p ON c.product_id = p.product_id
    WHERE c.user_id = ?
    <sql:param value="${userId}"/>
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
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

        .cart-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            padding: 0 2rem 2rem;
            max-width: 1200px;
            margin: 5rem auto;
        }

        .cart-item {
            background-color: #2c1810;
            border: 1px solid #d4a373;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            padding: 1rem;
            color: #e6d5c7;
        }

        .cart-item:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(212, 163, 115, 0.6);
        }

        .cart-item h3 {
            margin: 1rem 0 0.5rem;
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            color: #d4a373;
        }

        .cart-item p {
            font-size: 0.9rem;
            line-height: 1.4;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            gap: 1rem;
            margin-top: 1rem;
        }

        .actions button {
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

        .actions button:hover {
            background-color: #c89b6d;
        }

        .total-price {
            text-align: center;
            margin: 2rem 0;
            font-size: 1.5rem;
            color: #d4a373;
        }

        .empty-cart {
            text-align: center;
            font-size: 1.2rem;
            color: #d4a373;
            margin-top: 2rem;
        }

        img{
            background-position: center;
            object-fit: cover;
            width: 100%;
            max-height: 20rem;
        }

        @media (max-width: 768px) {
            .cart-container {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
        }

        @media (max-width: 480px) {
            .cart-container {
                padding: 0 1rem 1rem;
            }
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<h1>Your Shopping Cart</h1>

<div class="cart-container">
    <c:forEach var="item" items="${cartItems.rows}">
        <div class="cart-item">
            <img src="image?id=${item.product_id}" alt="${item.product_name}">
            <h3>${item.product_name}</h3>
            <p>Price: $${item.price}</p>
            <p>Quantity: ${item.quantity}</p>
            <p>Total: $${item.price * item.quantity}</p>
            <div class="actions">
                <form action="removeFromCart" method="post">
                    <input type="hidden" name="productId" value="${item.product_id}">
                    <button type="submit">Remove</button>
                </form>
                <form action="purchaseFromCart" method="post">
                    <input type="hidden" name="productId" value="${item.product_id}">
                    <input type="hidden" name="productQuantity" value="${item.quantity}">
                    <button type="submit">Purchase</button>
                </form>
            </div>
        </div>
    </c:forEach>

    <c:if test="${empty cartItems.rows}">
        <p class="empty-cart">Your cart is empty.</p>
    </c:if>
</div>

<c:if test="${not empty cartItems.rows}">
    <div class="total-price">
        <c:set var="totalAmount" value="0" />
        <c:forEach var="item" items="${cartItems.rows}">
            <c:set var="totalAmount" value="${totalAmount + item.price * item.quantity}" />
        </c:forEach>
        Total: $${totalAmount}
    </div>
</c:if>

</body>
</html>
