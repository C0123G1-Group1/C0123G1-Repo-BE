package controller;

import models.model.*;
import models.service.ICustomerService;
import models.service.IOrderDetailSevice;
import models.service.IOrderService;
import models.service.IProductService;
import models.service.impl.CustomerServiceImpl;
import models.service.impl.OrderDetailServiceImpl;
import models.service.impl.OrderServiceImpl;
import models.service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/order-servlet")
public class OrderServlet extends HttpServlet {
    IOrderService orderService = new OrderServiceImpl();
    ICustomerService customerService = new CustomerServiceImpl();
    IProductService productService = new ProductServiceImpl();
    IOrderDetailSevice orderDetailSevice = new OrderDetailServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        List<Product> productList;
        int customerId;
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                customerId = Integer.parseInt(request.getParameter("customerId"));
                orderService.addOrder(customerId);
                Customer customer = customerService.getCustomerById(customerId);
                productList = productService.getList();
                request.setAttribute("customerId", customer.getId());
                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/users/product.jsp").forward(request, response);
                break;
            case "delete":
                customerId = Integer.parseInt(request.getParameter("customerId"));
                int productOrderDetailId = Integer.parseInt(request.getParameter("productOrderDetailId"));
                boolean statusOrderDetail = orderDetailSevice.deleteOrderDetail(productOrderDetailId);
                List<ProductDAO> productDAOList = orderDetailSevice.getOrderDetailProduct(customerId);
                request.setAttribute("statusOrderDetail",statusOrderDetail);
                request.setAttribute("productDAOList",productDAOList);
                request.getRequestDispatcher("/users/order_detail.jsp").forward(request,response);
                break;
            case "buy":
                buyOrderDetail(request, response);
                break;
            case "displayProducts":
                productList = productService.getList();
                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/users/product.jsp").forward(request, response);
                break;
            case "orderDetail":
                orderDetail(request, response);
                break;
            default:
                List<CustomerDAO> customerDAOList = orderDetailSevice.getCustomerOrder();
                request.setAttribute("customerDAOList", customerDAOList);
                request.getRequestDispatcher("/admin/order.jsp").forward(request, response);
        }
    }

    private void orderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId;
        customerId = Integer.parseInt(request.getParameter("customerId"));
        List<ProductDAO> productDAOList = orderDetailSevice.getOrderDetailProduct(customerId);
        request.setAttribute("productDAOList", productDAOList);
        request.getRequestDispatcher("/users/order_detail.jsp").forward(request, response);
    }

    private void buyOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId;
        int productId = Integer.parseInt(request.getParameter("productId"));
        customerId = Integer.parseInt(request.getParameter("customerId"));
        orderService.addOrder(customerId);
        int orderId = orderService.getOrderId(customerId);
        Product product = productService.findById(productId);
        request.setAttribute("orderId", orderId);
        request.setAttribute("customerId", customerId);
        request.setAttribute("productId", productId);
        request.setAttribute("productName", product.getName());
        request.setAttribute("productType", product.getProductType());
        request.setAttribute("productImage", product.getProductImage());
        request.setAttribute("productDescribe", product.getDescribe());
        request.setAttribute("price", product.getPrice());
        request.getRequestDispatcher("/users/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "createOrderDetail":
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                int customerId = Integer.parseInt(request.getParameter("customerId"));
                int productId = Integer.parseInt(request.getParameter("productId"));
                int productType = Integer.parseInt(request.getParameter("productType"));
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                OrderDetail orderDetail = new OrderDetail(orderId, customerId, productId, productType, price, quantity);
                boolean statusOrderDetail = orderDetailSevice.addOrderDetail(orderDetail);
                List<Product> productList = productService.getList();
                request.setAttribute("productList", productList);
                request.setAttribute("statusOrderDetail", statusOrderDetail);
                request.getRequestDispatcher("/users/home.jsp").forward(request, response);
                break;
        }
    }
}
