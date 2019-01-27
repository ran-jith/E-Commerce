
<%@ page import ="java.sql.*" %>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>

<jsp:setProperty property="*" name="obj"/>
<%
    try{
        String username = request.getParameter("uname");
        String password = request.getParameter("passwd");
        String redirectURL;
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");
        PreparedStatement pst = conn.prepareStatement("Select *from admin where uname=? and passwd=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        if(rs.next())  {

            //getuser.user_id=rs.getInt("uid");
           //out.println("Valid login credentials");
           redirectURL = "admin_dashboard.jsp";
           response.sendRedirect(redirectURL);
        }
        else
           out.println("Invalid login credentials");
   }
   catch(Exception e){
       out.println(e);
       out.println("Something went wrong !! Please try again");
   }
%>
