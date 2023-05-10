package controller;


import models.model.Customer;
import models.model.Product;
import models.service.IAccountService;
import models.service.ICustomerService;
import models.service.IProductService;
import models.service.impl.AccountReposiroryImpl;
import models.service.impl.CustomerServiceImpl;
import models.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "AccountServlet", value = "/account-servlet")
public class AccountServlet extends HttpServlet {
    ICustomerService customerService = new CustomerServiceImpl();
    IAccountService accountService = new AccountReposiroryImpl();
    IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "register":
                Customer customer =new Customer();
                boolean statusRegister = customerService.saveCustomer(customer);
                request.setAttribute("statusRegister", statusRegister);
                request.getRequestDispatcher("/account/register_form.jsp").forward(request, response);
                break;
            case "login":
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                if (userName.equals("admin")) {
                    boolean statusLogin = accountService.checkAccount(userName,password);
                    if (statusLogin) {
                        request.setAttribute("statusLogin",statusLogin);
                        request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
                    } else {
                        request.setAttribute("userName", userName);
                        request.setAttribute("statusLogin",statusLogin);
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                } else {
                    boolean statusLogin = accountService.checkAccount(userName,password);
                    if (statusLogin) {
                        List<Product> productList = productService.getList();
                        request.setAttribute("productList",productList);
                        request.getRequestDispatcher("/users/home.jsp").forward(request, response);
                    } else {
                        request.setAttribute("userName", userName);
                        request.setAttribute("statusLogin",statusLogin);
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                }
        }

    }
}
