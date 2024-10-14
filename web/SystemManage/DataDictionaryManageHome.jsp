<%@ page import="com.waterManageSystem.DAO.impl.DictionaryDaoImpl" %>
<%@ page import="com.waterManageSystem.Bean.Dictionary.DIC_Base" %>
<%@ page import="java.util.List" %>
<%@ page import="com.waterManageSystem.Bean.Dictionary.*" %>
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

        table caption {
            font-size: large;
            border: 2px solid #bdc3c7;
            padding: 8px;
            color: white;
            background-color: #2c3e50;
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
        .sidebar .submenu, .sidebar .submenu3 {
            display: none;
            padding-left: 20px;
            max-height: 300px;
            overflow-y: auto;
            background-color: #2c3e50;
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
            <table>

                <thead>
                <tr>


                    <%
                        DictionaryDaoImpl d = new DictionaryDaoImpl();
                        // 调用findAllUsers方法获取所有用户信息
                        List<DIC_Base> dic = null;
                        String dicName = request.getParameter("dictionaryType");
                        try {
                            dic = d.getDicByName(dicName);
                        } catch (Exception e) {
                            e.printStackTrace();
                            // 可以在这里处理异常，比如跳转到错误页面或显示错误信息
                        }
                        System.out.println(dicName);
                        System.out.println(dic);
                        if (dicName.equals("StationBasics")) {
                    %>
                    <caption>三峡局基本信息</caption>
                    <th>编号</th>
                    <th>编码</th>
                    <th>站名</th>
                    <th>管理机构</th>
                    <th>坐标</th>
                    <th>流域水系</th>
                    <th>河流名称</th>
                    <%
                    } else if (dicName.equals("StationSID")) {
                    %>
                    <caption>三峡局测站编码与站编号对应关系</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>编码</th>
                    <%
                    } else if (dicName.equals("MoistureStation")) {
                    %>
                    <caption>墒情站表</caption>
                    <th>编号</th>
                    <th>测站名称</th>
                    <th>测站编码</th>
                    <th>流域</th>
                    <th>设站日期（年）</th>
                    <th>设站日期（月）</th>
                    <th>测站地址（省）</th>
                    <th>测站地址（市）</th>
                    <th>测站地址（县）</th>
                    <th>测站地址（镇）</th>
                    <th>测站编码（街道）</th>
                    <th>管理机构</th>
                    <th>东经（度）</th>
                    <th>东经（分）</th>
                    <th>东经（秒）</th>
                    <th>北纬（度）</th>
                    <th>北纬（分）</th>
                    <th>北纬（秒）</th>
                    <th>测验方式</th>
                    <th>备注</th>
                    <%
                    } else if (dicName.equals("EvolutionSET")) {
                    %>
                    <caption>沿革基表</caption>
                    <th>编号</th>
                    <th>测站名称</th>
                    <th>测站编码</th>
                    <th>流域</th>
                    <th>水系</th>
                    <th>河流</th>
                    <th>集水面积</th>
                    <th>设站日期（年）</th>
                    <th>设站日期（月）</th>
                    <th>批准机关</th>
                    <th>变更情况（撤销）</th>
                    <th>变更情况（迁移）</th>
                    <th>变更情况（测站降级）</th>
                    <th>变更情况（测站升级）</th>
                    <th>变更原因（已达设站目的）</th>
                    <th>变更原因（环境变化人类活动影响）</th>
                    <th>变更原因（其他）</th>
                    <th>站类管理（基本站）</th>
                    <th>站类管理（专用站）</th>
                    <th>站类管理（实验站）</th>
                    <th>测站属性（河道站）</th>
                    <th>测站属性（渠道站）</th>
                    <th>测站属性（水库站）</th>
                    <th>测站属性（湖泊站）</th>
                    <th>测站属性（潮流站）</th>
                    <th>管理单位</th>
                    <th>备注</th>
                    <%
                    } else if (dicName.equals("EvolutionList")) {
                    %>
                    <caption>沿革过程表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>变更日期（年）</th>
                    <th>变更日期（月）</th>
                    <th>变更情况（撤销）</th>
                    <th>变更情况（迁移）</th>
                    <th>变更情况（测站降级）</th>
                    <th>变更情况（测站升级）</th>
                    <th>变更原因（已达设站目的）</th>
                    <th>变更原因（环境变化人类活动影响）</th>
                    <th>变更原因（其他）</th>
                    <th>站类管理（基本站）</th>
                    <th>站类管理（专用站）</th>
                    <th>站类管理（实验站）</th>
                    <th>测站属性（河道站）</th>
                    <th>测站属性（渠道站）</th>
                    <th>测站属性（水库站）</th>
                    <th>测站属性（湖泊站）</th>
                    <th>测站属性（潮流站）</th>
                    <th>测站地址（省）</th>
                    <th>测站地址（市）</th>
                    <th>测站地址（县）</th>
                    <th>测站地址（镇）</th>
                    <th>测站地址（街道）</th>
                    <th>东经（度）</th>
                    <th>东经（分）</th>
                    <th>东经（秒）</th>
                    <th>北纬（度）</th>
                    <th>北纬（分）</th>
                    <th>北纬（秒）</th>
                    <th>管理单位</th>
                    <th>备注</th>
                    <%
                    } else if (dicName.equals("WQST")) {
                    %>
                    <caption>水质站表</caption>
                    <th>编号</th>
                    <th>测站名称</th>
                    <th>测站编码</th>
                    <th>断面名称</th>
                    <th>流域代码</th>
                    <th>水系代码</th>
                    <th>河流名</th>
                    <th>设站日期（年）</th>
                    <th>设站日期（月）</th>
                    <th>一级水功能区名称</th>
                    <th>二级水功能区名称</th>
                    <th>测站地址（省）</th>
                    <th>测站地址（市）</th>
                    <th>测站地址（县）</th>
                    <th>测站地址（镇）</th>
                    <th>测站地址（街道）</th>
                    <th>东经（度）</th>
                    <th>东经（分）</th>
                    <th>东经（秒）</th>
                    <th>北纬（度）</th>
                    <th>北纬（分）</th>
                    <th>北纬（秒）</th>
                    <th>管理单位</th>
                    <th>是否行政区界断面</th>
                    <th>分析方式-在线</th>
                    <th>分析方式-取样</th>
                    <th>备注</th>
                    <%
                    } else if (dicName.equals("EvaporateStation")) {
                    %>
                    <caption>蒸发站表</caption>
                    <th>编号</th>
                    <th>测站名称</th>
                    <th>测站编码</th>
                    <th>流域代码</th>
                    <th>设站日期（年）</th>
                    <th>设站日期（月）</th>
                    <th>测站地址（省）</th>
                    <th>测站地址（市）</th>
                    <th>测站地址（县）</th>
                    <th>测站地址（镇）</th>
                    <th>测站地址（街道）</th>
                    <th>管理单位</th>
                    <th>东经（度）</th>
                    <th>东经（分）</th>
                    <th>东经（秒）</th>
                    <th>北纬（度）</th>
                    <th>北纬（分）</th>
                    <th>多年平均蒸发量</th>
                    <th>蒸发器型号</th>
                    <th>记录方式</th>
                    <th>测验方式</th>
                    <th>备注</th>
                    <%
                    } else if (dicName.equals("AWSCD")) {
                    %>
                    <caption>流域水系代码表</caption>
                    <th>编号</th>
                    <th>水系代码</th>
                    <th>流域</th>
                    <th>流域代码</th>
                    <th>水系</th>
                    <%
                    } else if (dicName.equals("CZXXH")) {
                    %>
                    <caption>测站信息化表</caption>
                    <th>编号</th>
                    <th>测站名称</th>
                    <th>测站编码</th>
                    <th>测站流域</th>
                    <th>测站水系</th>
                    <th>河流</th>
                    <th>集水面积</th>
                    <th>备注</th>
                    <%
                    } else if (dicName.equals("CZXGXX_SWEN")) {
                    %>
                    <caption>水文测站相关信息</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>设站日期（年）</th>
                    <th>设站日期（月）</th>
                    <th>站类管理（国家重要站）</th>
                    <th>站类管理（省级重要站）</th>
                    <th>站类管理（一般站）</th>
                    <th>站类管理（中小河流）</th>
                    <th>站类管理（山洪灾害）</th>
                    <th>站类管理（其他）</th>
                    <th>站类管理（实验站）</th>
                    <th>站类管理（辅助站）</th>
                    <th>测站属性(河道站)</th>
                    <th>测站属性(水库站)</th>
                    <th>测站属性(湖泊站)</th>
                    <th>测站属性(潮流量站)</th>
                    <th>测站属性(渠道站)</th>
                    <th>测站属性(其他站)</th>
                    <th>测站分类(大河控制站)</th>
                    <th>测站分类(区域代表站)</th>
                    <th>测站分类(小河站)</th>
                    <th>拍报水情</th>
                    <%
                    } else if (dicName.equals("CZDLWZ")) {
                    %>
                    <caption>测站地理位置表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>测站位置（省）</th>
                    <th>测站位置（市、区）</th>
                    <th>测站位置（县、市）</th>
                    <th>测站位置（乡、镇）</th>
                    <th>测站位置（村、街道）</th>
                    <th>测站纬度（度）</th>
                    <th>测站纬度（分）</th>
                    <th>测站纬度（秒）</th>
                    <th>测站经度（度）</th>
                    <th>测站经度（分）</th>
                    <th>测站经度（秒）</th>
                    <th>测站高程</th>
                    <th>基面名称</th>
                    <th>基面偏移值</th>
                    <%
                    } else if (dicName.equals("CZDW")) {
                    %>
                    <caption>测站单位表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>建设单位</th>
                    <th>管理单位</th>
                    <th>所属勘测队</th>
                    <th>是否为行政区断面</th>
                    <%
                    } else if (dicName.equals("CZSWTZ_SWEN")) {
                    %>
                    <caption>测站水文特征表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>多年平均径流量</th>
                    <th>最大流量</th>
                    <th>最大流量出现时间</th>
                    <th>最小流量</th>
                    <th>最小流量时间</th>
                    <%
                    } else if (dicName.equals("CZCYXM_SWEN")) {
                    %>
                    <caption>水文测站测验项目</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>流量</th>
                    <th>水位</th>
                    <th>潮位</th>
                    <th>降水</th>
                    <th>蒸发</th>
                    <th>比降</th>
                    <th>水质</th>
                    <th>悬移质</th>
                    <th>推移质</th>
                    <th>河床质</th>
                    <th>颗分</th>
                    <th>冰情</th>
                    <th>辅助气象</th>
                    <th>地下水</th>
                    <th>墒情</th>
                    <th>水文调查</th>
                    <%
                    } else if (dicName.equals("CZSYXM")) {
                    %>
                    <caption>水文测站实验项目</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>径流</th>
                    <th>蒸发</th>
                    <th>测验方法</th>
                    <th>地下水</th>
                    <th>其他</th>
                    <th>兼基本水文站</th>
                    <%
                    } else if (dicName.equals("CZGLFS_SWEN")) {
                    %>
                    <caption>水文测站管理方式</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>常年驻测</th>
                    <th>汛期驻测</th>
                    <th>巡测</th>
                    <th>委托</th>
                    <th>站队结合</th>
                    <%
                    } else if (dicName.equals("CZCLFS")) {
                    %>
                    <caption>水文测站测流方式</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>缆道机动或手动</th>
                    <th>缆道手摇</th>
                    <th>缆道缆车或吊箱</th>
                    <th>测船机动</th>
                    <th>测船非机动</th>
                    <th>桥测</th>
                    <th>水工建筑物</th>
                    <th>ADCP</th>
                    <th>其他</th>
                    <%
                    } else if (dicName.equals("CZXXJL")) {
                    %>
                    <caption>水文测站信息记录方式</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>在线监测</th>
                    <th>人工观读</th>
                    <%
                    } else if (dicName.equals("CZXGXX_SWEI")) {
                    %>
                    <caption>水位测站相关信息</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>设站日期（年）</th>
                    <th>设站日期（月）</th>
                    <th>站类管理（基本站）</th>
                    <th>站类管理（中小河流）</th>
                    <th>站类管理（山洪灾害）</th>
                    <th>站类管理（其他）</th>
                    <th>测站属性(河道站)</th>
                    <th>测站属性(水库站)</th>
                    <th>测站属性(湖泊站)</th>
                    <th>测站属性(潮位站)</th>
                    <th>测站属性(渠道站)</th>
                    <th>测站属性(其他站)</th>

                    <th>拍报水情</th>
                    <%
                    } else if (dicName.equals("CZSWTZ_SWEI")) {
                    %>
                    <caption>测站水位特征</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>最高水位</th>
                    <th>最高水位时间</th>
                    <th>最低水位</th>
                    <th>最低水位时间</th>
                    <th>首次河干时间</th>
                    <th>平均河干天数</th>
                    <%
                    } else if (dicName.equals("CZCYXM_SWEI")) {
                    %>
                    <caption>水位测站测验项目</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>水位</th>
                    <th>潮位</th>
                    <th>降水</th>
                    <th>蒸发</th>
                    <th>比降</th>
                    <th>水质</th>
                    <th>水温</th>
                    <th>冰情</th>
                    <th>辅助气象</th>
                    <th>地下水</th>
                    <th>墒情</th>
                    <th>水文调查</th>
                    <%
                    } else if (dicName.equals("CZGLFS_SWEI")) {
                    %>
                    <caption>水位测站管理方式</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>常年驻测</th>
                    <th>汛期驻测</th>
                    <th>巡测</th>
                    <th>委托</th>
                    <%
                    } else if (dicName.equals("CZSWGC")) {
                    %>
                    <caption>测站水位观测方式表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>浮子</th>
                    <th>超声波</th>
                    <th>压力式</th>
                    <th>电子水尺</th>
                    <th>水尺</th>
                    <th>其他</th>
                    <%
                    } else if (dicName.equals("CZXXJL_SWEI")) {
                    %>
                    <caption>水位测站信息记录方式</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>自动测报</th>
                    <th>普通自计</th>
                    <th>固态存储</th>
                    <th>人工观读</th>
                    <%
                    } else if (dicName.equals("CZXGXX_YL")) {
                    %>
                    <caption>雨量站相关信息表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>设站日期（年）</th>
                    <th>设站日期（月）</th>
                    <th>站类管理（基本站）</th>
                    <th>站类管理（中小河流）</th>
                    <th>站类管理（山洪灾害）</th>
                    <th>站类管理（其他）</th>
                    <th>拍报水情</th>
                    <%
                    } else if (dicName.equals("CZDW_YL")) {
                    %>
                    <caption>雨量站测站单位表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>管理单位</th>
                    <%
                    } else if (dicName.equals("TZZ")) {
                    %>
                    <caption>雨量站特征值表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>器口高度</th>
                    <th>多年平均降雨量</th>
                    <th>最大降雨量</th>
                    <th>出现年份</th>
                    <%
                    } else if (dicName.equals("CZCYXM_YL")) {
                    %>
                    <caption>雨量测验站测验项目表</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>降水</th>
                    <th>蒸发</th>
                    <th>降水水质</th>
                    <th>辅助气象</th>
                    <th>墒情</th>
                    <%
                    } else if (dicName.equals("CZGC")) {
                    %>
                    <caption>雨量站观测方式</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>翻斗式</th>
                    <th>虹吸式</th>
                    <th>雨量器</th>
                    <%
                    } else if (dicName.equals("CZXXJL_YL")) {
                    %>
                    <caption>雨量测站信息记录方式</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>自动测报</th>
                    <th>普通自计</th>
                    <th>固态存储</th>
                    <th>人工观读</th>
                    <%
                    } else if (dicName.equals("CZGLFS_YL")) {
                    %>
                    <caption>雨量测站管理方式</caption>
                    <th>编号</th>
                    <th>测站编码</th>
                    <th>委托</th>
                    <%
                        }
                        // 检查是否成功获取到用户列表
                        int cnt = 0;
                    %>
                </tr>
                </thead>
                <tbody>
                    <%
                    if (dic != null && !dic.isEmpty()) {
                        // 遍历用户列表并显示每个用户的信息
                        if (dicName.equals("StationBasics")) {
                            for (DIC_Base uu : dic) {
                                DIC_StationBasics u = (DIC_StationBasics) uu;
                                out.println("<tr>");
                                out.println("<td>" + ++cnt + "</td>");
                                out.println("<td>" + u.getIID() + "</td>");
                                out.println("<td>" + u.getSTNM() + "</td>");
                                out.println("<td>" + u.getADAGNM() + "</td>");
                                out.println("<td>" + u.getLOC() + "</td>");
                                out.println("<td>" + u.getWSST() + "</td>");
                                out.println("<td>" + u.getRVNM() + "</td>");
                                out.println("<td>");
                            }
                        }else if(dicName.equals("StationSID")){
                            for (DIC_Base uu : dic) {
                                DIC_StationSID u = (DIC_StationSID) uu;
                                out.println("<tr>");
                                out.println("<td>" + ++cnt + "</td>");
                                out.println("<td>" + u.getSID() + "</td>");
                                out.println("<td>" + u.getIID() + "</td>");
                                out.println("<td>");
                            }
                        }else if(dicName.equals("MoistureStation")){
                            for (DIC_Base uu : dic) {
                                DIC_MoistureStation u = (DIC_MoistureStation) uu;
                                out.println("<tr>");
                                out.println("<td>" + ++cnt + "</td>");
                                out.println("<td>" + u.getSTNM() + "</td>");
                                out.println("<td>" + u.getSTCD() + "</td>");
                                out.println("<td>" + u.getBSHNCD() + "</td>");
                                out.println("<td>" + u.getSETDATEY() + "</td>");
                                out.println("<td>" + u.getSETDATEM() + "</td>");
                                out.println("<td>" + u.getSLPRV() + "</td>");
                                out.println("<td>" + u.getSLCT() + "</td>");
                                out.println("<td>" + u.getSLCO() + "</td>");
                                out.println("<td>" + u.getSLTO() + "</td>");
                                out.println("<td>" + u.getSLST() + "</td>");
                                out.println("<td>" + u.getAGUN() + "</td>");
                                out.println("<td>" + u.getLGTDD() + "</td>");
                                out.println("<td>" + u.getLGTDM() + "</td>");
                                out.println("<td>" + u.getLGTDS() + "</td>");
                                out.println("<td>" + u.getLTTDD() + "</td>");
                                out.println("<td>" + u.getLTTDM() + "</td>");
                                out.println("<td>" + u.getLTTDS() + "</td>");
                                out.println("<td>" + u.getTSMD() + "</td>");
                                out.println("<td>" + u.getNT() + "</td>");
                                out.println("<td>");
                            }
                        }else if(dicName.equals("EvolutionSET")){
                            for (DIC_Base uu : dic) {
                                DIC_EvolutionSET u = (DIC_EvolutionSET) uu;
                                out.println("<tr>");
                                out.println("<td>" + ++cnt + "</td>");
                                out.println("<td>" + u.getSTNM() + "</td>");
                                out.println("<td>" + u.getSTCD() + "</td>");
                                out.println("<td>" + u.getBSHNCD() + "</td>");
                                out.println("<td>" + u.getWID() + "</td>");
                                out.println("<td>" + u.getRVNM() + "</td>");
                                out.println("<td>" + u.getDRAR() + "</td>");
                                out.println("<td>" + u.getSETDATEY() + "</td>");
                                out.println("<td>" + u.getSETDATEM() + "</td>");
                                out.println("<td>" + u.getAPAR() + "</td>");
                                out.println("<td>" + u.getSSC() + "</td>");
                                out.println("<td>" + u.getSSR() + "</td>");
                                out.println("<td>" + u.getSSDT() + "</td>");
                                out.println("<td>" + u.getSSRT() + "</td>");
                                out.println("<td>" + u.getRP() + "</td>");
                                out.println("<td>" + u.getRI() + "</td>");
                                out.println("<td>" + u.getRO() + "</td>");
                                out.println("<td>" + u.getSMB() + "</td>");
                                out.println("<td>" + u.getSMS() + "</td>");
                                out.println("<td>" + u.getSMR() + "</td>");
                                out.println("<td>" + u.getSAR() + "</td>");
                                out.println("<td>" + u.getSAA() + "</td>");
                                out.println("<td>" + u.getSAW() + "</td>");
                                out.println("<td>" + u.getSAL() + "</td>");
                                out.println("<td>" + u.getSAT() + "</td>");
                                out.println("<td>" + u.getAGUN() + "</td>");
                                out.println("<td>" + u.getNT() + "</td>");
                                out.println("<td>");
                            }
                        }else if(dicName.equals("EvolutionList")){
                            for (DIC_Base uu : dic) {
                                DIC_EvolutionList u = (DIC_EvolutionList) uu;
                                out.println("<tr>");
                                out.println("<td>" + ++cnt + "</td>");
                                out.println("<td>" + u.getSTCD() + "</td>");
//                                out.println("<td>" + u.getSWITCHDATEY() + "</td>");                                out.println("<td>" + u.get() + "</td>");
                                out.println("<td>" + u.getSWITCHDATEM() + "</td>");
                                out.println("<td>" + u.getAPAR() + "</td>");
                                out.println("<td>" + u.getSSC() + "</td>");
                                out.println("<td>" + u.getSSR() + "</td>");
                                out.println("<td>" + u.getSSDT() + "</td>");
                                out.println("<td>" + u.getSSRT() + "</td>");
                                out.println("<td>" + u.getRP() + "</td>");
                                out.println("<td>" + u.getRI() + "</td>");
                                out.println("<td>" + u.getRO() + "</td>");
                                out.println("<td>" + u.getSMB() + "</td>");
                                out.println("<td>" + u.getSMS() + "</td>");
                                out.println("<td>" + u.getSMR() + "</td>");
                                out.println("<td>" + u.getSAR() + "</td>");
                                out.println("<td>" + u.getSAA() + "</td>");
                                out.println("<td>" + u.getSAW() + "</td>");
                                out.println("<td>" + u.getSAL() + "</td>");
                                out.println("<td>" + u.getSAT() + "</td>");
                                out.println("<td>" + u.getSLPRV() + "</td>");
                                out.println("<td>" + u.getSLCT() + "</td>");
                                out.println("<td>" + u.getSLCO() + "</td>");
                                out.println("<td>" + u.getSLTO() + "</td>");
                                out.println("<td>" + u.getSLST() + "</td>");
                                out.println("<td>" + u.getLGTDD() + "</td>");
                                out.println("<td>" + u.getLGTDM() + "</td>");
                                out.println("<td>" + u.getLGTDS() + "</td>");
                                out.println("<td>" + u.getLTTDD() + "</td>");
                                out.println("<td>" + u.getLTTDM() + "</td>");
                                out.println("<td>" + u.getLTTDS() + "</td>");
                                out.println("<td>" + u.getAGUN() + "</td>");
                                out.println("<td>" + u.getNT() + "</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("WQST")){
                            for (DIC_Base uu : dic) {
                                DIC_WQST u = (DIC_WQST) uu;
                                out.println("<tr>");
                                out.println("<td>" + ++cnt + "</td>");
                                out.println("<td>" + u.getSTNM() + "</td>");
                                out.println("<td>" + u.getSTCD() + "</td>");
                                out.println("<td>" + u.getCSNM() + "</td>");
                                out.println("<td>" + u.getBSHNCD() + "</td>");
                                out.println("<td>" + u.getWID() + "</td>");
                                out.println("<td>" + u.getRVNM() + "</td>");
                                out.println("<td>" + u.getSETDATEY() + "</td>");
                                out.println("<td>" + u.getSETDATEM() + "</td>");
                                out.println("<td>" + u.getWFCSNM1() + "</td>");
                                out.println("<td>" + u.getWFCSNM2() + "</td>");
                                out.println("<td>" + u.getSLPRV() + "</td>");
                                out.println("<td>" + u.getSLCT() + "</td>");
                                out.println("<td>" + u.getSLCO() + "</td>");
                                out.println("<td>" + u.getSLTO() + "</td>");
                                out.println("<td>" + u.getSLST() + "</td>");
                                out.println("<td>" + u.getLGTDD() + "</td>");
                                out.println("<td>" + u.getLGTDM() + "</td>");
                                out.println("<td>" + u.getLGTDS() + "</td>");
                                out.println("<td>" + u.getLTTDD() + "</td>");
                                out.println("<td>" + u.getLTTDM() + "</td>");
                                out.println("<td>" + u.getLTTDS() + "</td>");
                                out.println("<td>" + u.getAGUN() + "</td>");
                                out.println("<td>" + u.getADBDSC() + "</td>");
                                out.println("<td>" + u.getANSO() + "</td>");
                                out.println("<td>" + u.getANSS() + "</td>");
                                out.println("<td>" + u.getNT() + "</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("EvaporateStation")){
                            for (DIC_Base uu : dic) {
                                DIC_EvaporateStation u = (DIC_EvaporateStation) uu;

                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTNM()+"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getBSHNCD()+"</td>");
                                out.println("<td>"+u.getSETDATEY()+"</td>");
                                out.println("<td>"+u.getSETDATEM()+"</td>");
                                out.println("<td>"+u.getSLPRV()+"</td>");
                                out.println("<td>"+u.getSLCT()+"</td>");
                                out.println("<td>"+u.getSLCO()+"</td>");
                                out.println("<td>"+u.getSLTO()+"</td>");
                                out.println("<td>"+u.getSLST()+"</td>");
                                out.println("<td>"+u.getAGUN()+"</td>");
                                out.println("<td>"+u.getLGTDD()+"</td>");
                                out.println("<td>"+u.getLGTDM()+"</td>");
                                out.println("<td>"+u.getLGTDS()+"</td>");
                                out.println("<td>"+u.getLTTDD()+"</td>");
                                out.println("<td>"+u.getLTTDM()+"</td>");
                                out.println("<td>"+u.getLTTDS()+"</td>");
                                out.println("<td>"+u.getMYAE()+"</td>");
                                out.println("<td>"+u.getEETP()+"</td>");
                                out.println("<td>"+u.getTSMD()+"</td>");
                                out.println("<td>"+u.getCHK()+"</td>");
                                out.println("<td>"+u.getNT()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("AWSCD")){
                            for (DIC_Base uu : dic) {
                                DIC_AWSCD u = (DIC_AWSCD) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getWID()+"</td>");
                                out.println("<td>"+u.getBSHN()+"</td>");
                                out.println("<td>"+u.getBSHNCD()+"</td>");
                                out.println("<td>"+u.getHN()+"</td>");
                                out.println("<td>");
                            }

                        } else if(dicName.equals("CZXXH")){
                            for (DIC_Base uu : dic) {
                                DIC_CZXXH u = (DIC_CZXXH) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTNM()+"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getBSHNNM()+"</td>");
                                out.println("<td>"+u.getHNNM()+"</td>");
                                out.println("<td>"+u.getHL()+"</td>");
                                out.println("<td>"+u.getDRAR()+"</td>");
                                out.println("<td>"+u.getNT()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZXGXX_SWEN")){
                            for (DIC_Base uu : dic) {
                                DIC_CZXGXX_SWEN u = (DIC_CZXGXX_SWEN) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getSZRQY()+"</td>");
                                out.println("<td>"+u.getSZRQM()+"</td>");
                                out.println("<td>"+u.getZLGL_GJZYZ()+"</td>");
                                out.println("<td>"+u.getZLGL_SJZYZ()+"</td>");
                                out.println("<td>"+u.getZLGL_ZXHL()+"</td>");                                out.println("<td>"+u.getZLGL_YBZ()+"</td>");
                                out.println("<td>"+u.getZLGL_SHZH()+"</td>");
                                out.println("<td>"+u.getZLGL_QT()+"</td>");
                                out.println("<td>"+u.getZLGL_SYZ()+"</td>");
                                out.println("<td>"+u.getZLGL_FZZ()+"</td>");
                                out.println("<td>"+u.getCZSX_HDZ()+"</td>");
                                out.println("<td>"+u.getCZSX_SKZ()+"</td>");
                                out.println("<td>"+u.getCZSX_HPZ()+"</td>");
                                out.println("<td>"+u.getCZSX_CLLZ()+"</td>");
                                out.println("<td>"+u.getCZSX_QDZ()+"</td>");
                                out.println("<td>"+u.getCZFL_DHKZZ()+"</td>");
                                out.println("<td>"+u.getCZFL_QYDBZ()+"</td>");
                                out.println("<td>"+u.getCZFL_XHZ()+"</td>");
                                out.println("<td>"+u.getPBSQ()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZDLWZ")){
                            for (DIC_Base uu : dic) {
                                DIC_CZDLWZ u = (DIC_CZDLWZ) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getSADR_S()+"</td>");
                                out.println("<td>"+u.getSADR_Q()+"</td>");
                                out.println("<td>"+u.getSADR_X()+"</td>");
                                out.println("<td>"+u.getSADR_Z()+"</td>");
                                out.println("<td>"+u.getSADR_JD()+"</td>");
                                out.println("<td>"+u.getLGTD_D()+"</td>");
                                out.println("<td>"+u.getLGTD_F()+"</td>");
                                out.println("<td>"+u.getLGTD_M()+"</td>");
                                out.println("<td>"+u.getLTTD_D()+"</td>");
                                out.println("<td>"+u.getLTTD_F()+"</td>");
                                out.println("<td>"+u.getLTTD_M()+"</td>");
                                out.println("<td>"+u.getDTNEL()+"</td>");
                                out.println("<td>"+u.getBASICALPLANE()+"</td>");
                                out.println("<td>"+u.getBPXZZ()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZDW")){
                            for (DIC_Base uu : dic) {
                                DIC_CZDW u = (DIC_CZDW) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getJSDW()+"</td>");
                                out.println("<td>"+u.getGLDW()+"</td>");
                                out.println("<td>"+u.getKCD()+"</td>");
                                out.println("<td>"+u.getXZQDM()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZSWTZ_SWEN")){
                            for (DIC_Base uu : dic) {
                                DIC_CZSWTZ_SWEN u = (DIC_CZSWTZ_SWEN) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getDNPJJLL()+"</td>");
                                out.println("<td>"+u.getZDLL()+"</td>");
                                out.println("<td>"+u.getZDLLSJ()+"</td>");
                                out.println("<td>"+u.getZXLL()+"</td>");
                                out.println("<td>"+u.getZXLLSJ()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZCYXM_SWEN")){
                            for (DIC_Base uu : dic) {
                                DIC_CZCYXM_SWEN u = (DIC_CZCYXM_SWEN) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getLL()+"</td>");
                                out.println("<td>"+u.getSWEI()+"</td>");
                                out.println("<td>"+u.getCW()+"</td>");
                                out.println("<td>"+u.getJS()+"</td>");
                                out.println("<td>"+u.getZF()+"</td>");
                                out.println("<td>"+u.getBJ()+"</td>");
                                out.println("<td>"+u.getSZ()+"</td>");
                                out.println("<td>"+u.getXYZ()+"</td>");
                                out.println("<td>"+u.getTYZ()+"</td>");
                                out.println("<td>"+u.getHCZ()+"</td>");
                                out.println("<td>"+u.getKF()+"</td>");
                                out.println("<td>"+u.getSW()+"</td>");
                                out.println("<td>"+u.getBQ()+"</td>");
                                out.println("<td>"+u.getFZQX()+"</td>");
                                out.println("<td>"+u.getDXS()+"</td>");
                                out.println("<td>"+u.getSQ()+"</td>");
                                out.println("<td>"+u.getSWDC()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZSYXM")){
                            for (DIC_Base uu : dic) {
                                DIC_CZSYXM u = (DIC_CZSYXM) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getJL()+"</td>");
                                out.println("<td>"+u.getZF()+"</td>");
                                out.println("<td>"+u.getCYFF()+"</td>");
                                out.println("<td>"+u.getDXS()+"</td>");
                                out.println("<td>"+u.getQT()+"</td>");
                                out.println("<td>"+u.getJJBSWZ()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZGLFS_SWEN")){
                            for (DIC_Base uu : dic) {
                                DIC_CZGLFS_SWEN u = (DIC_CZGLFS_SWEN) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getCNZC()+"</td>");
                                out.println("<td>"+u.getXQZC()+"</td>");
                                out.println("<td>"+u.getXC()+"</td>");
                                out.println("<td>"+u.getWT()+"</td>");
                                out.println("<td>"+u.getZDJH()+"</td>");
                                out.println("<td>");

                            }

                        }else if(dicName.equals("CZCLFS")){
                            for (DIC_Base uu : dic) {
                                DIC_CZCLFS u = (DIC_CZCLFS) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getLDJDDD()+"</td>");
                                out.println("<td>"+u.getLDSY()+"</td>");
                                out.println("<td>"+u.getLDLCDX()+"</td>");
                                out.println("<td>"+u.getCCJD()+"</td>");
                                out.println("<td>"+u.getCCFJD()+"</td>");
                                out.println("<td>"+u.getQC()+"</td>");
                                out.println("<td>"+u.getSGJZW()+"</td>");
                                out.println("<td>"+u.getADCP()+"</td>");
                                out.println("<td>"+u.getQT()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZXXJL")){
                            for (DIC_Base uu : dic) {
                                DIC_CZXXJL u = (DIC_CZXXJL) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getZXJC()+"</td>");
                                out.println("<td>"+u.getRGGD()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZXGXX_SWEI")){
                            for (DIC_Base uu : dic) {
                                DIC_CZXGXX_SWEI u = (DIC_CZXGXX_SWEI) uu;

                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getSZRQY()+"</td>");
                                out.println("<td>"+u.getSZRQM()+"</td>");
                                out.println("<td>"+u.getZLGL_JBZ()+"</td>");
                                out.println("<td>"+u.getZLGL_ZXHL()+"</td>");
                                out.println("<td>"+u.getZLGL_SHZH()+"</td>");
                                out.println("<td>"+u.getZLGL_QT()+"</td>");
                                out.println("<td>"+u.getCZSX_HDZ()+"</td>");
                                out.println("<td>"+u.getCZSX_SKZ()+"</td>");
                                out.println("<td>"+u.getCZSX_HPZ()+"</td>");
                                out.println("<td>"+u.getCZSX_CWZ()+"</td>");
                                out.println("<td>"+u.getCZSX_QDZ()+"</td>");
                                out.println("<td>"+u.getCZSX_QTZ()+"</td>");
                                out.println("<td>"+u.getPBSQ()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZSWTZ_SWEI")){
                            for (DIC_Base uu : dic) {
                                DIC_CZSWTZ_SWEI u = (DIC_CZSWTZ_SWEI) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getZGSW()+"</td>");
                                out.println("<td>"+u.getZGSWSJ()+"</td>");
                                out.println("<td>"+u.getZDSW()+"</td>");
                                out.println("<td>"+u.getZDSWSJ()+"</td>");
                                out.println("<td>"+u.getSCHG()+"</td>");
                                out.println("<td>"+u.getPJTS()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZCYXM_SWEI")){
                            for (DIC_Base uu : dic) {
                                DIC_CZCYXM_SWEI u = (DIC_CZCYXM_SWEI) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getSWEI()+"</td>");
                                out.println("<td>"+u.getCW()+"</td>");
                                out.println("<td>"+u.getJS()+"</td>");
                                out.println("<td>"+u.getZF()+"</td>");
                                out.println("<td>"+u.getBJ()+"</td>");
                                out.println("<td>"+u.getSZ()+"</td>");
                                out.println("<td>"+u.getSWEN()+"</td>");
                                out.println("<td>"+u.getBQ()+"</td>");
                                out.println("<td>"+u.getFZQX()+"</td>");
                                out.println("<td>"+u.getDXS()+"</td>");
                                out.println("<td>"+u.getSQ()+"</td>");
                                out.println("<td>"+u.getSWDC()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZGLFS_SWEI")){
                            for (DIC_Base uu : dic) {
                                DIC_CZGLFS_SWEI u = (DIC_CZGLFS_SWEI) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getCNZC()+"</td>");
                                out.println("<td>"+u.getXQZC()+"</td>");
                                out.println("<td>"+u.getXC()+"</td>");
                                out.println("<td>"+u.getWT()+"</td>");
                                out.println("<td>");

                            }

                        }else if(dicName.equals("CZSWGC")){
                            for (DIC_Base uu : dic) {
                                DIC_CZSWGC u = (DIC_CZSWGC) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getFZ()+"</td>");
                                out.println("<td>"+u.getCSB()+"</td>");
                                out.println("<td>"+u.getYLS()+"</td>");
                                out.println("<td>"+u.getDZSC()+"</td>");
                                out.println("<td>"+u.getSC()+"</td>");
                                out.println("<td>"+u.getQT()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZXXJL_SWEI")){
                            for (DIC_Base uu : dic) {
                                DIC_CZXXJL_SWEI u = (DIC_CZXXJL_SWEI) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getZDCB()+"</td>");
                                out.println("<td>"+u.getPTZJ()+"</td>");
                                out.println("<td>"+u.getGTCC()+"</td>");
                                out.println("<td>"+u.getRGGD()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZXGXX_YL")){
                            for (DIC_Base uu : dic) {
                                DIC_CZXGXX_YL u = (DIC_CZXGXX_YL) uu;

                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getSZRQY()+"</td>");
                                out.println("<td>"+u.getSZRQM()+"</td>");
                                out.println("<td>"+u.getZLGL_JBZ()+"</td>");
                                out.println("<td>"+u.getZLGL_ZXHL()+"</td>");
                                out.println("<td>"+u.getZLGL_SHZH()+"</td>");
                                out.println("<td>"+u.getZLGL_QT()+"</td>");
                                out.println("<td>"+u.getPBSQ()+"</td>");
                                out.println("<td>");

                            }

                        }else if(dicName.equals("CZDW_YL")){
                            for (DIC_Base uu : dic) {
                                DIC_CZDW_YL u = (DIC_CZDW_YL) uu;

                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getGLDW()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("TZZ")){
                            for (DIC_Base uu : dic) {
                                DIC_TZZ u = (DIC_TZZ) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getQKGD()+"</td>");
                                out.println("<td>"+u.getDNPJJYL()+"</td>");
                                out.println("<td>"+u.getZDJYL()+"</td>");
                                out.println("<td>"+u.getCXNF()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZCYXM_YL")){
                            for (DIC_Base uu : dic) {
                                DIC_CZCYXM_YL u = (DIC_CZCYXM_YL) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getJS()+"</td>");
                                out.println("<td>"+u.getZF()+"</td>");
                                out.println("<td>"+u.getJSSZ()+"</td>");
                                out.println("<td>"+u.getFZQX()+"</td>");
                                out.println("<td>"+u.getSQ()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZGC")){
                            for (DIC_Base uu : dic) {
                                DIC_CZGC u = (DIC_CZGC) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getFDS()+"</td>");
                                out.println("<td>"+u.getHXS()+"</td>");
                                out.println("<td>"+u.getYLQ()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZXXJL_YL")){
                            for (DIC_Base uu : dic) {
                                DIC_CZXXJL_YL u = (DIC_CZXXJL_YL) uu;
                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getZDCB()+"</td>");
                                out.println("<td>"+u.getPTZJ()+"</td>");
                                out.println("<td>"+u.getGTCC()+"</td>");
                                out.println("<td>"+u.getRGGD()+"</td>");
                                out.println("<td>");
                            }

                        }else if(dicName.equals("CZGLFS_YL")){
                            for (DIC_Base uu : dic) {
                                DIC_CZGLFS_YL u = (DIC_CZGLFS_YL) uu;

                                out.println("<tr>");
                                out.println("<td>"+ ++cnt +"</td>");
                                out.println("<td>"+u.getSTCD()+"</td>");
                                out.println("<td>"+u.getWT()+"</td>");
                                out.println("<td>");
                            }

                        }

                    }else{
                        out.println("<p>没有找到数据表信息。</p>");
                    }
                    %>

                </tbody>
            </table>
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
