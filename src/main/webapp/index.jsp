<%@ page import="java.util.List" %>
<%@ page import="com.example.domain.Pet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%@ page import="com.example.domain.*" %>
<%@ page import="com.example.utils.JDBCUtils" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meat charset="UTF-8">
        <link rel="stylesheet" href="css/bootstrap-4.6.1.min.css"/>
        <link rel="stylesheet" hrdf="css/font-awesome-3.2.1.min.css"/>
        <link rel="stylesheet" href="css/site.css"/>
        <script src="js/jquery-3.6.0.min.js"></script>
    </meat>
    <title>宠物商店</title>
</head>
<body>
    <div class="d-flex flex-column flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <img src="img/logo.png" width="64" height="64" class="mb-2">
        <h5 class="my-0 mr-md-auto font-weight-normal">宠物商店</h5>"
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="#">首页</a>
            <a class="p-2 text-dark" href="#">购物车</a>
            <a class="p-2 text-dark" href="#">联系客服</a>
        </nav>
    </div>
    <div class="container">
        <div class="card-deck mb-3 text-center">
                <c:forEach items="${petList}" var="pet">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-header">
                            <a href="${ctx}/DetailServlet?id=${pet.id}">
                                <img src="${ctx}/petimg/${pet.photo}" class="pet-pic"/>
                            </a>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title">
                                <small class="text-muted">${pet.title}</small>
                            </h1>
                            <p class="pet-desc">${pet.descs}</p>
                            <p><span class="pet-desc">${pet.tag}</span> </p>
                            <p class="pet-price">￥${pet.price}</p>
                            <a class="btn btn-lg btn-block btn-outline-primary" href="${ctx}/DetailServlet?id=${pet.id}">查看详情</a>
                        </div>
                    </div>
                </c:forEach>
        </div>
    </div>
    <footer class="footer mt-1 py-3">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md">
                    <img src="img/logo.png" width="24" height="24" class="mb-2">
                    <small class="d-block mb-3 text-muted">@ 2023</small>
                </div>
                <div class="col-6 col-md">
                    <h5>详情备案信息</h5>
                    <ul class="list-unstyled txet-small">
                        <li><a class="text-muted" href="#">备案号</a> </li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5>详情工商信息</h5>
                    <ul class="list-unstyled txet-small">
                        <li><a class="text-muted" href="#">商业资质</a> </li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5>关于我们团队</h5>
                    <ul class="list-unstyled txet-small">
                        <li><a class="text-muted" href="#">Geely最强项目团队</a> </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
