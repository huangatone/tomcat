<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.sql.*"%>

<html>

<body>

<%


String url ="jdbc:mysql://localhost/myweb?user=root&password=ski2live&useUnicode=true&characterEncoding=utf-8";

Connection conn= DriverManager.getConnection(url);

Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE

);

String sql="select * from tt";

ResultSet rs=stmt.executeQuery(sql);

%>


<%out.print("Congratulations!!! JSP connect MYSQL IS OK!!");%>

<%rs.close();

stmt.close();

conn.close();

%> 

</body>

</html>
