<%@ page import="com.waterManageSystem.Bean.Dictionary.DIC_Base" %>
<%@ page import="com.waterManageSystem.Service.DictionaryService" %>
<%@ page import="com.waterManageSystem.Service.impl.DictionaryServiceImpl" %>
<%@ page import="com.waterManageSystem.Bean.Dictionary.DIC_AWSCD" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>弹窗示例</title>
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
  </style>
</head>
<body>
<h2>JSP弹窗示例</h2>
<button onclick="showPopup()">显示弹窗</button>

<div id="popup">
  <form id="popupForm" action="submit.jsp" method="post">
    <label for="name">名字:</label>
    <input type="text" id="name" name="name"><br><br>
    <label for="email">电子邮件:</label>
    <input type="email" id="email" name="email"><br><br>
    <button type="button" onclick="submitForm()">提交</button>
    <button type="button" onclick="hidePopup()">关闭</button>
  </form>
</div>
</body>
</html>
