package controller;

import model.Accessory;
import service.accessory.IAccessoryService;
import service.accessory.impl.AccessoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccessoryServlet", urlPatterns = "/accessory")
public class AccessoryServlet extends HttpServlet {
    private IAccessoryService accessoryService = new AccessoryService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("/view/accessory/create.jsp").forward(request, response);
                break;
            }
            case "delete": {
                int id = Integer.parseInt(request.getParameter("id"));
                accessoryService.delete(id);
                showList(request, response);
                break;
            }
            case "update": {
                int id = Integer.parseInt(request.getParameter("id"));
                Accessory accessory = accessoryService.findById(id);
                request.setAttribute("accessory", accessory);
                request.getRequestDispatcher("/view/accessory/update.jsp").forward(request, response);
                break;
            }
            default: {
                showList(request, response);
                break;
            }
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Accessory> accessoryList = accessoryService.findAll();
        if (accessoryList == null) {
            request.getRequestDispatcher("/view/accessory/error.jsp").forward(request, response);
        } else {
            request.setAttribute("accessoryList", accessoryList);
            request.getRequestDispatcher("/view/accessory/list.jsp").forward(request, response);
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                String nameAccessory = request.getParameter("nameAccessory");
                double priceAccessory = Double.parseDouble(request.getParameter("priceAccessory"));
                String imageAccessory = request.getParameter("imageAccessory");
                if (nameAccessory == null || imageAccessory == null) {
                    request.getRequestDispatcher("/view/accessory/create.jsp").forward(request, response);
                }
                accessoryService.save(new Accessory(nameAccessory, priceAccessory, imageAccessory));
                showList(request, response);
                break;
            }
            case "update": {
                Integer id = Integer.parseInt(request.getParameter("id"));
                String nameAccessory = request.getParameter("nameAccessory");
                double priceAccessory = Double.parseDouble(request.getParameter("priceAccessory"));
                String imageAccessory = request.getParameter("imageAccessory");
                accessoryService.update(id, new Accessory(nameAccessory, priceAccessory, imageAccessory));
                showList(request, response);
                break;
            }
            case "search": {
                String name = request.getParameter("nameAccessory");
                int price = Integer.parseInt(request.getParameter("priceAccessory"));
                List<Accessory> accessoryList = null;
                switch (price) {
                    case 1:
                        accessoryList = accessoryService.findByNameAndPrice(name, 0, 500000);
                        request.setAttribute("accessoryList", accessoryList);
                        request.getRequestDispatcher("/view/accessory/list.jsp").forward(request, response);
                        break;
                    case 2:
                        accessoryList = accessoryService.findByNameAndPrice(name, 500000, 1000000);
                        request.setAttribute("accessoryList", accessoryList);
                        request.getRequestDispatcher("/view/accessory/list.jsp").forward(request, response);
                        break;
                    case 3:
                        accessoryList = accessoryService.findByNameAndPrice(name, 1000000, 5000000);
                        request.setAttribute("accessoryList", accessoryList);
                        request.getRequestDispatcher("/view/accessory/list.jsp").forward(request, response);
                        break;
                    case 4:
                        accessoryList = accessoryService.findByNameAndPrice(name, 5000000, 100000000);
                        request.setAttribute("accessoryList", accessoryList);
                        request.getRequestDispatcher("/view/accessory/list.jsp").forward(request, response);
                        break;
                    case 5:
                        showList(request, response);
                        break;
                    default: {
                    }
                }

            }
        }

    }
}
