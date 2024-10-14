<%--
  Created by IntelliJ IDEA.
  User: 10626
  Date: 2024/7/1
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>水文管理系统主页</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f8ff;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      text-align: center;
      background-color: #fff;
      padding: 20px 40px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      color: #333;
      margin-bottom: 20px;
    }
    a {
      text-decoration: none;
      font-size: 18px;
      color: darkblue;
      padding: 10px 20px;
      border: 2px solid darkblue;
      border-radius: 4px;
      transition: all 0.3s ease;
    }
    a:hover {
      background-color: darkblue;
      color: white;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>水文管理系统主页</h1>
  <a href="SystemManage/SystemManageHome.jsp">系统管理</a>
  <a href="SystemManage/DataSearch.jsp">水文查询</a>
</div>
</body>
</html>