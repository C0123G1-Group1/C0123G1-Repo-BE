package controller;


import models.model.Product;
import models.service.products.IProductService;
import models.service.products.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
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
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("view/products/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/products/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.getList();
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("view/products/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
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
                searchProductList=productService.search(name,0,100000);
                break;
            case 2:
                searchProductList = productService.search(name, 0, 1000);
                break;
            case 3:
                searchProductList = productService.search(name, 1001, 8000);
                break;
            case 4:
                searchProductList = productService.search(name, 8001, 15000);
                break;
            case 5:
                searchProductList = productService.search(name, 15001, 100000);
                break;
        }
        request.setAttribute("productList", searchProductList);
        try {
            request.getRequestDispatcher("view/products/list.jsp").forward(request, response);
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
        boolean checkEdit = productService.edit(product);
        String mess;
        if (checkEdit) {
            mess = "Editing is successful";
        } else {
            mess = "Edit failed";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean checkRemove = productService.remove(id);
        String mess;
        if (checkRemove) {
            mess = "Delete successfully";
        } else {
            mess = "Delete failed";
        }
        request.setAttribute("mess", mess);
  showList(request,response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int productType = Integer.parseInt(request.getParameter("productType"));
        String describe = request.getParameter("describe");
        double price = Double.parseDouble(((request.getParameter("price"))));
        String productImage = request.getParameter("productImage");
        Product product = new Product(name, productType, describe, price, productImage);
        productService.createAt(product);
showList(request,response);
    }
}
