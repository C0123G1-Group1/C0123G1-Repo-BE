package controller;


import models.model.Customer;
import models.service.IAdminService;
import models.service.ICustomerService;
import models.service.impl.AdminServiceImpl;
import models.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "AccountServlet", value = "/account-servlet")
public class AccountServlet extends HttpServlet {
    ICustomerService customerService = new CustomerServiceImpl();
    IAdminService adminService = new AdminServiceImpl();

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
                    boolean result = adminService.checkAccountAdmin(userName, password);
                    if (result) {

                        request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
                    } else {
                        request.setAttribute("userName", userName);
                        request.setAttribute("action", "fail");
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                } else {
////                    boolean result = customerService.checkAccount(userName, password);
//                    if (result) {
//                        request.getRequestDispatcher("/users/user.jsp").forward(request, response);
//                    } else {
//                        request.setAttribute("userName", userName);
//                        request.setAttribute("status", "fail");
//                        request.getRequestDispatcher("/index.jsp").forward(request, response);
//                    }
                }
        }

    }
}
