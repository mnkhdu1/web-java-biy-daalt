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

<header>
    <div class="navbar">
        <div class="logo">
            <h1>BookHaven</h1>
        </div>
        <nav class="links">
            <a href="/" class="nav-link">Home</a>
            <a href="Upload_Product.jsp" class="nav-link">Add Book</a>
            <a href="purchases.jsp" class="nav-link">My Library</a>
            <a class="cart nav-link" href="/cart.jsp">
                <span class="cart-icon">Cart</span>
                <span class="cart-count">${cartCount.rows[0].item_count}</span>
            </a>
        </nav>
        <div class="user-section">
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Search books..." id="searchInput">
                <button onclick="searchProducts()" class="search-btn">Search</button>
            </div>
            <div class="user-controls">
                <span class="username">Welcome, ${username}</span>
                <a class="logout" href="logout.jsp">Sign Out</a>
            </div>
        </div>
    </div>
</header>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
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

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 2rem;
    }

    .logo h1 {
        font-family: 'Playfair Display', serif;
        color: #e6d5c7;
        font-size: 1.8rem;
        font-weight: 700;
        letter-spacing: 1px;
    }

    .links {
        display: flex;
        align-items: center;
        gap: 2rem;
    }

    .nav-link {
        font-family: 'Lato', sans-serif;
        color: #e6d5c7;
        text-decoration: none;
        font-size: 1rem;
        font-weight: 400;
        transition: all 0.3s ease;
        padding: 0.5rem 1rem;
        border-radius: 4px;
    }

    .nav-link:hover {
        color: #d4a373;
        background-color: rgba(212, 163, 115, 0.1);
    }

    .cart {
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .cart-count {
        background: #d4a373;
        color: #2c1810;
        padding: 0.2rem 0.6rem;
        border-radius: 12px;
        font-size: 0.8rem;
        font-weight: 700;
    }

    .user-section {
        display: flex;
        align-items: center;
        gap: 2rem;
    }

    .search-bar {
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .search-input {
        padding: 0.5rem 1rem;
        border: none;
        border-radius: 4px;
        background: rgba(230, 213, 199, 0.1);
        color: #e6d5c7;
        font-family: 'Lato', sans-serif;
        width: 200px;
        transition: all 0.3s ease;
    }

    .search-input::placeholder {
        color: rgba(230, 213, 199, 0.6);
    }

    .search-input:focus {
        outline: none;
        background: rgba(230, 213, 199, 0.15);
        width: 220px;
    }

    .search-btn {
        padding: 0.5rem 1rem;
        background: #d4a373;
        color: #2c1810;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-family: 'Lato', sans-serif;
        font-weight: 700;
        transition: all 0.3s ease;
    }

    .search-btn:hover {
        background: #c89b6d;
    }

    .user-controls {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .username {
        font-family: 'Lato', sans-serif;
        color: #e6d5c7;
        font-size: 0.9rem;
    }

    .logout {
        font-family: 'Lato', sans-serif;
        color: #d4a373;
        text-decoration: none;
        font-size: 0.9rem;
        transition: all 0.3s ease;
    }

    .logout:hover {
        color: #c89b6d;
    }

    @media (max-width: 1024px) {
        .navbar {
            padding: 0 1rem;
        }

        .links {
            gap: 1rem;
        }

        .user-section {
            gap: 1rem;
        }
    }

    @media (max-width: 768px) {
        .navbar {
            flex-direction: column;
            gap: 1rem;
            padding: 1rem;
        }

        .links {
            width: 100%;
            justify-content: center;
            flex-wrap: wrap;
        }

        .user-section {
            width: 100%;
            flex-direction: column;
        }

        .search-bar {
            width: 100%;
        }

        .search-input {
            width: 100%;
        }

        .user-controls {
            width: 100%;
            justify-content: center;
        }
    }

    @media (max-width: 480px) {
        .logo h1 {
            font-size: 1.5rem;
        }

        .nav-link {
            font-size: 0.9rem;
            padding: 0.4rem 0.8rem;
        }

        .search-btn {
            padding: 0.4rem 0.8rem;
        }
    }
</style>

<script>
    function searchProducts() {
        var query = document.getElementById('searchInput').value;
        if (query) {
            window.location.href = 'search.jsp?query=' + encodeURIComponent(query);
        }
    }
</script>