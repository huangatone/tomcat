<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.sql.*"%>

<html>

<body>

<%

Class.forName("org.gjt.mm.mysql.Driver").newInstance();

String url ="jdbc:mysql://localhost/tomcat?user=tomcat&password=tomcat&useUnicode=true&charact

erEncoding=utf-8";

Connection conn= DriverManager.getConnection(url);

Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE

);

String sql="select * from tt";

ResultSet rs=stmt.executeQuery(sql);

while(rs.next()){%>

step:<%=rs.getString(1)%>

context:<%=rs.getString(2)%><br><br>

<%}%>

<%out.print("Congratulations!!! JSP connect MYSQL IS OK!!");%>

<%rs.close();

stmt.close();

conn.close();

> 

</body>

</html>