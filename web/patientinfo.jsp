<%--<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
    try{
        String button = request.getParameter("btn");
        
    if(button !=null && button.equals("Register") )
    {
      
    String name = request.getParameter("pname");
    String date = request.getParameter("dob");
    String age = request.getParameter("age");
    String gender= request.getParameter("gender");
    String city = request.getParameter("city");
    String contact = request.getParameter("contact");
    String visits = request.getParameter("visit");
    String token = request.getParameter("token");

        Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient_info","root","root");
            PreparedStatement st = con.prepareStatement("insert into patienttab values(?,?,?,?,?,?,?,?)");
            st.setString(1,name);
            st.setString(2,date);
            st.setString(3,age);
            st.setString(4,gender);
            st.setString(5,city);
            st.setString(6,contact);
            st.setString(7,visits);
            st.setString(8,token);
            st.executeUpdate();
            out.println("<script>alert('Record inserted';)</script>");
//            response.sendRedirect("index.html");
            session.setAttribute("contact",contact);
            session.setAttribute("token",token);
            session.setAttribute("dob",date);
            response.sendRedirect("Sendsms1");
   
    }
    }catch(Exception ex){
    ex.printStackTrace();
    }
     
    
    
%>--%>
<%
    try{
        String button = request.getParameter("btn");
        
    if(button !=null && button.equals("Register") )
    {
     String contact = request.getParameter("contact");
    session.setAttribute("contact",contact);
//            session.setAttribute("token",token);
//            session.setAttribute("dob",date);
            response.sendRedirect("Sendsms1");
    }
    }catch(Exception ex){
    ex.printStackTrace();
    }
    %>
<%--
<%
  response.setHeader("Pragma","no-Cache");
//    response.setHeader("Pragma","no-Cache");
     response.setHeader("Cache-Control","no-cache, no-Store, must-revalidate");
//      String value = (String)session.getAttribute("CALL");
      if(session.getAttribute("CALL")==null)
      {
          response.sendRedirect("index.jsp");
      }
//       if(value==null)
//      {
//          response.sendRedirect("index.jsp");
//      }
 %>--%>


<html>
<head>
<title>Patient Info</title>
<style>
input[type=text], input[type=datetime-local] ,input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
body {
  font-family: Arial, Helvetica, sans-serif;

}



h1{
text-align: center;
}

.container {
  padding: 16px;
  align-content: center;
  width: 600px;
  height: 300px;
  border:groove; 
  margin-left: 470px;
  
}

.registerbtn:hover {
  opacity:1;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  
}

li {
  float: right;
}
li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
li a:hover {
  /*background-color: ;*/
}
</style>
</head>
<body>
    <ul>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
    <form method="post">
<div class="container">
<h1>Dr. Kapil Kochhar Clinic</h1>
<!--<b>Patient Name</b><br>
<input type="text" placeholder="Enter name here" name="pname" required><br>
<b>Date and time of appointment</b><br>
<input type="datetime-local" placeholder="Enter date and time of visit" name="dob" required><br>
<b>Age</b><br>
<input type="number" placeholder="Enter age" name="age" required><br>
<b>Gender</b><br>
<input type="radio" id="male" name="gender" value="male">
  <label for="male">Male</label><br>
  <input type="radio" id="female" name="gender" value="female">
  <label for="female">Female</label><br>
  <input type="radio" id="other" name="gender" value="other">
  <label for="other">Other</label><br><br>
<b>City</b><br>
<input type="text" placeholder="Enter city" name="city" required><br>
--><b>Contact</b><br>
<input type="text" placeholder="Enter contact number" name="contact" required><br><!--
<b>Number of visits</b><br>
<input type="number" placeholder="Enter number of visits by the patient" name="visit" required><br>
<b>Token number</b><br>
<input type="number" placeholder="Give token number to patient" name="token" required><br>-->

<button type="submit" class="registerbtn" name="btn" value="Register">Send Message</button>
</div>
</form>

</body>
</html>