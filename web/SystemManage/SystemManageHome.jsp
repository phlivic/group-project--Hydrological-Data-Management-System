<%--
  Created by IntelliJ IDEA.
  User: 10626
  Date: 2024/7/1
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
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
            overflow-y: auto;
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

        .sidebar .submenu button, .sidebar .submenu3 button {
            background-color: #3a516b;
        }

        .main {
            flex: 1;
            padding: 20px;
            background-color: #ecf0f1;
            overflow-y: auto;
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
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
        <img src="../img/welcome.jpg" width="100%" height="100%" />
    </div>
</div>
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
<form action="../logout.jsp" method="post">
    <button name="exitLogID" id="exitLogID" onclick="location.href='../logout.jsp'">退出</button>
</form>
</body>
</html>
