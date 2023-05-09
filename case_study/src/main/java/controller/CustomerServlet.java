package controller;

import models.model.Account;
import models.model.Customer;
import models.service.ICustomerService;
import models.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                break;
            default:
                showList(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request,response);
                break;
        }
    }

    public void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.getAllCustomer();
        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("/customer/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    public void createCustomer(HttpServletRequest request,HttpServletResponse response){
        String userName=request.getParameter("userName");
        String password=request.getParameter("password");
        String fullName =request.getParameter("fullName");
        String email=request.getParameter("email");
        String phoneNumber=request.getParameter("phoneNumber");
        String address=request.getParameter("address");
        Account account =new Account(userName,password);
        Customer customer = new Customer(fullName,email,phoneNumber,address,account);
        boolean check =customerService.saveCustomer(customer);
        String mess="";
        if (check){
            mess="Thêm thành công";
        }else {
            mess="Thêm thất bại";
        }
        request.setAttribute("mess",mess);
        try {
            request.getRequestDispatcher("/customer/create.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
