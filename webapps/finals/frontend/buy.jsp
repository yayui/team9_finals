<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
String username = "team9";
String password = "NCHUTeam9!";
String database = "team9";
String url = "jdbc:mysql://140.120.49.205/" + database + "?useUnicode=true&characterEncoding=big5";
String login = (String)session.getAttribute("login");
String userid = request.getParameter("uname");
String pwd = request.getParameter("pass");
String ID = request.getParameter("ID");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url,username,password);
Statement st = con.createStatement();
ResultSet rs;
String price ="";
String packageID="";
String role="";
String money="";
String number="";
//out.println(userid);

try{
if(!login.equals("ok")){
  response.sendRedirect("index.jsp");
}
else{


    String sql="select * from shop where ID="+ID;
    rs = st.executeQuery(sql);
    if(rs.next()){
      price = rs.getString("price");
      packageID = rs.getString("packageID");
      role = rs.getString("roleID");

    }else{
      out.println("查無此資料");
    }
    String sqluser="select * from user where account="+userid;
    rs = st.executeQuery(sqluser);
    if(rs.next()){
       money = rs.getString("money");
       number = rs.getString("userID");
       out.println(number);

    }else{
      out.println("查無此資料");
    }
    int a = Integer.parseInt(money);
    int b = Integer.parseInt(price);
    if(a>b){
    a=a-b;
    money = Integer.toString(a);

       String sqlmoney="update user set money ='"+money+"' where userID="+number;
       int k = st.executeUpdate(sqlmoney);
      if(packageID!=null){
        String sqlcard = "insert into hasPackage(packageID, userID) values('"+ packageID + "','"+number+"')";
        int i = st.executeUpdate(sqlcard);
      }else{
        String sqlrole = "insert into hasRole(roleID , userID) values('"+ role + "', '"+number+"')";
        int j= st.executeUpdate(sqlrole);
      }

    response.sendRedirect("main1.jsp?uname="+userid);
  }else{
out.println("you don't have enough money");
%>
<a href='main1.jsp?uname=<%=userid%>'>返回</a>
<%
      }
      // response.sendRedirect("main1.jsp?uname="+userid);
     }
}catch(Exception ex){
  out.println(ex);
}
  %>
