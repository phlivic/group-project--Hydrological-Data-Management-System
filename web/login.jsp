<%--
  Created by IntelliJ IDEA.
  User: 10626
  Date: 2024/7/1
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录界面</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        h2 {
            text-align: center;
            color: peru;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px 0;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"],
        input[type="reset"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: darkblue;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: red;
        }
        a {
            text-decoration: none;
            font-size: 14px;
            color: darkblue;
            display: block;
            text-align: center;
            margin-top: 10px;
        }
        a:hover {
            font-size: 16px;
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>水文管理系统</h1>
    <hr/>
    <h2>用户登录</h2>
    <form action="loginCheck.jsp" method="post">
        <table>
            <tr>
                <td>账号：</td>
                <td><input type="text" name="userName" id="userName" placeholder="请输入账号" autofocus="autofocus"></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="password" id="password" placeholder="请输入密码"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="登录">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
    <a onclick="findAdmin()">忘记密码？</a>
</div>
<script>
    function findAdmin(){
        alert("请联系管理员!");
    }
</script>
</body>
</html>
