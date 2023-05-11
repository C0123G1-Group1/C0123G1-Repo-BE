package controller;

import models.model.ProductDAO;
import models.service.IOrderDetailSevice;
import models.service.impl.OrderDetailServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderDetailServlet", value = "/order-detail-servlet")
public class OrderDetailServlet extends HttpServlet {
    IOrderDetailSevice orderDetailSevice = new OrderDetailServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }

        switch (action){
            case "orderDetail":
                orderDetail(request, response);
                break;
            case "delete":
                deleteOrderDetail(request, response);
                break;
        }
    }

    private void deleteOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productOrderDetailId = Integer.parseInt(request.getParameter("productOrderDetailId"));
        orderDetailSevice.deleteOrderDetail(productOrderDetailId);
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        List<ProductDAO> productDAOList = orderDetailSevice.getOrderDetailProduct(customerId);
        request.setAttribute("productDAOList", productDAOList);
        request.getRequestDispatcher("/admin/order_detail.jsp").forward(request, response);
    }

    private void orderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        List<ProductDAO> productDAOList = orderDetailSevice.getOrderDetailProduct(customerId);
        request.setAttribute("productDAOList", productDAOList);
        request.getRequestDispatcher("/admin/order_detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
