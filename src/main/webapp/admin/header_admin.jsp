<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>游戏商城-后台管理</title>
    <link rel="shortcut icon" href="img/favicon.ico" />
    <link rel="stylesheet" href="css/bootstrap-4.6.1.min.css" />
    <link rel="stylesheet" href="css/font-awesome-3.2.1.min.css">
    <link rel="stylesheet" href="css/site.css" />
    <script src="js/jquery-3.6.0.min.js"></script>
    <div id="content" style="position:fixed;top:0;left:0;width:100%;height:100%;z-index:0;"></div>
    <style>        /* 新增样式 */
    #content-wrapper {
        position: relative;
        z-index: 1; /* 确保内容在粒子效果之上 */
        width: 100%;
        height: 100%;
        overflow: auto; /* 允许滚动内容 */
    }

    /* 确保canvas不遮挡文本选择 */
    canvas {
        pointer-events: none;
    }
    </style>
</head>
<body>
<!-- 新增内容容器 -->
<div id="content-wrapper">
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <img src="img/logo1.png" width="64" height="64" class="mb-2">
    <h5 class="my-0 mr-md-auto font-weight-normal">游戏商城-后台管理</h5>
</div>