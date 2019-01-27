<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>
<%@ page import ="java.sql.*" %>
<jsp:setProperty property="*" name="obj"/>

<html>
    <%
    try{
        /*String username = request.getParameter("username");
        String password = request.getParameter("password");
        String redirectURL;*/
        if (request.getParameter("submit") != null) {
            int item= Integer.parseInt(request.getParameter("pid"));
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");


                    pst = conn.prepareStatement("insert into cart(pid,uid) values(?,?)");
                    pst.setInt(1, item);
                    pst.setInt(2, (getuser.user_id));
                    int status = pst.executeUpdate();
                    out.print("added to cart");
                    response.sendRedirect("mycart.jsp");






        }

        /*PreparedStatement pst = conn.prepareStatement("Select user_name,password from medicine_user where user_name=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        if(rs.next())  {
           //out.println("Valid login credentials");
           redirectURL = "user_show_details.jsp";
           response.sendRedirect(redirectURL);
        }
        else
           out.println("Invalid login credentials"); */
   }
   catch(Exception e){
       out.println(e);
       out.println("Something went wrong !! Please try again");
   }
%>
