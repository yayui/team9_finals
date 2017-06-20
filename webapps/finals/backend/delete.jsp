<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
String username = "team9";
String password = "NCHUTeam9!";
String database = "team9";
String url = "jdbc:mysql://140.120.49.205/" + database + "?useUnicode=true&characterEncoding=big5";
String login = (String)session.getAttribute("login");
// String uname = "account";//column in database
// String pass = "passord";//column in database
    String number = request.getParameter("userID");
    //
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,username,password);
    Statement st = con.createStatement();
    String sqlname="delete from user where userID="+number;
    int i= st.executeUpdate(sqlname);
    response.sendRedirect("index.jsp");

      st.close();

%>
