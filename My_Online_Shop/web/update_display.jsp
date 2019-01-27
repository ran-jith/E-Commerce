<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>
<%@ page import ="java.sql.*" %>
<jsp:setProperty property="*" name="obj"/>
<html>
<head>
  <title>Update</title>
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
     <li class="dropdown">
       <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories
       <span class="caret"></span></a>
       <ul class="dropdown-menu">
         <li><a href="#">Sports</a></li>
         <li><a href="#">Electronics</a></li>
         <li><a href="#">Home Appliance</a></li>
       </ul>
     </li>
     <li><a href="mycart.jsp">View Cart</a></li>
     <li class="active"><a href="myorder.jsp" class="active">My Orders</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
    <form class="navbar-form navbar-left" action="/action_page.php">
   <div class="input-group">
   <input type="text" class="form-control" placeholder="Search">
   <div class="input-group-btn">
     <button class="btn btn-default" type="submit">
       <i class="glyphicon glyphicon-search"></i>
     </button>
   </div>
 </div>
</form>
 </div>
</nav>

<%







    try{
        String item = request.getParameter("pid");
        String redirectURL;
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");
        PreparedStatement pst = conn.prepareStatement("Select * from product where pid=?");
        pst.setString(1, item);
        ResultSet rs = pst.executeQuery();

        int count=1;
        while(rs.next())
        {%>


<div class="container">
            <h2>Update Product</h2>
             <form class="form-horizontal" action="Updated" method="post">

                 <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Product Id:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="bid" value="<%=rs.getInt("pid")%>" name="pid" readonly>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-sm-2" for="bookname">Product Name:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="email" value="<%=rs.getString("name")%>" name="pname">
                </div>
                </div>
                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Category:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd" value="<%=rs.getString("category")%>" name="cat">
                </div>
              </div>
                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Image Name:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd" value="<%=rs.getString("image")%>" name="img">
                </div>
              </div>
                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Description:  </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd" value="<%=rs.getString("description")%>" name="desc">
                </div></div>
                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Price: </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd" value="<%=rs.getInt("price")%>" name="price">
                </div></div>

                <div class="form-group">
                <label class="control-label col-sm-2" for="authorname">Stockes:  </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="pwd" value="<%=rs.getInt("stock")%>" name="stock">
                </div>
              </div>
              </div><br>
                <input type="submit" align="center" class="btn btn-danger btn-lg" value="Delete" onclick="form.action='delete_product.jsp';">
               <input type="submit"  class="btn btn-primary btn-lg"value="Update" onclick="form.action='updated.jsp';">
             </form>
            <%

                }
                if (count == 0) {
            %>
                    <b>Something went wrong..</b>

            <%            }
            %>






<%    }
   catch(Exception e){
       out.println(e);
       out.println("Something went wrong !! Please try again");
   }
%>
</div>
</body>

</html>
