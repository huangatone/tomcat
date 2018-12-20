  <br/><br/>
      <center>
         <p>Copyright © 2010</p>
         <%
         out.println("Your IP address is " + request.getRemoteAddr());
      %>

 <p>Today's date: <%= (new java.util.Date()).toLocaleString()%></p>
 
      </center>
   </body>
</html>