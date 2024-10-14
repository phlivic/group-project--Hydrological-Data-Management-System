<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.waterManageSystem.Bean.User" %>
<%@ page import="com.waterManageSystem.DAO.impl.UserDaoImpl" %>
<%@ page import="com.waterManageSystem.DAO.UserDao" %>
<%@ page import="com.waterManageSystem.Service.UserService" %>
<%@ page import="com.waterManageSystem.Service.impl.UserServiceImpl" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录中...</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
        h2{
            text-align: center;
            color: peru;
        }
        body{
            text-align: center;
            background-color: aliceblue;
        }
    </style>
</head>
<body>
<h1>水文管理系统</h1>
<hr>
<%
    // 设置接收的编码为UTF-8
    request.setCharacterEncoding("utf-8");
    User user = new User();
    UserService userService = new UserServiceImpl();

    String userName = request.getParameter("userName");
    String password = request.getParameter("password");

    user.setUserName(userName);
    user.setPassword(password);


    // 获取用户登录信息
    User us = userService.login(user);

    // 设置会话
    session.setAttribute("user", user);


    if (us != null && (us.getUserRole().equals("SuperAdmin"))) {
%>
<script type="text/javascript">
    alert("欢迎您！超级管理员！");
    window.location="home.jsp";
</script>
<%
}else if (us != null && (us.getUserRole().equals("Admin"))) {
%>
<script type="text/javascript">
    alert("欢迎您！管理员！");
    window.location="home.jsp";
</script>
<%
}else if (us != null && (us.getUserRole().equals("Researcher"))) {
%>
<script type="text/javascript">
    alert("欢迎您！研究！");
    window.location="home.jsp";
</script>
<%
} else if (us != null && us.getUserRole().equals("User")) {
%>
<script type="text/javascript">
    alert("欢迎您！用户！");
    window.location="home.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("登录失败！请检查账号和密码");
    window.location="login.jsp";
</script>
<%
        //  response.sendRedirect("login_fail.jsp");
    }
%>
</body>
</html>

