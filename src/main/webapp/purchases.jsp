<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
    // Redirect to login page if username is not in session
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Database Connection -->
<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/asus"
                   user="root" password="12345679" />

<!-- Query to get purchases -->
<sql:query dataSource="${dataSource}" var="purchases">
    SELECT
    p.purchase_id,
    p.user_id,
    u.username,
    p.product_id,
    pr.product_name,
    p.quantity,
    p.total_price,
    p.purchase_date
    FROM purchases p
    JOIN users u ON p.user_id = u.user_id
    JOIN products pr ON p.product_id = pr.product_id
    WHERE u.username = ?;
    <sql:param value="${username}" />
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchases</title>
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

        .no-purchases {
            text-align: center;
            font-size: 1.2rem;
            color: #d4a373;
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .grid-container {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
        }

        @media (max-width: 480px) {
            .grid-container {
                padding: 0 1rem 1rem;
            }
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<h1>Your Purchases</h1>

<div class="grid-container">
    <c:forEach var="purchase" items="${purchases.rows}">
        <div class="grid-item">
            <img src="image?id=${purchase.product_id}" alt="${purchase.product_name}">
            <h3>${purchase.product_name}</h3>
            <p>Quantity: ${purchase.quantity}</p>
            <p>Total Price: $${purchase.total_price}</p>
            <p>Purchase Date: ${purchase.purchase_date}</p>
        </div>
    </c:forEach>

    <c:if test="${empty purchases.rows}">
        <p class="no-purchases">You have not made any purchases yet.</p>
    </c:if>
</div>

</body>
</html>
