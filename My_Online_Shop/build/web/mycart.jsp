<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>
<%@ page import ="java.sql.*" %>
<jsp:setProperty property="*" name="obj"/>
<html>
<head>
  <title>Mycart</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link href="style/style.css" type="text/css" rel="stylesheet" />
</head>
<div class="mainscreen">
<body>
<!-------------navigatio-->
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
   <div class="navbar-header">
     <a class="navbar-brand" href="#">Buy-It</a>
   </div>
   <ul class="nav navbar-nav">
     <li class=""><a href="user_dashboard.jsp">Home</a></li>
     <li class="active"><a href="mycart.jsp">View Cart</a></li>
     <li><a href="myorder.jsp">View Orders</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
 </div>
</nav>

<%
try{
        String redirectURL;
        Class.forName("com.mysql.jdbc.Driver");
       // Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");
        PreparedStatement pst = conn.prepareStatement("Select * from cart where uid=?");
        pst.setString(1, String.valueOf(getuser.user_id));
        ResultSet rs = pst.executeQuery();
        int totalprice=0;
        %>
        <form name="something" action="order_process.jsp" method="post">
        <div style="overflow-x:auto;">
  <table>
    <tr>
      <th>Sl No</th>
      <th>Product Id</th>
      <th>Name</th>
      <th>Category</th>
      <th>Price</th>
      <th>Availability</th>
      <th>Action</th>
    </tr>
        <%
            int count=1;
        while(rs.next())
        {
        %>



            <tr>
                <td><%=count %></td>

                <%

                    pst = conn.prepareStatement("Select  *from product where pid=?");
                    pst.setString(1,rs.getString("pid") );
                    ResultSet rs1 = pst.executeQuery();
                    rs1.next();




                %>

                <td><%=rs1.getInt("pid") %></td>
                <td><%=rs1.getString("name") %></td>
                <td><%=rs1.getString("category") %></td>
                <td><%=rs1.getString("price") %></td>
                <td><%=rs1.getString("stock") %></td>
            <input type="hidden" name="pid" value="<%=rs1.getInt("pid") %>">
                <td><input type="submit" name="submit" value="Buy" class="btn btn-success"></td>
            </tr>



        <%
         count++;
        }
        %>

        </table>
        </form>
      <%

    }
   catch(Exception e){
       out.println(e);
       out.println("Something went wrong !! Please try again");
   }
%>
</body>
</div>
</html>
