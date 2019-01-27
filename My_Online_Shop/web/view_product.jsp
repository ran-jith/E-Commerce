<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>
<%@ page import ="java.sql.*" %>
<jsp:setProperty property="*" name="obj"/>
<html>
<head>
  <title>View product</title>
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
     <li class=""><a href="admin_dashboard.jsp">Admin home</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
 </div>
</nav>

<%







    try{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String redirectURL;
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");
        PreparedStatement pst = conn.prepareStatement("Select * from product");
       // pst.setString(1, String.valueOf(getuser.user_id));
        ResultSet rs = pst.executeQuery();
        %>
        <form name="something" action="view_products.jsp" method="post">
            <div style="overflow:auto;">
                <table align="center" cellpadding="5" cellspacing="2" style="overflow: auto">
            <tr>
                <th>Sl No</th>
                <th>Product Id</th>
                <th>Category</th>
                <th>Name</th>
                <th>Price</th>
                <th>Stock</th>

            </tr>
        <%
        int count=1;
        while(rs.next())
        {

        %>



            <tr>
                <td><%=count %></td>
                <td><%=rs.getInt("pid") %></td>
                <td><%=rs.getString("category") %></td>
                 <td><%=rs.getString("name") %></td>
                 <td><%=rs.getString("price") %></td>
                 <td><%=rs.getString("stock") %></td>


            </tr>



        <%
         count++;
        }
        %>

        </table></div>
        </form>
      <%
    }
   catch(Exception e){
       out.println(e);
       out.println("Something went wrong !! Please try again");
   }
%>
</div>
</body>

</html>
