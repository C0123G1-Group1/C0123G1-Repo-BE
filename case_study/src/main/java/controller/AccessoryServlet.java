package controller;
import models.model.Product;
import models.service.impl.accessory.IAccessoryService;
import models.service.impl.accessory.impl.AccessoryService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccessoryServlet",urlPatterns = "/accessory")
public class AccessoryServlet extends HttpServlet {
    private IAccessoryService accessoryService = new AccessoryService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = accessoryService.findById(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("view/accessorys/edit.jsp").forward(request, response);

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/accessorys/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = accessoryService.getList();
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("view/accessorys/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "delete":
                removeProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "search":
                seachProduct(request, response);
                break;

        }
    }

    private void seachProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        List<Product> searchProductList = null;
        switch (price) {
            case 1:
                searchProductList=accessoryService.search(name,0,1000000);
                break;
            case 2:
                searchProductList = accessoryService.search(name, 0, 1000000);
                break;
            case 3:
                searchProductList = accessoryService.search(name, 1000001, 3000000);
                break;
            case 4:
                searchProductList = accessoryService.search(name, 3000001, 5000000);
                break;
            case 5:
                searchProductList = accessoryService.search(name, 5000001, 10000000);
                break;
        }
        request.setAttribute("productList", searchProductList);
        try {
            request.getRequestDispatcher("view/accessorys/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int productType = Integer.parseInt(request.getParameter("productType"));
        String describe = request.getParameter("describe");
        double price = Double.parseDouble(((request.getParameter("price"))));
        String productImage = request.getParameter("productImage");
        Product product = new Product(id, name, productType, describe, price, productImage);
        boolean checkEdit = accessoryService.edit(product);
        String mess;
        if (checkEdit) {
            mess = "Editing is successful";
        } else {
            mess = "Deletion failed";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean checkRemove = accessoryService.remove(id);
        if (checkRemove) {
            checkRemove = accessoryService.remove(id);
        }
        String mess;
        if (checkRemove) {
            mess = "Deletion failed";
        } else {
            mess = "Delete successfully";

        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int productType = Integer.parseInt(request.getParameter("productType"));
        String describe = request.getParameter("describe");
        double price = Double.parseDouble(((request.getParameter("price"))));
        String productImage = request.getParameter("productImage");
        Product product = new Product(name, productType, describe, price, productImage);
        accessoryService.createAt(product);
        showList(request, response);
    }

}
