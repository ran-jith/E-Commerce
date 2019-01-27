<%@page import="mybean.register"%>  
    <jsp:useBean id="obj" class="mybean.users"/>
    <%@ page import ="java.sql.*" %>

    <jsp:setProperty property="*" name="obj"/>

    <%
    int status=register.register(obj);
    String redirectURL="";
    if(status>0)
        redirectURL = "signin.jsp";
        response.sendRedirect(redirectURL);

    %>
