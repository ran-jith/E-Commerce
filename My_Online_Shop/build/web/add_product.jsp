<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>
<%@ page import ="java.sql.*" %>
<jsp:setProperty property="*" name="obj"/>
<html>
<head>
  <title>Add Product</title>
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
<div class="container">
            <center>
             <form class="form-horizontal" action="Updated" method="post">
              <div class="form-group">
                <h1>Add Product</h1><br>
                <label class="control-label col-sm-2" for="bookname">Product Name:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="email"  name="pname">
                </div>
                </div>
                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Category:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd"  name="cat">
                </div>
              </div>
                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Image Name:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd"  name="img">
                </div>
              </div>
                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Description:  </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd"  name="desc">
                </div></div>
                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Price: </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd"  name="price">
                </div></div>

                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Stockes:  </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd"  name="stock">
                </div>
              </div>
                 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="submit"  class="btn btn-primary btn-lg"value="Add Product" onclick="form.action='add_product.jsp';">
             </div></form></center>

           <%
    try{
        String redirectURL;
        Statement st;
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");

            String jname = request.getParameter("pname");
            String jcat = request.getParameter("cat");
            String jimg = request.getParameter("img");
            String jdesc = request.getParameter("desc");
            String jprice = request.getParameter("price");
            String jstock = request.getParameter("stock");
            String query = "insert into product(category,name,image,description,price,stock) values('"+jcat+"','"+jname+"','"+jimg+"','"+jdesc+"','"+jprice+"','"+jstock+"');";
            st = conn.createStatement();
            st.executeUpdate(query);
            out.print(jprice);
            response.sendRedirect("view_product.jsp");
            conn.close();
        } catch (Exception e){
                //| IllegalAccessException | InstantiationException | SQLException e) {
            //out.print(e);
            e.printStackTrace();
        }
%>
</div>
</body>

</html>
