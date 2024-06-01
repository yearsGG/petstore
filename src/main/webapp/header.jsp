<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>游戏商城</title>
    <link rel="shortcut icon" href="img/favicon.ico" />
    <link rel="stylesheet" href="css/bootstrap-4.6.1.min.css" />
    <link rel="stylesheet" href="css/font-awesome-3.2.1.min.css">
    <link rel="stylesheet" href="css/site.css" />
    <script src="js/jquery-3.6.0.min.js"></script>
<%--    <style>--%>
<%--        body {--%>
<%--            margin:0px;--%>
<%--            background: url(img/bj5.png) no-repeat;--%>
<%--            background-size:100% 100%;--%>
<%--            background-attachment:fixed;--%>
<%--    }--%>
<%--    </style>--%>
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
    <h5 class="my-0 mr-md-auto font-weight-normal">游戏商城</h5>
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="${ctx}/IndexServlet"><i class="fa fa-key" aria-hidden="true"></i>首页</a>
        <c:if test="${empty user}">
            <a class="p-2 text-dark" href="${ctx}/login.jsp">请登录</a>
        </c:if>
        <c:if test="${!empty user}">
            <a class="p-2 text-dark" href="${ctx}/UserServlet">欢迎：<b>${user.username}</b></a>
        </c:if>

        <%-- <a class="p-2 text-dark" href="${ctx}/cart.jsp">购物车</a> --%>

        <%-- 第12章 优化代码  增加显示购物车内数量  --%>
        <c:if test="${empty cart}">
            <a class="p-2 text-dark" href="${ctx}/cart.jsp">购物车</a>
        </c:if>
        <c:if test="${!empty cart}">
            <a class="p-2 text-dark" href="${ctx}/cart.jsp">购物车(<span id="cart-item-quantity">${cart.getTotalCount()}</span>)</a>
        </c:if>
        <a class="p-2 text-dark" href="gywm.jsp">关于我们</a>
    </nav>
</div>
