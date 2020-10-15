<%--
  Created by IntelliJ IDEA.
  User: 김대현
  Date: 2020-10-16
  Time: 오전 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form name="form1" method="post" action="image-process.jsp" enctype="multipart/form-data">
    <h1>Insert an Image into MySQL Database!</h1>
    <input type="text" name="fname"><br><br>
    <input type="text" name="lname"><br><br>
    <input type="text" name="email"><br><br>
    <input type="file" name="myimg"><br><br>
    <input type="submit" name="submit" value="Submit">
</form>
</body>
</html>





<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert an Image into MySQL Database</title>
</head>
<body>
<%
    Connection conn=null;
    PreparedStatement pstmt = null;
    ResultSet rs=null;
    String url="jdbc:mysql://localhost:3306/test";
    FileInputStream fis=null;
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    String myloc=request.getParameter("myimg");
//out.print("First Name :"+fname+"myloc="+myloc);
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn=DriverManager.getConnection(url, "", "");
        File image= new File(myloc);
        pstmt = conn.prepareStatement("insert into image(firstname, lastname, email,image) " + "values(?,?,?,?)");
        pstmt.setString(1, fname);
        pstmt.setString(2, lname);
        pstmt.setString(4, email);
        fis=new FileInputStream(image);
        pstmt.setBinaryStream(3, (InputStream) fis, (int) (image.length()));
        int count = pstmt.executeUpdate();
        if(count>0)
        {
            out.println("insert successfully");
        }
        else
        {
            out.println("not successfully");
        }
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    finally{
        try{
            if(rs!=null){
                rs.close();
                rs= null;
            }
            if(pstmt !=null)
            {
                pstmt.close();
                pstmt=null;
            }
            if(conn!=null)
            {
                conn.close();
                conn=null;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
