<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mybean.getuser"%>
<jsp:useBean id="obj" class="mybean.getuser"/>
<%@ page import ="java.sql.*" %>
<jsp:setProperty property="*" name="obj"/>




<html>
<head>
  <title>product details</title>
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
     <li class="active"><a href="user_dashboard.jsp">Home</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
 </div>
</nav>


<%
    try{
        /*String username = request.getParameter("username");
        String password = request.getParameter("password");
        String redirectURL;*/
        if (request.getParameter("submit") != null) {
            String item= request.getParameter("pid");
            Class.forName("com.mysql.jdbc.Driver");
              Statement st;
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","password123");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?" + "user=root&password=password123");
            String query = "select *from product where pid='"+item+"'";
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while(rs.next()){%>
              <center>
              <div class="span3 top1">
                     <div class="row">
                       <div class="span3 food1">
                           <img src="<%=rs.getString("image")%>.jpeg" alt="">
                       </div>
                     </div>
                         <div class="row">
                           <div class="span3 name1">
                           <p><b><%=rs.getString("name") %></b></p>
                         </div>
                         </div>
                       <div class="row">
                            <form method="post" action="tocart.jsp">

                           <div class="span3 description1">
                          <br> <p>Category: <b><%=rs.getString("category") %></b></p>
                           <p>Price: <b><%=rs.getString("price") %></b></p>
                           <p>Description: <b><%=rs.getString("description") %></b></p>
                           <input type="hidden" name="pid" value="<%=rs.getString("pid") %>">
                           <input type="submit" class="btn btn-success btn-lg" name="submit" value="Add to Cart">
                           <input type="submit" class="btn btn-success btn-lg" value="Buy Now">
                           </form>

                         </div>
                         </div>
                   </div>
</center>

            <%}

        }


   }
   catch(Exception e){
       out.println(e);
       out.println("Something went wrong !! Please try again");
   }
%>
