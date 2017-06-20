<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%


String username = "team9";
String password = "NCHUTeam9!";
String database = "team9";
String url = "jdbc:mysql://140.120.49.205/" + database + "?useUnicode=true&characterEncoding=big5";
// String uname = "account";//column in database
// String pass = "passord";//column in database


    String userid = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,username,password);
    Statement st = con.createStatement();
    ResultSet rs;
    String sql = "select * from user where account='"+userid+"' and password='" + pwd +"'";
    rs = st.executeQuery(sql);
    if (rs.next()) {
        session.setAttribute("login" , "ok");
        session.setAttribute("account", userid);%>
        <div><%out.println("welcome " + userid);%></div>
        <% response.sendRedirect("main1.jsp?uname="+userid);

        %>
  <%  } else {
        %><div><center><%out.println("Invalid username or password <a href='index.jsp'>try again</a>");
        %></center></div><%
    }%>
<%

    st.close();
    rs.close();
    con.close();
%>
