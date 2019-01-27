<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>
<%@ page import ="java.sql.*" %>
<jsp:setProperty property="*" name="obj"/>



<%
    try{
        String redirectURL;
        Statement st;
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");
       
            String jid = request.getParameter("pid");
        
            String jname = request.getParameter("pname");
            String jcat = request.getParameter("cat");
            String jimg = request.getParameter("img");
            String jdesc = request.getParameter("desc");
            String jprice = request.getParameter("price");
            String jstock = request.getParameter("stock");
            String query = "update product set name = '"+jname+"', category = '"+jcat+"', image = '"+jimg+"', description = '"+jdesc+"', price = '"+jprice+"', stock='"+jstock+"'  WHERE pid = '"+jid+"'";
            st = conn.createStatement();
            st.executeUpdate(query);
            out.print(jprice);
            response.sendRedirect("view_product.jsp");
            conn.close();
        } catch (Exception e){
                //| IllegalAccessException | InstantiationException | SQLException e) {
            out.print(e);
            e.printStackTrace();
        }
%>