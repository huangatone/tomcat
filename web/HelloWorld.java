import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class HelloWorld extends HttpServlet {
 
  private String message;
   /**
     * Connect to the test.db database
     * @return the Connection object
     */
    private Connection connect() {
        // SQLite connection string
        String url = "jdbc:mysql://localhost:3306/myweb?serverTimezone=CTT&useSSL=false&" +
                                   "user=root&password=ski2live";
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
             System.out.println("Connection to SQLite has been established.");  
        } catch (SQLException e) {
            System.out.println(e.getMessage());

        System.exit(0);
        }
System.out.println("Opened database successfully");
        return conn;
    }
    
    
    public void selectAll(){
        String sql = "SELECT * FROM WebUser";
        
        try ( Connection conn = this.connect();
            Statement stmt  = conn.createStatement();
            ResultSet rs    = stmt.executeQuery(sql)){
            
            // loop through the result set
            while (rs.next()) {
                System.out.println(rs.getInt("id") +  "\t" + 
                                   rs.getString("name") + "\t" +
                                   rs.getString("password"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    

  public void init() throws ServletException
  {
     
      message = "Hello World to first test";
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
            throws ServletException, IOException
  {
      // 设置响应内容类型
      response.setContentType("text/html");
      

      // 实际的逻辑是在这里
      PrintWriter out = response.getWriter();
      out.println("<h1>" + message + "</h1>");
      
      String sql = "SELECT * FROM WebUser";
        
        try ( Connection conn = this.connect();
            Statement stmt  = conn.createStatement();
            ResultSet rs    = stmt.executeQuery(sql)){
            
            // loop through the result set
            while (rs.next()) {
                System.out.println(rs.getInt("id") +  "\t" + 
                                   rs.getString("name") + "\t" +
                                   rs.getString("password"));
                
                 out.println("<h1>" + rs.getInt("id") +  "\t" + 
                                   rs.getString("name") + "\t" +
                                   rs.getString("password") + "</h1>");
                
            }

            Enumeration e = request.getHeaderNames();
         while (e.hasMoreElements()) {
            String headerName = (String)e.nextElement();
            String headerValue = request.getHeader(headerName);
            out.println("<tr><td>" + headerName + "</td>");
            out.println("<td>" + headerValue + "</td></tr>");
         }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
      
  }
  
  public void destroy()
  {
      // 什么也不做
  }
}
