<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<div class="container">
    <div class="row no-gutters border rounded flex-md-row mb-4 shadow-sm h-md-250">
        <div class="col-auto d-none d-lg-block">
            <video width="300" height="400" controls autoplay muted loop>
                <source src="${ctx}/mp4/${pet.mp4}" type="video/mp4">
             </video>
        </div>
<%--        <div class="col-auto d-none d-lg-block">--%>
<%--            <img src="${ctx}/petimg/${pet.photo}" width="300" heght="400" class="mb-2">--%>
<%--        </div>--%>
        <div class="col p-4 d-flex flex-column">
            <h3 class="d-inline-block mb-2 text-dark">${pet.title}</h3>
            <div class="mb-2 text-muted"><span class="pet-tag">${pet.tag}</span></div>
            <p class="card-text">${pet.descs}</p>
            <p>价格：￥<span id="pet-price">${pet.price}</span></p>
            <p>库存：<span id="pet-stock">${pet.stock}</span></p>
            <form action="${ctx}/AddToCartServlet" method="post">
                <p>
                    <label for="pet-quantity">数量：</label>
                    <input type="text" id="pet-quantity" name="quantity" value="1">
                    <input type="hidden" name="id" value="${pet.id}">
                </p>
                <nav>
                    <input class="btn btn-warning" type="submit" value="加入购物车">
                    <a class="btn btn-warning" href="${ctx}/IndexServlet">返回首页</a>
                </nav>
            </form>
            <%-- 第12章 优化代码 校验购买数量是否小于等于库存数量  --%>
            <div class="text-center">
                <span id="msg" class="text-danger"></span>
            </div>
        </div>
    </div>
</div>
<%@ include file="pinglun.jsp"%>
<%@ include file="footer.jsp"%>

<%-- 第12章 优化代码 校验购买数量是否小于等于库存数量  --%>
<script type="text/javascript">
    $(document).ready(function () {
        $("form").submit(function () {
            $("#msg").text("");
            let quantity = $("#pet-quantity").val(); //表单元素，使用val()方法获取值
            let stock = $("#pet-stock").text();//span元素，使用text()方法获取内容
            if (parseInt(quantity) > parseInt(stock)){ //字符串转数字后比较大小
                $("#msg").text("库存不足，请修改购买数量。");
                //返回false，表单不提交
                return false;
            }
        });
    });
</script>