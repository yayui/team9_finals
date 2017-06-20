<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
      <title>遊戲王登入</title>
      <link rel='stylesheet' href='css/semantic.css'>
      <style>
        body {
          background-image: url("images/login1.jpg");
          background-size: 100%;
          z-index: 0;
        }
        #f_index_formbg {
          float:right;
          position:fixed;
          right:10%;
          bottom:10%;
          background-image: url("images/login2.png");
          background-size: 100%;
          z-index: 100;
        }
        #f_index_form {
          float:right;
          position:absolute;
          right:10%;
          bottom:10%;
          z-index: 200;
        }
      </style>

    </head>
    <body>
      <div id="f_index_formbg">
      </div>
      <div id="f_index_form" class="ui form">
        <form method="post" action="login.jsp">
          <center>
            <h1 style="font-size:30px; color:#FF9224;">玩家登入</h1>
            <div class="field">
              <label style="font-size:20px; color:#FF9224;">帳號</label>
              <input type="text" name="uname" placeholder="帳號" required>
            </div>
            <div class="field">
              <label style="font-size:20px; color:#FF9224;">密碼</label>
              <input type="password" name="pass" placeholder="密碼" required>
            </div>
            <%-- <table cellpadding='5'>
              <thead>
                <tr>
                  <th>玩家登入</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>帳號</td>
                  <td><input type="text" name="uname" value="" required/></td>
                </tr>
                <tr>
                  <td>密碼</td>
                  <td><input type="password" name="pass" value="" required/></td>
                </tr>
                <tr> --%>
                  <input type="submit" value="登入" class="ui inverted brown button">
                  <input type="button" onclick="window.open('reg.jsp','_self')" value="註冊" class="ui inverted brown button"/>
                <%-- </tr> --%>
            <%-- </tbody> --%>
          <%-- </table> --%>
        </center>
      </form>
    </div>
    <script src="js/index.js"></script>

  </body>
</html>
