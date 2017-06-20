<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
      <title>遊戲王註冊</title>
      <link rel='stylesheet' href='css/semantic.css'>
      <style>
        body {
          background-image: url("images/reg1.jpg");
          background-size: 100%;
          z-index: 0;
        }
        /*#f_index_formbg {
          float:right;
          position:fixed;
          right:10%;
          bottom:10%;
          background-image: url("login2.png");
          background-size: 100%;
          z-index: 100;
        }*/
        #f_reg_form {
          float:left;
          left:10%;
          position:absolute;
          bottom:10%;
          z-index: 200;
        }
      </style>

      <!-- Semantic UI CSS -->
      <%-- <link href="css/semantic.css" rel="stylesheet"> --%>
    </head>
    <body>
      <div id="f_reg_formbg">
      </div>
      <div id="f_reg_form" class="ui form">
        <form method="post" action="registration.jsp">
          <center>
            <h1 style="font-size:30px; color:#00CACA;">玩家註冊</h1>
            <div class="field">
              <label style="font-size:20px; color:#00CACA;">帳號</label>
              <input type="text" name="uname" placeholder="帳號" required>
            </div>
            <div class="field">
              <label style="font-size:20px; color:#00CACA;">密碼</label>
              <input type="password" name="pass" placeholder="密碼" required>
            </div>
            <div class="field">
              <label style="font-size:20px; color:#00CACA;">名字</label>
              <input type="text" name="name" placeholder="名字" required>
            </div>
            <input type="submit" value="註冊" class="ui inverted blue button">
            <input type="button" onclick="window.open('index.jsp','_self')" value="首頁" class="ui inverted blue button"/>
        </center>
      </form>
    </div>
    <script src="js/index.js"></script>
  </body>
</html>
