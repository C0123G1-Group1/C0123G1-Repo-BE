package controller;



import models.service.ICustomerService;
import models.service.IProductService;
import models.service.impl.AccountServiceImpl;
import models.service.impl.CustomerServiceImpl;
import models.service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;



@WebServlet(name = "AccountServlet", value = "/account-servlet")
public class AccountServlet extends HttpServlet {
    ICustomerService customerService = new CustomerServiceImpl();
    IAccountService accountService = new AccountServiceImpl();
    IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "homeUser":
                List<Product> productList = productService.getList();
                List<Product> limitList = productList.subList(0, Math.min(15,productList.size()));
                request.setAttribute("productList", limitList);
                request.setAttribute("productListSize",productList.size());
                request.getRequestDispatcher("/users/home.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
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
                        List<Product> limitList = productList.subList(0, Math.min(15,productList.size()));
                        request.setAttribute("productList", limitList);
                        request.setAttribute("productListSize",productList.size());
                        request.getRequestDispatcher("/users/home.jsp").forward(request, response);
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
        Account account = new Account(customerName, password);
        Customer customer = new Customer(customerName, email, phoneNumber, address, account);
        boolean statusRegister = customerService.saveCustomer(customer);
        request.setAttribute("statusRegister", statusRegister);
        request.getRequestDispatcher("/account/register_form.jsp").forward(request, response);
    }
}