<%--
    Document   : signup
    Created on : 25 Nov, 2018, 8:17:43 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
  <title>Signin</title>
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
     <li class=""><a href="index.jsp">Home</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
      <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li class="active"><a href="signin.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
 </div>
</nav>
<!----------------------end-navigation------------------>
<div class="span3">
  <center>
    <form class="form-horizontal" action="validate.jsp" method="post">
     <div class="form-group">
       <h1>Log In Here</h1><br><br><br><br>
       <label class="control-label col-sm-2" for="bookname">User Name:</label>
       <div class="col-sm-5">
           <input type="text" class="form-control" id="email"  name="uname">
       </div>
       </div>
       <div class="form-group">
       <label class="control-label col-sm-2" for="authorname">Password:</label>
       <div class="col-sm-5">
           <input type="password" class="form-control" id="pwd"  name="passwd">
       </div>
     </div>
             &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="submit"  class="btn btn-primary btn-lg"value="Log In" onclick="form.action='validate.jsp';">
                      </div></form>
  </center>
</div>

</body>
</div>
</html>
