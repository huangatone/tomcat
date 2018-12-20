<html>
   
   <head>
      <title>Using JavaBeans in JSP</title>
   </head>
   
   <body>
      <center>
         <h2>Using JavaBeans in JSP</h2>
         <jsp:useBean id = "test" class = "action.TestBean" />
         <jsp:setProperty name = "test"  property = "message" 
            value = "Hello JSP. From Mac.." />
            
         <p>Got message....</p>
         <jsp:getProperty name = "test" property = "message" />

         <%
            // Set refresh, autoload time as 5 seconds
            response.setIntHeader("Refresh", 5); %>
      </center>
   </body>
</html>