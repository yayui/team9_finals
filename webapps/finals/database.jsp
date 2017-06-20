<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
String user = "4104029011";
String pass = "Ss4104029011!";
String database = "4104029011";
String url = "jdbc:mysql://140.120.49.205/" + database + "?useUnicode=true&characterEncoding=big5";
//建立一個聯結物件
Connection con;
//建立PreparedStatement物件
PreparedStatement pstmt = null;
String name= request.getParameter("username");
try{
   //定義驅動程式與資料來源之間的連結
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   //建立一個聯結物件
   con = DriverManager.getConnection(url,user,pass);
   Statement stat = con.createStatement();
   ResultSet rs;
   String sql_query = "select * from homework where uname='"+name+"'";
   rs = stat.executeQuery(sql_query);
   }catch(SQLException sqle){
   out.println("sqle");
   }
