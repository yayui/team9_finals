<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
String username = "team9";
String password = "NCHUTeam9!";
String database = "team9";
String url = "jdbc:mysql://140.120.49.205/" + database + "?useUnicode=true&characterEncoding=big5";
String uname = "uname";//column in database
String pass = "pass";//column in database
String userid = request.getParameter("uname");
String pwd = request.getParameter("pass");


%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
      <title>遊戲王主畫面</title>
      <link rel='stylesheet' href='css/semantic.css'>
      <link href="css/bootstrap.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="js/bootstrap.js"></script>
      <script src="js/semantic.js"></script>

      <style>
        body {
          background-image: url("images/main1.jpg");
          background-size: 100%;
          z-index: 0;
        }
        #f_main_buttons {

          float:left;
          position:fixed;
          left:10%;
          top:10%;
          background-size: 100%;
          z-index: 100;
        }
        .data {
          padding:10px;
          margin: 20px;
        }
        .data img {
          float: left;
          width: 60px;
          height: 60px;
          margin-top: -2vh;
          margin-left: -2vh;
        }
      </style>
    </head>
    <body>
      <div id="f_main_buttons">
        <table>
          <center>
            <h1 id='' style="color:white">選單</h1>
            <input type="button" style="width:150px;height:60px;font-size:25px;" onclick="window.open('card.jsp?uname=<%=userid%>','_self')" value="對戰" class="ui inverted teal button"/>
            <input type="button" style="width:150px;height:60px;font-size:25px;" onclick="showdata('card')" value="卡片" class="ui inverted teal button" data-toggle="modal" data-target="#achieve"/></br></br>
            <input type="button" style="width:150px;height:60px;font-size:25px;" onclick="showdata('achieve')" value="成就" class="ui inverted teal button" data-toggle="modal" data-target="#achieve" />
            <input type="button" style="width:150px;height:60px;font-size:25px;" onclick="showdata('person')" value="個人" class="ui inverted teal button" data-toggle="modal" data-target="#achieve" /></br></br>
            <input type="button" style="width:150px;height:60px;font-size:25px;" onclick="window.open('card.jsp?uname=<%=userid%>','_self')" value="詳細" class="ui inverted teal button"/>
            <input type="button" style="width:150px;height:60px;font-size:25px;" onclick="window.open('store.jsp?uname=<%=userid%>','_self')" value="商城" class="ui inverted teal button" /></br></br>
            <input type="button" style="width:100px;height:40px;" onclick="window.open('logout.jsp','_self')" value="登出" class="ui inverted white button"/>
          </center>
        </table>
      </div>
      <div class="modal fade" id="achieve" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content" style="background-color: #dbf3f7;width:660px;height:500px;">
               <div class="modal-header">
                  <button type="button" class="close"
                     data-dismiss="modal" aria-hidden="true">
                        &times;
                  </button>
                  <h4 class="modal-title" id="myModalLabel">

                  </h4>
               </div>
               <div class="modal-body" style="overflow-x:hidden;overflow-y:scroll;height:420px;">
                 <%-- <div class="data">
                   <img src="images/cup.png" alt="">
                   <p>初心者</p>
                   <p>戰鬥達到五場</p>
                 </div>
                 <div class="data">
                   <img src="images/cup.png" alt="">
                   <p>戰鬥家</p>
                   <p>戰鬥達到十場</p>
                 </div>
                 <div class="data">
                   <img src="images/cup.png" alt="">
                   <p>戰鬥達人</p>
                   <p>戰鬥達到十五場</p>
                 </div>
                 <div class="data">
                   <img src="images/cup.png" alt="">
                   <p>戰鬥高手</p>
                   <p>戰鬥達到二十場</p>
                 </div>
                 <div class="data">
                   <img src="images/cup.png" alt="">
                   <p>戰神</p>
                   <p>戰鬥達到三十場</p>
                 </div> --%>
               </div>

            </div><!-- /.modal-content -->
      </div><!-- /.modal -->
    <script type="text/javascript">
      $.ajax({
        url: 'http://localhost:8080/frontend/card1.jsp',
        // url: 'data.json',
        type:"GET",
        dataType:'json',
        success: function(result){
            console.log(result);
            for(var i = 0 ; i < result.length ; i++)
            {
                $('body').append(
                  "<div id='result'>" +
                    "卡片名稱：" + result[i].name + "<br/>" +
                    "卡片屬性：" + result[i].type + "<br/>" +
                    "攻擊力：" + result[i].attack + "<br/>" +
                    "防禦力：" + result[i].defense+ "<br/>" +
                    "稀有度：" + result[i].rarity + "<br/>" +
                    "效果：" + result[i].effect + "<br/>" +
                    "圖片：" + result[i].photo + "<br/>" +
                  "</div>"
                );
            }
        },
        error:function(xhr, ajaxOptions, thrownError){
            console.log(xhr.status);
        }
      });

      function showdata(classdata){
        // $('.modal-title').html('');
        switch(classdata) {
          case 'achieve':
            console.log(classdata);
            $('.modal-body').empty();
            $('.modal-title').html("成就");
            <%
            Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection(url,username,password);
              Statement st = con.createStatement();
              ResultSet rs;
            String login = (String)session.getAttribute("login");
            try{
              if(login == null){
                response.sendRedirect("index.jsp");
              }
              else{
                Class.forName("com.mysql.jdbc.Driver");
                String number = "";
                String sqlname="select * from user where account='"+userid+"'";
                rs = st.executeQuery(sqlname);
                if(rs.next()){
                   number = rs.getString("userID");
                }
                String sql="select * from  hasAchieve b inner join achieve c on b.achieveID = c.achieveID where userID="+number;
                rs = st.executeQuery(sql);
                if(rs != null){
                  while(rs.next()){
                    String PK = rs.getString("PKnumber");
                    String reward = rs.getString("reward");
                  %>

                    $('.modal-body').append(
                      "<div class='data'>" +
                      "<img src='images/cup.png' >" +
                      "<p>戰鬥次數達到<%=PK%>場</p>" +
                      "<p><%=reward%></p></div>"
                    );
            <%
                }}else{
                  out.println("查無此資料");
                }
              }
            }catch(Exception ex){
                out.println(ex);
            }
            %>
            break;
            case 'person':
              console.log(classdata);
              $('.modal-body').empty();
              $('.modal-title').html("個人");
                $('.modal-body').append(
                  "<div class='ui items'>"+
                    "<div class='item' style='margin:6vh;'>"+
                      "<div class='image' style='width:240px;height:300px;'>"+
                        "<img src='images/person1.jpg'>"+
                      "</div>"+
                      "<div class='content'>"+
                        "<a class='header' style='font-size:24px;'>玩家名</a><br>"+
                        "<div class='description'>"+
                          "<h style='font-size:20px;margin-top:2vh;'>帳號</h><br>"+
                          "<h style='font-size:20px;margin-top:2vh;'>經驗值</h><br>"+
                          "<h style='font-size:20px;margin-top:2vh;'>金錢</h>"+
                        "</div>"+
                      "</div>"+
                    "</div>"+
                  "</div>"
                );
              break;
          case 'card':
            console.log(classdata);
            $('.modal-body').empty();
            $('.modal-title').html("卡片");
              $('.modal-body').html(
                "<div class='ui top attached tabular menu'>"+
                  "<a class='item active' data-tab='monster'>怪獸卡</a>"+
                "</div>"+
                "<div class='ui bottom attached tab segment active' data-tab='monster' style='width:680px;background:#FFFFCE;'>"+
                  "<div class='col-md-4 portfolio-item' style='overflow-x:hidden;overflow-y:auto;height:300px;width:580px;'>" +
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card1.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card2.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card3.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card4.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card5.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card6.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card7.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card8.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card9.jpg'/></a>" +
                    "</div>"+
                    "<div style='float:left;width:131px;height:192px;margin:4vh;'>"+
                      "<a><img class='img-responsive' src='images/card10.jpg'/></a>" +
                    "</div>"+
                  "</div>"+
                "</div>"
              );
              $('.menu .item')
               .tab()
             ;
            break;
        }
      }
    </script>
    <script src="js/index.js"></script>
  </body>
</html>
