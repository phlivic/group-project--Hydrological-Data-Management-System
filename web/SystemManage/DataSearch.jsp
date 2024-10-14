<%@ page import="com.waterManageSystem.DAO.impl.DictionaryDaoImpl" %>
<%@ page import="com.waterManageSystem.Bean.Dictionary.DIC_Base" %>
<%@ page import="java.util.List" %>
<%@ page import="com.waterManageSystem.Bean.Dictionary.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据查询界面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
            text-align: center;
        }
        h1 {
            color: #4682b4;
        }
        form {
            display: inline-block;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #e6f2ff;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        select, input[type="text"], input[type="submit"], button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #4682b4;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #5a9bd3;
        }
        button {
            background-color: #ff6347;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #ff7f50;
        }
        .radio-container {
            display: inline-block;
            position: relative;
            padding-left: 25px;
            margin-right: 10px;
            cursor: pointer;
            font-size: 16px;
            user-select: none;
        }
        .radio-container input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }
        .checkmark {
            position: absolute;
            top: 0;
            left: 0;
            height: 20px;
            width: 20px;
            background-color: #eee;
            border-radius: 50%;
        }
        .radio-container input:checked ~ .checkmark {
            background-color: #2196F3;
        }
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }
        .radio-container input:checked ~ .checkmark:after {
            display: block;
        }
        .radio-container .checkmark:after {
            top: 7px;
            left: 7px;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: white;
        }
        .main {
            margin: 20px auto;
            width: 80%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4682b4;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>数据查询界面</h1>
<form method="post">
    <label for="dictionaryType">选择数据表:</label>
    <select name="dictionaryType" id="dictionaryType">
        <option value="StationBasics">三峡局基本信息</option>
        <option value="StationSID">三峡局测站编码与站编号对应关系</option>
    </select>
    <label for="searchTerm">搜索内容:</label>
    <input type="text" name="searchTerm" id="searchTerm">
    <label class="radio-container">启用连接
        <input type="checkbox" name="enableJoin" id="enableJoin">
        <span class="checkmark"></span>
    </label>
    <input type="submit" value="查询">
    <button type="button" onclick="window.location.href='../home.jsp'">返回</button>
</form>

<div class="main">
    <table border="1">
        <thead>
        <tr>
            <th>序号</th>
            <th>IID</th>
            <th>STNM</th>
            <th>ADAGNM</th>
            <th>LOC</th>
            <th>WSST</th>
            <th>RVNM</th>
            <th>SID</th> <!-- 仅在StationSID表中使用 -->
        </tr>
        </thead>
        <tbody>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                DictionaryDaoImpl d = new DictionaryDaoImpl();
                List<DIC_Base> dic = null;
                List<DIC_Base> dicJoin = null;
                String dicName = request.getParameter("dictionaryType");
                String searchTerm = request.getParameter("searchTerm");
                boolean enableJoin = "on".equals(request.getParameter("enableJoin"));
                try {
                    dic = d.getDicByName(dicName);
                    if (enableJoin) {
                        dicJoin = d.getDicByName(dicName.equals("StationBasics") ? "StationSID" : "StationBasics");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (dic != null && !dic.isEmpty()) {
                    int cnt = 0;
                    for (DIC_Base uu : dic) {
                        boolean match = true;
                        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                            String searchLower = searchTerm.toLowerCase();
                            if (dicName.equals("StationBasics")) {
                                DIC_StationBasics u = (DIC_StationBasics) uu;
                                match = (u.getIID() != null && u.getIID().toLowerCase().contains(searchLower)) ||
                                        (u.getSTNM() != null && u.getSTNM().toLowerCase().contains(searchLower)) ||
                                        (u.getADAGNM() != null && u.getADAGNM().toLowerCase().contains(searchLower)) ||
                                        (u.getLOC() != null && u.getLOC().toLowerCase().contains(searchLower)) ||
                                        (u.getWSST() != null && u.getWSST().toLowerCase().contains(searchLower)) ||
                                        (u.getRVNM() != null && u.getRVNM().toLowerCase().contains(searchLower));
                            } else if (dicName.equals("StationSID")) {
                                DIC_StationSID u = (DIC_StationSID) uu;
                                match = (u.getIID() != null && u.getIID().toLowerCase().contains(searchLower)) ||
                                        (u.getSID() != null && u.getSID().toLowerCase().contains(searchLower));
                            }
                        }
                        if (match) {
                            if (dicName.equals("StationBasics")) {
                                DIC_StationBasics u = (DIC_StationBasics) uu;
                                out.println("<tr>");
                                out.println("<td>" + ++cnt + "</td>");
                                out.println("<td>" + u.getIID() + "</td>");
                                out.println("<td>" + u.getSTNM() + "</td>");
                                out.println("<td>" + u.getADAGNM() + "</td>");
                                out.println("<td>" + u.getLOC() + "</td>");
                                out.println("<td>" + u.getWSST() + "</td>");
                                out.println("<td>" + u.getRVNM() + "</td>");
                                out.println("</tr>");
                                if (enableJoin && dicJoin != null) {
                                    for (DIC_Base vv : dicJoin) {
                                        DIC_StationSID v = (DIC_StationSID) vv;
                                        if (v.getIID() != null && v.getIID().equals(u.getIID())) {
                                            out.println("<tr>");
                                            out.println("<td>" + ++cnt + "</td>");
                                            out.println("<td>" + v.getIID() + "</td>");
                                            out.println("<td colspan='5'></td>");
                                            out.println("<td>" + v.getSID() + "</td>");
                                            out.println("</tr>");
                                        }
                                    }
                                }
                            } else if (dicName.equals("StationSID")) {
                                DIC_StationSID u = (DIC_StationSID) uu;
                                out.println("<tr>");
                                out.println("<td>" + ++cnt + "</td>");
                                out.println("<td>" + u.getIID() + "</td>");
                                out.println("<td colspan='5'></td>");
                                out.println("<td>" + u.getSID() + "</td>");
                                out.println("</tr>");
                                if (enableJoin && dicJoin != null) {
                                    for (DIC_Base vv : dicJoin) {
                                        DIC_StationBasics v = (DIC_StationBasics) vv;
                                        if (v.getIID() != null && v.getIID().equals(u.getIID())) {
                                            out.println("<tr>");
                                            out.println("<td>" + ++cnt + "</td>");
                                            out.println("<td>" + v.getIID() + "</td>");
                                            out.println("<td>" + v.getSTNM() + "</td>");
                                            out.println("<td>" + v.getADAGNM() + "</td>");
                                            out.println("<td>" + v.getLOC() + "</td>");
                                            out.println("<td>" + v.getWSST() + "</td>");
                                            out.println("<td>" + v.getRVNM() + "</td>");
                                            out.println("</tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>