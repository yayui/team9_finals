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
try{
if(!login.equals("ok")){
  response.sendRedirect("index.jsp");
}
else{

    String userid = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,username,password);
    Statement st = con.createStatement();
    ResultSet rs;
    String number = "";
    String sqlname="select * from user where account='"+userid+"'";
    rs = st.executeQuery(sqlname);
    if(rs.next()){
       number = rs.getString("userID");
    }
    String sql="select * from hasPackage b inner join package c on b.packageID = c.packageID where userID='"+number+"'";
  rs = st.executeQuery(sql);
  if(rs.wasNull()){out.println("null");
  }
  if(rs.next()){
    String package_id = rs.getString("packageID");
  }else{
    out.println("查無此資料");
  }
  String sqlcard = "select * from  package a inner join hasCard b on a.packageID = b.packageID inner join card c on b.cardID = c.cardID";
  rs = st.executeQuery(sqlcard);

%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>卡片資訊</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <style>
        .card-header {
            font-size: 20px;
            font-weight: bold;
        }
        .card-image{
          background-color:#CCEEFF;
        }
        .card-stacked{
          background-color:#E8CCFF;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


  </head>
  <body>
  <center>
  <div class="alert alert-warning" role="alert" style="font-size:30px;font-weight:bold;">卡片資訊</div>
  </center>

    <div class="row">
    <%
    if(rs.wasNull()){
      out.println("null");
    }
      while(rs.next()){
      String name = rs.getString("name");
      String type = rs.getString("type");
      String attack = rs.getString("attack");
      String defense = rs.getString("defense");
      String rarity = rs.getString("rarity");
      String effect = rs.getString("effect");
      String photo = rs.getString("photo");
      String ID = rs.getString("ID");

      //out.println("卡片資訊：\n"+ name + "卡片屬性\n" +type + "卡片攻擊\n" + attack + "卡片防禦\n" + defense +
      // "卡片稀有度\n" + rarity + "卡片效果\n" +effect+"圖片\n"+ photo);
    %>
      <div class="col s6">
        <div class="card horizontal">
          <div class="card-image" style="padding:3vh;">
            <img src="images/<%=photo%>" style="width:17vh;height:25vh;">
            </div>
            <div class="card-stacked">
              <div class="card-content">
              <span class="label label-info" style="font-size:20px;"><%=name%></span><br><br>
                <p>屬性：<%=type%></p>
                <p>攻擊力：<%=attack%></p>
                <p>防禦力：<%=defense%></p>
                <p>稀有度：<%=rarity%></p>
                <p>卡片效果：<%=effect%></p>
                <a href="pk.jsp?ID=<%=ID%>&uname=<%=userid%>" class="btn btn-primary btn-lg active" role="button">出戰</a>
              </div>
            </div>
          </div>
        </div>
      <a href="main1.jsp?ID=<%=ID%>&uname=<%=userid%>" class="btn btn-primary btn-lg active" role="button">出戰</a>
    <%
      }
      rs.close();
      st.close();
     } }
     catch(Exception ex){
          out.println(ex);
        }
        %>
    </div>
  </body>
</html>
