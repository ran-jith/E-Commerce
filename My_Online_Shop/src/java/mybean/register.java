package mybean;
import java.sql.*;  
  
public class register {  
  
public static int register(users u){  
int status=0;  
try{  
Connection con=dbconnect.getCon();  
PreparedStatement ps=con.prepareStatement("insert into users(f_name,l_name,email,u_name,passwd) values(?,?,?,?,?)");  
ps.setString(1,u.getfname());  
ps.setString(2,u.getlname());  
ps.setString(3,u.getemail());
ps.setString(4,u.getuname());
ps.setString(5,u.getpasswd());
              
status=ps.executeUpdate();  
}catch(Exception e){}  
      
return status;  
}  
  
}  
