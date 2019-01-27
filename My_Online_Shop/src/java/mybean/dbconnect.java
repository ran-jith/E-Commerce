package mybean;
import java.sql.*;   
import java.util.logging.Level;
import java.util.logging.Logger;
  
public class dbconnect {  
private static Connection conn=null; 
static String driver="com.mysql.jdbc.Driver";
static String url="jdbc:mysql://localhost:3306/ecom";
static String username="root";
static String password="password123";

static{  
try{  
Class.forName(driver);  
conn=DriverManager.getConnection(url,username,password);  
}

catch(SQLException e){} catch (ClassNotFoundException ex) {  
        Logger.getLogger(dbconnect.class.getName()).log(Level.SEVERE, null, ex);
    }  
}  
  
public static Connection getCon(){  
    return conn;  
}  
  
}