<%@ page import="com.waterManageSystem.Service.LogService" %>
<%@ page import="com.waterManageSystem.Service.impl.LogServiceImpl" %>
<%@ page import="com.waterManageSystem.Service.UserService" %>
<%@ page import="com.waterManageSystem.Service.impl.UserServiceImpl" %>
<%@ page import="static java.awt.SystemColor.window" %>
<%@ page import="com.waterManageSystem.Bean.User" %><%--
  Created by IntelliJ IDEA.
  User: yangjiahui
  Date: 2024/7/3
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");


    String userID=user.getUserID();
    UserService userService=new UserServiceImpl();
    if(userService.logout(userID)){
        System.out.println(",.,.,.");
    }else{
        System.out.println("nonoon");
    }
%>

<script type="text/javascript">
    alert("退出成功！");
    window.location="login.jsp";
</script>




</body>
</html>
