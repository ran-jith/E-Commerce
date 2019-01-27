import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Updated extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "ecom";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "password123";
        Statement st;
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Connected!");
            String jid = req.getParameter("pid");
            String jname = req.getParameter("pname");
            String jcat = req.getParameter("cat");
            String jimg = req.getParameter("img");
            String jdesc = req.getParameter("desc");
            String jprice = req.getParameter("price");
            String jstock = req.getParameter("stock");
            String query = "update product set name = '"+jname+"', category = '"+jcat+"', image = '"+jimg+"', description = '"+jdesc+"', price = '"+jprice+"', stock='"+jstock+"'  WHERE pid = '"+jid+"'";
            st = conn.createStatement();
            st.executeUpdate(query);
            out.print("Successfully updated");
            //res.sendRedirect("view_product.jsp");
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
            out.print(e);
            e.printStackTrace();
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
