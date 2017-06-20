<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
String username = "team9";
String password = "NCHUTeam9!";
String database = "team9";
String url = "jdbc:mysql://140.120.49.205/" + database + "?useUnicode=true&characterEncoding=big5";
String login = (String)session.getAttribute("login");

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
    String productID = "";
String sqlcard = "select * from shop a inner join package b on a.packageID=b.packageID";
rs = st.executeQuery(sqlcard);
if(rs.wasNull()){
  out.println("null");
}
  while(rs.next()){
  String id = rs.getString("packageID");
  String lvl = rs.getString("level");
  String price=rs.getString("price");
  productID = rs.getString("ID");
%>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
      <title>遊戲王商城</title>
      <link rel='stylesheet' href='css/semantic.css'>
      <style>
        body {
          background-image: url("images/store.jpg");
          background-size: 100%;
          color:#FF8EFF;
        }
        #store_card1 {
          position:absolute;
          left:13%;
          top:5%;
        }
        #store_card2 {
          position:absolute;
          left:29%;
          top:5%;
        }
        #store_role3 {
          position:absolute;
          left:2%;
          top:30%;
        }
        #store_role4 {
          position:absolute;
          left:20%;
          top:30%;
        }
        #store_role5 {
          position:absolute;
          left:38%;
          top:30%;
        }
        #store_role6 {
          position:absolute;
          left:11%;
          top:55%;
        }
        #store_role7 {
          position:absolute;
          left:29%;
          top:55%;
        }
      </style>
    </head>
    <body>

     <div id="store_card<%=productID%>">
       <div class="ui cards">
         <div class="card" style="width:170px;">
           <div class="content">
             <div class="header" style="width:170px;font-size:17px;">
  <%
  // out.println(productID);

  out.println("卡包等級"+lvl+"卡包價錢"+price);
  %>
            </div>
          </div>
          <input type="button" onclick="window.open('buy.jsp?ID=<%=productID%>&uname=<%=userid%>','_self')" value="購買" class="ui bottom attached button" style="width:170px;"/>
        </div>
      </div>
    </div>
  <%
}
String sqlrole = "select * from shop a inner join role b on a.roleID=b.roleID";
rs = st.executeQuery(sqlrole);
if(rs.wasNull()){
  out.println("null");
}
  while(rs.next()){
  String rolename = rs.getString("name");
  String HP = rs.getString("HP");
  String pricerole = rs.getString("price");
  String roleID = rs.getString("ID");
%>
  <div id="store_role<%=roleID%>">
    <div class="ui cards">
      <div class="card" style="width:180px;">
        <div class="content">
          <div class="header" style="width:170px;font-size:17px;">

<%
out.println("角色名稱"+rolename+"角色血量"+HP+"角色價錢"+pricerole);
%>
          </div>
        </div>
        <input type="button" onclick="window.open('buy.jsp?ID=<%=roleID%>&uname=<%=userid%>','_self')" value="購買" class="ui bottom attached button" style="width:180px;"/>
      </div>
    </div>
  </div>
<%
}
}
  }catch(Exception ex){
    out.println(ex);
  }
  %>
</body>
</html>
