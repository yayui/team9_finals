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
String attack="";
String defense="";
String photo="";

try{
if(!login.equals("ok")){
  response.sendRedirect("index.jsp");
}
else{


    String sql="select * from card where cardID="+ID;
    rs = st.executeQuery(sql);
    if(rs.next()){
      attack = rs.getString("attack");
      defense = rs.getString("defense");
      photo = rs.getString("photo");


    }else{
      out.println("查無此資料");

      // response.sendRedirect("main1.jsp?uname="+userid);
     }
}}catch(Exception ex){
  out.println(ex);
}
  %>


<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <title>遊戲王對戰</title>
    <link rel='stylesheet' href='css/semantic.css'>
    <link rel='stylesheet' href='css/pk.css'>
    <style>
      body {
        background-image: url("images/pk.jpg");
        background-size: 100%;
      }
    </style>
  </head>
  <body>
    <div id="opponent">
      <div id="opn_person">
        <img class="ui medium circular image" src="images/person1_c.jpg">
      </div>
      <div id="opn_name" class="ui blue inverted segment">
          對手名

      </div>
      <div id="opn_life">
        <h style="font-size:25px;color:#EAC100;">LP</h><br>
        <span style="font-size:40px;color:#EAC100;"> 4000</span>
      </div>
      <div id="opn_cards">
        <img src="images/backcard2.jpg" style="width:80px;height:118px;">
      </div>
      <div id="opn_card1">
        <img src="images/backcard.jpg" style="width:80px;height:118px;">
      </div>
      <div id="opn_card2">
        <img src="images/backcard.jpg" style="width:80px;height:118px;">
      </div>
      <div id="opn_card3">
        <img src="images/backcard.jpg" style="width:80px;height:118px;">
      </div>
      <div id="opn_card4">
        <img src="images/backcard.jpg" style="width:80px;height:118px;">
      </div>
      <div id="opn_tomb">
        <img src="images/backcard2.jpg" style="width:80px;height:118px;">
      </div>
    </div>
    <div id="player">
      <div id="plr_person">
        <img class="ui medium circular image" src="images/person3_c.jpg">
      </div>
      <div id="plr_name" class="ui red inverted segment">
        玩家名
      </div>
      <div id="plr_life">
        <h style="font-size:25px;color:#EAC100;">LP</h><br>
        <span style="font-size:40px;color:#EAC100;"> 4000</span>
      </div>
      <div id="plr_cards">
        <img src="images/backcard2.jpg" style="width:80px;height:118px;">
      </div>
      <div id="plr_card1">
        <img src="images/card1.jpg" style="width:80px;height:118px;">
      </div>
      <div id="plr_card2">
        <img src="images/card2.jpg" style="width:80px;height:118px;">
      </div>
      <div id="plr_card3">
        <img src="images/card3.jpg" style="width:80px;height:118px;">
      </div>
      <div id="plr_card4">
        <img src="images/card4.jpg" style="width:80px;height:118px;">
      </div>
      <div id="plr_tomb">
        <img src="images/backcard2.jpg" style="width:80px;height:118px;">
      </div>
    </div>
    <div id="record">
      
    </div>
    <div id="opn_out">
      <img src="images/card5.jpg" style="width:139px;height:205px;">
    </div>
    <div id="plr_out">
      <img src="images/<%=photo%>" style="width:139px;height:205px;">
    </div>
    <div id="pk_button">
      <button class="ui inverted orange button" style="width:130px;height:50px;font-size:23px;margin-top:3vh;" onclick="Attck();">ATK</button>
      <button class="ui inverted violet button" style="width:130px;height:50px;font-size:23px;margin-top:3vh;" onclick="defend();">DEF</button>
    </div>
    <div id="pk_button2">
      <button class="ui inverted gray button" style="width:180px;height:50px;font-size:21px;" onclick="window.open('main1.jsp?uname=<%=userid%>','_self')">返回主畫面</button>
    </div>
    <script>
      // var AI = [aidef(), aiatt()];
    var turn=1;
    var pass=0;
    var ai = 2;
    var att =  <%=attack%>;
    var def = <%=defense%>;
      inital();
      initalAttacker();
      initialDefender();

      console.log(getState("card"));
      var data = getState("card");
      // console.log(data.split(",",1)[0])
      console.log(getState("Attacker_HP"));
      console.log(getState("Defender_HP"));

      function inital(){
        var d = new Date("YYYY-MM-DD");
        console.log("卡牌開始");
        console.log(new Date());
        console.log(Math.floor((Math.random() * 30) + 1));
      }
      function initalAttacker(){//使用者
        var card = [];
        for(i=1;i<=5;i++){
          card.push(Math.floor((Math.random() * 30) + 1));
        }
        setState("AttackerCard",card);
        setState("Attacker_HP",4000);
        setState("Attacker_ATK",att);
        setState("Attacker_DEF",def);
      }
      function initialDefender(){//電腦
        var card = [];
        for(i=1;i<=5;i++){
          card.push(Math.floor((Math.random() * 30) +1));
        }
        setState("DefenderCard",card);
        setState("Defender_HP",4000);
        setState("Defender_ATK",1000);
        setState("Defender_DEF",500);
      }
      function setState(key,data){
        localStorage.setItem(key,data);
      }
      function getState(key){
        return localStorage.getItem(key);
      }
      function Attck(){
        var HP = getState("Defender_HP");
        var att = getState("Attacker_ATK");
        HP = HP - att;
        setState("Defender_HP" , HP);
        console.log("目前電腦血量：" + HP);
        if(HP<=0){
          console.log("玩家獲勝");
        }
        buttonclick();
      }
      function defend(){
        var HP = getState("Attacker_HP");
        var def = getState("Attacker_DEF");
        var def1 = parseInt(def);
          HP = parseInt(HP) + def1;
          setState("Attacker_HP" , HP);
          console.log("目前使用者血量：" + HP);
          buttonclick();
      }
      //棋手下棋

      function aiatt(){
        var HP = getState("Attacker_HP");
        var att = getState("Defender_ATK");
        HP = HP - att;
        setState("Attacker_HP" , HP);
        console.log("目前使用者血量：" + HP);
        if(HP<=0){
          console.log("電腦獲勝");
        }
        //buttonclick()
      }
      function aidef(){
        var HP = getState("Defender_HP");
        var def = getState("Defender_DEF");
        var def1 = parseInt(def);
          HP = parseInt(HP) + def1;
          setState("Defender_HP" , HP);
          console.log("目前電腦血量：" + HP);

          //buttonclick()
      }

      function buttonclick(){
        if(turn==1){
          startTurn(3-turn);
        }
      }

      function startTurn(nextTurn){
        var turn=nextTurn;
      //下回合為ai回合
        if(turn==ai){
      //處理AI
          aiAction();
        }
      }

      function aiAction(){
        var random = Math.floor(Math.random()*2);
          switch(random){
            case 0:
                aiatt();
                break;
            case 1:
                aidef();
                break;
          }
      }
    </script>
  </body>
</html>
