<%--
  Created by IntelliJ IDEA.
  User: liuning
  Date: 2018/4/25
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />

    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/login.css" />
    <script type="text/javascript">
        if (window != top)
            top.location.reload();
    </script>

</head>

<body>
<div class="login_wrap">
    <form method="post" action="login">
        <ul class="user_wrap" >
            <li>
                <input class="user_input" name="username" type="text" value="admin" placeholder="输入用户名" />
            </li>
            <li>
                <input  class="pwd_input" type="password" name="password" value="123456" placeholder="登录密码" />
            </li>

            <li>
                <button style="margin-top: 0;" class="login_btn" type="submit">登录</button>
            </li>
            <span style="color: #a90237; font-weight: bold;">${msg}</span>
        </ul>
    </form>
    <div class="copy">
        Copyright 2017 All rights Reserved | 浙ICP备15014490
    </div>
</div>
</body>
<script>sessionStorage.clear();</script>
</html>