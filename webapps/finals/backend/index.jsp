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
    String number = "";
     String acc = "";
     String pass = "";
     String name = "";
     String money = "";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,username,password);
    Statement st = con.createStatement();
    ResultSet rs;
    String sqlname="select * from user";
    rs = st.executeQuery(sqlname);


%>

<!DOCTYPE html>
<html lang="zh-hant">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title></title>
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <!-- Optional theme -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
      <!-- Latest compiled and minified JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </head>

  <body>
    <div class="text-center">
    <div class="alert alert-info" role="alert"
    style="font-family:Microsoft JhengHei; font-size:18pt;">遊戲王後台管理系統</span></div>
    </div>

    <div class="panel panel-primary">
      <!-- Default panel contents -->
      <div class="panel-heading">後台管理</div>
      <div class="panel-body">
        <p>下表為使用者資料</p>
      </div>

      <table class="table">
        <tr class="warning">
          <th>id</th>
          <th>帳號</th>
          <th>密碼</th>
          <th>玩家名稱</th>
          <th>金錢</th>
          <th>刪除資料</th>
        </tr>
    <%
    while(rs.next()){
        number = rs.getString("userID");
        acc = rs.getString("account");
        pass = rs.getString("password");
        name = rs.getString("name");
        money = rs.getString("money");
      %>
    <form>
      <tr>
        <td class="warning"><%=number%></td>
        <td class="success"><%=acc%></td>
        <td class="danger"><%=pass%></td>
        <td class="info"><%=name%></td>
        <td class="active"><%=money%></td>
        <td class="success"><a href="delete.jsp?userID=<%=number%>" class="btn btn-primary btn-lg active" role="button">刪除</a></td>
      </tr>
    </form>
    <%}%>
    </table>
    </div>
  <%
      rs.close();
      st.close();
  %>
  </body>
  </html>
