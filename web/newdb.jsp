<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.sql.*"%>

<html>

<body>

<%


String url ="jdbc:mysql://http://10.211.55.14:3306/myweb?serverTimezone=CTT&useSSL=false&" +
                                   "user=rong&password=ski2live";

Connection conn= DriverManager.getConnection(url);

Statement stmt=conn.createStatement();

String sql="SELECT * FROM WebUser";

ResultSet rs    = stmt.executeQuery(sql);
while(rs.next()){%>

step:<%=rs.getString(1)%>

context:<%=rs.getString(2)%><br><br>

<%}%>

<%out.print("Congratulations!!! JSP connect MYSQL IS OK!!");%>

<%
stmt.close();

conn.close();

%> 

</body>

</html>
