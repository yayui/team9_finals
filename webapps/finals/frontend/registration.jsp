<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%


String username = "team9";
String password = "NCHUTeam9!";
String database = "team9";
String url = "jdbc:mysql://140.120.49.205/" + database + "?useUnicode=true&characterEncoding=big5";
  //建立一個聯結物件
  Connection con;
   //建立PreparedStatement物件
   PreparedStatement pstmt = null;
   String userid = request.getParameter("uname");
   String pwd = request.getParameter("pass");
   String name = request.getParameter("name");
   %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>遊戲王註冊驗證</title>
    <link rel='stylesheet' href='css/semantic.css'>
    <style>
      body {
        background-image: url("images/change.jpg");
        background-size: 100%;
      }
    </style>
  </head>
  <body>

   <div class="login" id="regis_result"><% try{
       //定義驅動程式與資料來源之間的連結
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       //建立一個聯結物件
       con = DriverManager.getConnection(url,username,password);
       Statement stat = con.createStatement();
       ResultSet rs;
       String sql_query = "select * from user where account='"+userid+"'";
       rs = stat.executeQuery(sql_query);

       if(rs.next()){
         out.println("<div class='ui segments' style='left:38%;top:20px;width:22%;'>");
         out.println("<div class='ui segment' style='background-color:#ffff7c;'>");
         out.println("<p style='font-size:25px;'>此帳號已被使用過了</p>");
         out.println("</div>");
         out.println("<div class='ui segments'>");
         out.println("<div class='ui segment' style='background-color:#FFFFAA;'>");
         out.println("<a href='reg.jsp' style='font-size:25px;'>重新註冊</a>");
         out.println("</div>");
         out.println("</div>");
       }else{
       String sql = "insert into user(account, password, name, money) values('"+ userid + "', '"+pwd+ "', '"+name+"','1000000')";
       int i = stat.executeUpdate(sql);

       if (i > 0) {
         session.setAttribute("userid", userid);

         out.println("<div class='ui segments' style='left:38%;top:20px;width:22%;'>");
         out.println("<div class='ui segment' style='background-color:#ffff7c;'>");
         out.println("<p style='font-size:25px;'>Registration Successfull!</p>");
         out.println("</div>");
         out.println("<div class='ui segments'>");
         out.println("<div class='ui segment' style='background-color:#FFFFAA;'>");
         out.println("<a href='index.jsp' style='font-size:25px;'>Go to Login</a>");
         out.println("</div>");
         out.println("</div>");
       } else {
           response.sendRedirect("index.jsp");
       }
     }


       //stat.executeUpdate(sql_insert);
     }catch(SQLException sqle){
       out.println("SQL Exception : " + sqle);
     }
     %></div>
   </body>
</html>
