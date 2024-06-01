<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>评论区</title>
  <style>
    /* 评论区整体样式 */
    #main {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      background-color: #f8f9fa;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    /* 标题样式 */
    h1 {
      font-size: 24px;
      color: #343a40;
      margin-bottom: 10px;
    }

    /* 文本框样式 */
    textarea {
      width: 100%;
      height: 100px;
      resize: vertical;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ced4da;
      border-radius: 4px;
    }

    /* 按钮样式 */
    button {
      display: block;
      width: 100%;
      padding: 10px;
      font-size: 16px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-top: 10px;
    }

    /* 评论样式 */
    #commend {
      list-style-type: none;
      margin: 0;
      padding: 0;
    }

    #commend p {
      margin: 0;
      padding: 10px;
      font-size: 16px;
      line-height: 1.5;
      border-left: 5px solid #007bff;
      background-color: #fff;
      margin-bottom: 10px;
    }

    #commend hr {
      margin: 5px 0;
      border-top: 1px solid #ccc;
    }

    /* 时间戳样式 */
    #commend time {
      font-size: 14px;
      color: #6c757d;
      float: right;
    }
  </style>
</head>

<body>
  <div id="main">
    <h1>评论区</h1><hr>
    <textarea id="typing">输入文字</textarea>
    <button id="btn">发送评论</button>
    <ul id="commend"></ul>
  </div>
  <script>
    document.getElementById("btn").onclick = function() { send(); };
    function send() {
var g = new Date();
var value = document.getElementById("typing").value;
var li = document.createElement("li");
var p = document.createElement("p");
var time = document.createElement("time");
<c:if test="${empty user}">
  p.innerHTML = "访客：" + value;
</c:if>

<c:if test="${!empty user}">
      p.innerHTML = "${user.username}：" + value;
      </c:if>
  time.textContent = g.toUTCString();
  li.appendChild(p);
  li.appendChild(time);
  document.getElementById("commend").appendChild(li);
  document.getElementById("typing").value = "";
  }
  </script>
  </body>
  </html>
