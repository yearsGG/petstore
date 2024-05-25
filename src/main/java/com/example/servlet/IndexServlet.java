package com.example.servlet;

import com.example.dao.PetDao;
import com.example.domain.Pet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        /* 第9章，首页最新12只宠物代码(不分类）
        //1.获取请求参数（本次请求处理中无参数）
        //2.使用模型（M）中的对象执行业务方法，获取业务数据
        PetDao petDao = new PetDao();
        List<Pet> petList = petDao.getNewList();
        //3.将数据传递给视图（V）并展示（请求转发，浏览器的URL无变化）
        request.setAttribute("petList",petList);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
        //4.重定向
//        request.getSession().setAttribute("petList",petList);
//        response.sendRedirect(request.getContextPath()+"/index.jsp");



        //第12章，优化代码，首页增加分类浏览功能
        //1.获取请求参数 分类编号 category_id
//        String category_id = request.getParameter("category_id");
//        if (category_id == null){ //默认无分类，Category_id设置为0
//            category_id = "0";
//        }
//        //2.使用模型（M）中的对象执行业务方法，获取业务数据
//        PetDao petDao = new PetDao();
//        List<Pet> petList = petDao.getNewListByCategoryId(Integer.parseInt(category_id));
//        CategoryDao categoryDao = new CategoryDao();
//        List<Category> categoryList = categoryDao.getList();
//        //3.将数据传递给视图（V）并展示（请求转发，浏览器的URL无变化）
//        request.setAttribute("petList",petList);
//        request.setAttribute("categoryList",categoryList);
//        request.setAttribute("current_category_id",category_id);
//        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
