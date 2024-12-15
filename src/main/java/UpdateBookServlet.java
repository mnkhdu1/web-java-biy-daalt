import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the action to be performed (update or delete)
        String action = request.getParameter("action");

        // Database connection details
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = DatabaseConnection.getConnection();

            if (action.startsWith("update_")) {
                // Update price and stock quantity for the given book_id
                int bookId = Integer.parseInt(action.substring(7)); // Extract book_id
                double price = Double.parseDouble(request.getParameter("price_" + bookId));
                int stockQuantity = Integer.parseInt(request.getParameter("stock_quantity_" + bookId));

                String sql = "UPDATE Books SET price = ?, stock_quantity = ? WHERE book_id = ?";
                stmt = connection.prepareStatement(sql);
                stmt.setDouble(1, price);
                stmt.setInt(2, stockQuantity);
                stmt.setInt(3, bookId); // Update to bookId
                stmt.executeUpdate();
                response.sendRedirect("seller_dashboard.jsp");

            } else if (action.startsWith("delete_")) {
                // Delete the book from the database
                int bookId = Integer.parseInt(action.substring(7)); // Extract book_id

                String sql = "DELETE FROM Books WHERE book_id = ?";
                stmt = connection.prepareStatement(sql);
                stmt.setInt(1, bookId); // Delete using bookId
                stmt.executeUpdate();
                response.sendRedirect("seller_dashboard.jsp");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("seller_dashboard.jsp").forward(request, response);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
