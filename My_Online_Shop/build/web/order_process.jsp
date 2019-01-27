
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>

<jsp:setProperty property="*" name="obj"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        try{
          if (request.getParameter("submit") != null) {
            String item= request.getParameter("pid");


            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");
            PreparedStatement pst;
            ResultSet rs;
            int price = 0;

            pst = conn.prepareStatement("Select * from cart where pid=?");
                    pst.setString(1, item);
                    rs = pst.executeQuery();
                    rs.next();
                    pst = conn.prepareStatement("Select *from product where pid=?");
                    pst.setString(1,rs.getString("pid") );
                    ResultSet rs1 = pst.executeQuery();
                    rs1.next();
                    price = rs1.getInt("price");

                    pst = conn.prepareStatement("insert into orders(pid,uname,pname,price) values(?,?,?,?)");
                    pst.setString(1, rs.getString("pid") );
                    pst.setString(2, String.valueOf(getuser.user_id));
                    pst.setString(3, String.valueOf(rs1.getString("name")));
                    pst.setString(4, String.valueOf(price));
                    int status = pst.executeUpdate();

                    pst = conn.prepareStatement("DELETE FROM cart WHERE pid=?");
                    pst.setString(1, item);

                    status = pst.executeUpdate();

                    if(status > 0)
                    {
                        pst = conn.prepareStatement("UPDATE product SET stock = stock-1 WHERE pid=?");
                        pst.setString(1, rs.getString("pid") );
                        int u = pst.executeUpdate();
                        String redirectURL = "myorder.jsp";
                        response.sendRedirect(redirectURL);
                    }





        }



    }
   catch(Exception e){
       out.println(e);
       out.println("Something went wrong !! Please try again");
   }
%>
    </body>
</html>
