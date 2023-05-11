package controller;


import models.model.Account;
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
import javax.servlet.http.HttpSession;
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
                registerAccount(request, response);
                Customer customer;
                break;
            case "login":
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                Account account = null;
                List<Account> accountList = accountService.getAllAccount();
                for (Account a : accountList) {
                    if (userName.equals(a.getUserName()) && password.equals(a.getPassword())) {
                        account = a;
                        break;
                    }
                }
                if (account != null) {
                    customer = customerService.getCustomerById(account.getId());
                    HttpSession session = request.getSession();
                    session.setAttribute("userSession", customer);
                    String role = accountService.checkRole(account.getId());
                    if (role.equals("users")) {
                        List<Product> productList = productService.getList();
                        request.setAttribute("productList", productList);
                        request.getRequestDispatcher("/users/test.jsp").forward(request, response);
                    } else if (role.equals("admin")) {
                        request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("statusLogin", false);
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
                break;
        }
    }

    private void registerAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        Account account = new Account(customerName,password);
        Customer customer = new Customer(customerName,email,phoneNumber,address,account);
        boolean statusRegister = customerService.saveCustomer(customer);
        request.setAttribute("statusRegister", statusRegister);
        request.getRequestDispatcher("/account/register_form.jsp").forward(request, response);
    }
}
