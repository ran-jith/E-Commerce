  <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>



<html>
<head>
  <title>My_Shop</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link href="style/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mainscreen">
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
   <div class="navbar-header">
     <a class="navbar-brand" href="#">Buy-It</a>
   </div>
   <ul class="nav navbar-nav">
     <li class="active"><a href="admin_dashboard.jsp">Admin Home</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
 </div>
</nav>
<!-----------------------begin jsp----------------------->
<%
  try{
        Connection conn = null;
        String jsrch = request.getParameter("srch");
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "ecom";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "password123";
        Statement st;
        int count  = 0;

            Class.forName(driver).newInstance();

            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Connected!");
            String query = "select *from product";
           // String query2 = "select *from product where name='"+jsrch+"'";
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            String img = "";





          conn.close();
        } catch (ClassNotFoundException e){
        //| IllegalAccessException | InstantiationException | SQLException e)
            System.out.print(e);
            e.printStackTrace();
        }

%>
<center>
  <br><br><br>
<button onclick="window.location.href='view_order.jsp'"   class="btnh">&nbsp&nbsp&nbspView Orders&nbsp&nbsp&nbsp</button><br>
<button onclick="window.location.href='view_user.jsp'"  class="btnh">&nbsp&nbsp&nbspView Users&nbsp&nbsp&nbsp&nbsp</button><br>
<button onclick="window.location.href='view_product.jsp'"  class="btnh">&nbspView &nbspProducts&nbsp</button><br>
<button onclick="window.location.href='update_product.jsp'"  class="btnh">Update Products</button><br>
<button onclick="window.location.href='add_product.jsp'"  class="btnh">&nbsp&nbsp&nbspAdd Products&nbsp&nbsp</button><br>
</center>
</body>
</div>
</html>
