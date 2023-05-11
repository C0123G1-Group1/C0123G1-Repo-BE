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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    request.getRequestDispatcher("/customer/create.jsp").forward(request,response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            case "edit":
                sendCustomer(request,response);
                break;
            case "search":
                searchCustomer(request, response);
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
                createCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "edit":
                editCustomer(request,response);
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

    public void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        Account account = new Account(userName, password);
        Customer customer = new Customer(fullName, email, phoneNumber, address, account);
        boolean check = customerService.saveCustomer(customer);
        String mess = "";
        if (check) {
            mess = "Thêm thành công";
        } else {
            mess = "Thêm thất bại";
        }
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("/customer/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("customerId"));
        String account = request.getParameter("nameAccount");
        boolean check = customerService.deleteCustomer(id, account);
        String mess = "";
        if (check) {
            mess = "Xóa thành công";
        } else {
            mess = "Xóa thất bại";
        }
        request.setAttribute("mess", mess);
        List<Customer> customerList = customerService.getAllCustomer();
        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("/customer/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String nameCustomer = request.getParameter("nameCustomer");
        String addressCustomer = request.getParameter("addressCustomer");
        List<Customer> customerList = customerService.searchCustomer(nameCustomer, addressCustomer);
        request.setAttribute("nameCustomer",nameCustomer);
        request.setAttribute("addressCustomer",addressCustomer);
        if (customerList.size() == 0) {
            List<Customer> customerList1 = customerService.getAllCustomer();
            request.setAttribute("customerList", customerList1);
            try {
                request.getRequestDispatcher("/customer/list.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("customerList", customerList);
            try {
                request.getRequestDispatcher("/customer/list.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }
    private void sendCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("customerId"));
        Customer customer =customerService.getCustomer(id);
        request.setAttribute("customer",customer);
        try {
            request.getRequestDispatcher("/customer/edit.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    public void editCustomer(HttpServletRequest request,HttpServletResponse response){
        int userId= Integer.parseInt(request.getParameter("userId"));
        String userName= request.getParameter("userNameHidden");
        String password= request.getParameter("password");
        String fullName= request.getParameter("fullName");
        String email= request.getParameter("email");
        String phoneNumber= request.getParameter("phoneNumber");
        String address= request.getParameter("address");
        Account account =new Account(userId,userName,password);
        Customer customer = new Customer(fullName, email, phoneNumber , address, account);
        boolean check = customerService.editCustomer(customer);
        String mess = "";
        if (check) {
            mess = "Sửa thành công";
        } else {
            mess = "Sửa thất bại";
        }
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("/customer/edit.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
