
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
        PreparedStatement pst = conn.prepareStatement("Select *from users where u_name=? and passwd=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        if(rs.next())  {

            getuser.user_id=rs.getInt("uid");
           //out.println("Valid login credentials");
           redirectURL = "user_dashboard.jsp";
           response.sendRedirect(redirectURL);
        }
        else {%>
<script>
    // Your application has indicated there's an error
    window.setTimeout(function(){

        // Move to a new location or you can do something else
        window.location.href = "signin.jsp";

    }, 3000);</script>

            <%
           out.println("Sorry Invalid username or password! Redirecting ..................");}
   }
   catch(Exception e){
       out.println(e);
       out.println("Something went wrong !! Please try again");
   }
%>
