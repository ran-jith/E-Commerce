package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import mybean.dbconnect;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <title>Bootstrap Example</title>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("   <link href=\"style/style.css\" type=\"text/css\" rel=\"stylesheet\" />\n");
      out.write("</head>\n");
      out.write("<div class=\"mainscreen\">\n");
      out.write("<body>\n");
      out.write("<!-------------navigatio-->\n");
      out.write("<nav class=\"navbar navbar-inverse\">\n");
      out.write(" <div class=\"container-fluid\">\n");
      out.write("   <div class=\"navbar-header\">\n");
      out.write("     <a class=\"navbar-brand\" href=\"#\">Buy-It</a>\n");
      out.write("   </div>\n");
      out.write("   <ul class=\"nav navbar-nav\">\n");
      out.write("     <li class=\"active\"><a href=\"#\">Home</a></li>\n");
      out.write("     <li class=\"dropdown\">\n");
      out.write("       <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Categories\n");
      out.write("       <span class=\"caret\"></span></a>\n");
      out.write("       <ul class=\"dropdown-menu\">\n");
      out.write("         <li><a href=\"#\">Sports</a></li>\n");
      out.write("         <li><a href=\"#\">Electronics</a></li>\n");
      out.write("         <li><a href=\"#\">Home Appliance</a></li>\n");
      out.write("       </ul>\n");
      out.write("     </li>\n");
      out.write("   </ul>\n");
      out.write("   <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("      <li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li>\n");
      out.write("      <li><a href=\"#\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <form class=\"navbar-form navbar-left\" action=\"/action_page.php\">\n");
      out.write("   <div class=\"input-group\">\n");
      out.write("   <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\n");
      out.write("   <div class=\"input-group-btn\">\n");
      out.write("     <button class=\"btn btn-default\" type=\"submit\">\n");
      out.write("       <i class=\"glyphicon glyphicon-search\"></i>\n");
      out.write("     </button>\n");
      out.write("   </div>\n");
      out.write(" </div>\n");
      out.write("</form>\n");
      out.write(" </div>\n");
      out.write("</nav>\n");
      out.write("<!----------------------end-navigation------------------>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-----------------------begin jsp----------------------->\n");

        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "ecom";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "password123";
        Statement st;
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Connected!");
            String query = "select *from product";
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            //out.println("Successfully inserted");

            while(rs.next()){
              
      out.write("\n");
      out.write("\n");
      out.write("<!-------------------------table---------------->\n");
      out.write("\n");
      out.write("<table class=\"table table-striped table-dark\">\n");
      out.write("  <thead>\n");
      out.write("    <tr>\n");
      out.write("      <th scope=\"col\">#</th>\n");
      out.write("      <th scope=\"col\">First</th>\n");
      out.write("      <th scope=\"col\">Last</th>\n");
      out.write("      <th scope=\"col\">Handle</th>\n");
      out.write("    </tr>\n");
      out.write("  </thead>\n");
      out.write("  <tbody>\n");
      out.write("    <tr>\n");
      out.write("      <th scope=\"row\">1</th>\n");
      out.write("      <td>Mark</td>\n");
      out.write("      <td>Otto</td>\n");
      out.write("      <td>@mdo</td>\n");
      out.write("    </tr>\n");
      out.write("  </tbody>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");
}
            conn.close();
        } catch (ClassNotFoundException e){
        //| IllegalAccessException | InstantiationException | SQLException e) {
            System.out.print(e);
            e.printStackTrace();
        }
    }

      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</div>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
