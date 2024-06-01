<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<%@ include file="lunbo.jsp"%>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-1">
            <a class="navbar-brand" href="${ctx}/IndexServlet?category_id=0">全部分类</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <c:forEach items="${categoryList}" var="category">
                        <c:if test="${category.id == current_category_id}">
                            <%--与参数 current_category_id 相等的分类名称，设置为选中状态,添加样式类名 active--%>
                            <li class="nav-item active">
                                <a class="nav-link bg-white" href="${ctx}/IndexServlet?category_id=${category.id}">
                                    <b>${category.name}</b>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${category.id != current_category_id}">
                            <li class="nav-item">
                                <a class="btn btn-light" href="${ctx}/IndexServlet?category_id=${category.id}">${category.name}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
                <form class="form-inline my-2 my-lg-0" action="${ctx}/SearchServlet" method="post" >
                    <input class="form-control mr-sm-2" type="text" name="key" placeholder="关键字">
                    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">查询</button>
                </form>
            </div>
        </nav>
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
<%@ include file="footer.jsp"%>
