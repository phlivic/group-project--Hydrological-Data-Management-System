<%@ page import="com.waterManageSystem.Bean.User" %>
<%@ page import="com.waterManageSystem.Service.LogService" %>
<%@ page import="com.waterManageSystem.Service.impl.LogServiceImpl" %>
<%@ page import="com.waterManageSystem.Service.UserService" %>
<%@ page import="com.waterManageSystem.Service.impl.UserServiceImpl" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 10626
  Date: 2024/7/1
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style>
        /* 增加用户按钮样式 */
        .header button {
            padding: 15px 30px; /* 增加内边距 */
            font-size: 16px; /* 增大字体大小 */
            border: 2px solid #2980b9; /* 添加边框 */
            border-radius: 5px; /* 添加圆角 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 添加阴影 */
        }

        /* 鼠标悬停时的样式 */
        .header button:hover {
            background-color: #2980b9;
            color: white;
            border-color: #2980b9; /* 边框颜色与背景色一致 */
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 200px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
        }

        .sidebar h2 {
            margin: 0;
            margin-bottom: 20px;
            font-size: 18px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar button {
            width: 100%;
            padding: 10px;
            background-color: #34495e;
            color: white;
            border: none;
            cursor: pointer;
            text-align: left;
        }

        .sidebar button:hover {
            background-color: #2c3e50;
        }

        .sidebar .submenu, .sidebar .submenu3 {
            display: none;
            padding-left: 20px;
            max-height: 300px;
            overflow-y: auto;
            background-color: #2c3e50;
        }

        .main {
            flex: 1;
            padding: 20px;
            background-color: #ecf0f1;
        }

        .header {
            margin-bottom: 20px;
        }

        .header button {
            margin-right: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        table th, table td {
            border: 1px solid #bdc3c7;
            padding: 8px;
            text-align: left;
        }

        table th {
            background-color: #34495e;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        button {
            padding: 5px 10px;
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="styles.css">

    <meta charset="UTF-8">
    <title>用户信息管理</title>
    <script type="text/javascript">
        function showPopup() {
            document.getElementById('popup').style.display = 'block';
        }

        function hidePopup() {
            document.getElementById('popup').style.display = 'none';
        }

        function submitForm() {
            document.getElementById('popupForm').submit();
        }

        function showEdit() {
            document.getElementById('edit').style.display = 'block';
        }

        function hideEdit() {
            document.getElementById('edit').style.display = 'none';
        }

        function submitEdit() {
            document.getElementById('editForm').submit();
        }

        function deleteUser(id) {
            if (window.confirm("确定删除?")) {
                // document.location="${path}/GoodServlet?m=delete&id="+param
                // document.getElementById('edit').style.display = 'block';


                // document.getElementById('formField').name = name;
                document.getElementById('deleteID').value = id;

                //document.getElementById('form').action = path;
                document.getElementById('deleteForm').submit();
            }
        }
    </script>

    <style>
        #popup {
            display: none;
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: white;
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        #edit {
            display: none;
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: white;
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>

</head>
<body>
<%
    // 从 session 中获取属性
    User username = (User) session.getAttribute("user");
    System.out.println(username + "********");
%>
<%
    User user = new User();
    String userID = request.getParameter("userID");
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String userRole = request.getParameter("userRole");
    String affiliation = request.getParameter("affiliation");
    String note = request.getParameter("note");

    user.setUserID(userID);
    user.setUserName(userName);
    user.setPassword(password);
    user.setUserRole(userRole);
    user.setAffiliation(affiliation);
    user.setNote(note);
    UserService userService = new UserServiceImpl();
    if (userID != null) {
        if (userService.addUser(user)) {
%>
<script type="text/javascript">
    alert("增加用户成功!");
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("增加用户失败!");
</script>
<%
        }
    }
%>

<%
    User user2 = new User();
    String userID2 = request.getParameter("EdituserID");
    String userName2 = request.getParameter("EdituserName");
    String password2 = request.getParameter("Editpassword");
    String userRole2 = request.getParameter("EdituserRole");
    String affiliation2 = request.getParameter("Editaffiliation");
    String note2 = request.getParameter("Editnote");

    user2.setUserID(userID2);
    user2.setUserName(userName2);
    user2.setPassword(password2);
    user2.setUserRole(userRole2);
    user2.setAffiliation(affiliation2);
    user2.setNote(note2);
    UserService userService2 = new UserServiceImpl();
    if (userID2 != null) {
        if (userService2.updateUser(user2)) {
%>
<script type="text/javascript">
    alert("修改用户成功!");
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("修改用户失败!");
</script>
<%
        }
    }
%>


<%
    String deleteID = request.getParameter("deleteID");
    UserService userService3 = new UserServiceImpl();


    System.out.println(deleteID + "......");
    if (deleteID != null) {
        if (userService3.deleteUser(deleteID)) {
%>
<script type="text/javascript">
    alert("删除用户成功!");
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("删除用户失败!");
</script>
<%
        }
    }
%>

<div class="container">
    <div class="sidebar">
        <h2>系统管理</h2>
        <ul>
            <li><button onclick="location.href='UserManegeHome.jsp'">用户信息管理</button></li>
            <li><button onclick="location.href='OperateManegeHome.jsp'">操作管理</button></li>
            <li><button onclick="location.href='LogManageHome.jsp'">日志管理</button></li>

            <li>
                <button onclick="toggleSubmenu('submenuDictionary')">数据表管理</button>
                <ul class="submenu" id="submenuDictionary">
                    <li>
                        <form action="DataDictionaryManageHome.jsp" method="post">
                            <input type="hidden" name="dictionaryType" value="StationBasics">
                            <button type="submit">三峡局基本信息</button>
                        </form>
                    </li>
                    <li>
                        <form action="DataDictionaryManageHome.jsp" method="post">
                            <input type="hidden" name="dictionaryType" value="StationSID">
                            <button type="submit">三峡局测站编码与站编号对应关系</button>
                        </form>
                    </li>
                    <li>
                        <form action="DataDictionaryManageHome.jsp" method="post">
                            <input type="hidden" name="dictionaryType" value="MoistureStation">
                            <button type="submit">墒情站表</button>
                        </form>
                    </li>
                    <li>
                        <form action="DataDictionaryManageHome.jsp" method="post">
                            <input type="hidden" name="dictionaryType" value="EvolutionSET">
                            <button type="submit">沿革基表</button>
                        </form>
                    </li>
                    <li>
                        <form action="DataDictionaryManageHome.jsp" method="post">
                            <input type="hidden" name="dictionaryType" value="EvolutionList">
                            <button type="submit">沿革过程表</button>
                        </form>
                    </li>
                    <li>
                        <form action="DataDictionaryManageHome.jsp" method="post">
                            <input type="hidden" name="dictionaryType" value="WQST">
                            <button type="submit">水质站表</button>
                        </form>
                    </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="EvaporateStation">
                        <button type="submit">蒸发站表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="AWSCD">
                        <button type="submit">流域水系代码表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZXXH">
                        <button type="submit">测站信息化表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZXGXX_SWEN">
                        <button type="submit">水文测站相关信息</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZDLWZ">
                        <button type="submit">测站地理位置表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZDW">
                        <button type="submit">测站单位表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZSWTZ_SWEN">
                        <button type="submit">水文测站测验项目</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZSYXM">
                        <button type="submit">水文测站实验项目</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZGLFS_SWEN">
                        <button type="submit">水文测站管理方式</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZCLFS">
                        <button type="submit">水文测站测流方式</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZXXJL">
                        <button type="submit">水文测站信息记录方式</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZXGXX_SWEI">
                        <button type="submit">水位测站相关信息</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZSWTZ_SWEI">
                        <button type="submit">测站水位特征</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZCYXM_SWEI">
                        <button type="submit">水位测站测验项目</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZGLFS_SWEI">
                        <button type="submit">水位测站管理方式</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZSWGC">
                        <button type="submit">测站水位观测方式表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZXXJL_SWEI">
                        <button type="submit">水位测站信息记录方式</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZXGXX_YL">
                        <button type="submit">雨量站相关信息表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZDW_YL">
                        <button type="submit">雨量站测站单位表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZCYXM_YL">
                        <button type="submit">雨量测验站测验项目表</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZGC">
                        <button type="submit">雨量站观测方式</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZXXJL_YL">
                        <button type="submit">雨量测站信息记录方式</button>
                    </form>
                </li><li>
                    <form action="DataDictionaryManageHome.jsp" method="post">
                        <input type="hidden" name="dictionaryType" value="CZGLFS_YL">
                        <button type="submit">雨量测站管理方式</button>
                    </form>
                </li>

                </ul>
            </li>
            <li><button onclick="location.href='DataBackup.jsp'">数据备份</button></li>
        </ul>
    </div>
    <div class="main">
        <%
            User user01 = (User) session.getAttribute("user");
            if (user01.getUserRole().equals("SuperAdmin") ||
                    user01.getUserRole().equals("Admin")) {%>
        <div class="header">
            <button onclick="showPopup()">增加用户</button>
            <button onclick="location.href='SystemManageHome.jsp'">返回</button>
        </div>
        <%}%>
        <table>
            <thead>
            <tr>
                <th>编号</th>
                <th>用户编码</th>
                <th>用户名</th>
                <th>用户密码</th>
                <th>角色信息</th>
                <th>所属单位</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                // 调用findAllUsers方法获取所有用户信息
                List<User> users = null;
                try {
                    users = userService.findAllUsers();
                } catch (Exception e) {
                    e.printStackTrace();
                    // 可以在这里处理异常，比如跳转到错误页面或显示错误信息
                }

                //User user01 = (User) session.getAttribute("user");

                // 检查是否成功获取到用户列表
                int cnt = 0;
                if (users != null && !users.isEmpty()) {
                    // 遍历用户列表并显示每个用户的信息
                    for (User u : users) {
                        out.println("<tr>");
                        out.println("<td>" + ++cnt + "</td>");
                        out.println("<td>" + u.getUserID() + "</td>");
                        out.println("<td>" + u.getUserName() + "</td>");
                        if (user01.getUserID().equals(u.getUserID())) {
                            out.println("<td>" + u.getPassword() + "</td>");
                        }else{
                            out.println("<td>" + "******" + "</td>");
                        }
                        out.println("<td>" + u.getUserRole() + "</td>");
                        out.println("<td>" + u.getAffiliation() + "</td>");
                        out.println("<td>" + u.getNote() + "</td>");
                        out.println("<td>");
                        if (!(u.getUserRole().equals("SuperAdmin")
                                || (user01.getUserRole().equals("Admin") && u.getUserRole().equals("Admin"))
                                || user01.getUserRole().equals("Researcher")
                                || user01.getUserRole().equals("User"))) {
                            out.println("<button onclick=\"showEdit()\">编辑</button>");
                            // 删除按钮
                            //out.println("<form action=\"DeleteCheck.jsp\" method=\"post\"/>");
                            out.println("<button onclick='deleteUser(" + u.getUserID() + ")'>删除</button>");
                            out.println("</td></tr>");
                        }
                    }
                } else {
                    // 如果没有用户信息，显示提示信息
                    out.println("<p>没有找到用户信息。</p>");
                }
            %>
            <!-- More rows as needed -->
            </tbody>
        </table>
    </div>
</div>

<div id="popup">
    <form id="popupForm" action="UserManegeHome.jsp" method="post">
        <label for="userID">用户编码:</label>
        <input type="text" id="userID" name="userID" required><br><br>
        <label for="userName">用户名称:</label>
        <input type="text" id="userName" name="userName"><br><br>
        <label for="password">用户密码:</label>
        <input type="password" id="password" name="password"><br><br>
        <label for="note">备注:</label>
        <input type="text" id="note" name="note"><br><br>
        <label for="userRole">角色权限:</label>
        <select id="userRole" name="userRole">
            <option value="SuperAdmin">超级管理员</option>
            <option value="Admin">管理员</option>
            <option value="Researcher">研究员</option>
            <option value="User">普通用户</option>
        </select><br><br>
        <label for="affiliation">单位名称:</label>
        <select id="affiliation" name="affiliation">
            <option value="sc1">河海大学本部</option>
            <option value="sc2">河海大学江宁校区</option>
            <option value="sc3">河海大学常州校区</option>
        </select><br><br>
        <button type="button" onclick="submitForm()">增加</button>
        <button type="button" onclick="hidePopup()">取消</button>
    </form>
</div>

<div id="edit">
    <form id="editForm" action="UserManegeHome.jsp" method="post">
        <label for="userID">用户编码:</label>
        <input type="text" id="EdituserID" name="EdituserID" required><br><br>
        <label for="userName">用户名称:</label>
        <input type="text" id="EdituserName" name="EdituserName"><br><br>
        <label for="password">用户密码:</label>
        <input type="password" id="Editpassword" name="Editpassword"><br><br>
        <label for="note">备注:</label>
        <input type="text" id="Editnote" name="Editnote"><br><br>
        <label for="userRole">角色权限:</label>
        <select id="EdituserRole" name="EdituserRole">
            <option value="SuperAdmin">超级管理员</option>
            <option value="Admin">管理员</option>
            <option value="Researcher">研究员</option>
            <option value="User">普通用户</option>
        </select><br><br>
        <label for="Editaffiliation">单位名称:</label>
        <select id="Editaffiliation" name="Editaffiliation">
            <option value="sc1">河海大学本部</option>
            <option value="sc2">河海大学江宁校区</option>
            <option value="sc3">河海大学常州校区</option>
        </select><br><br>
        <button type="button" onclick="submitEdit()">修改</button>
        <button type="button" onclick="hideEdit()">取消</button>
    </form>
</div>



<form id="deleteForm" action="UserManegeHome.jsp" method="POST">
    <input id="deleteID" type="hidden" name="deleteID" value="">
</form>
<!-- 退出按钮 -->
<form action="../logout.jsp" method="post"/>

<button name="exitLogID" id="exitLogID" onclick="location.href='../logout.jsp'">退出</button>
</form>

<script>
    function toggleSubmenu(id) {
        var submenu = document.getElementById(id);
        if (submenu.style.display === 'none' || submenu.style.display === '') {
            submenu.style.display = 'block';
        } else {
            submenu.style.display = 'none';
        }
    }
</script>

<style>
    #exitLogID {
        position: fixed;
        bottom: 40px;
        left: 20px;
        padding: 20px 40px;
        background-color: #e74c3c;
        color: white;
        border: none;
        border-radius: 10px;
        cursor: pointer;
    }

    #exitLogID:hover {
        background-color: #c0392b;
    }
</style>

</body>
</html>