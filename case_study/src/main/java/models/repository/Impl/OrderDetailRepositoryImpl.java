package models.repository.Impl;

import models.model.*;
import models.repository.BaseRepository;
import models.repository.IOrderDetailRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailRepositoryImpl implements IOrderDetailRepository {

    private final String INSERT_ORDER_DETAIL = "INSERT INTO order_detail (order_id, product_id, product_type_id, price, quantity ) VALUES (?,?,?,?,?)";
    private final String ORDER_DETAIL_CUSTOMER = "SELECT od.order_detail_id,od.quantity,p.* \n" +
            "FROM order_detail AS od \n" +
            "INNER JOIN orders AS o ON od.order_id = o.order_id\n" +
            "INNER JOIN customers AS c ON o.customer_id = c.customer_id\n" +
            "INNER JOIN products AS p ON od.product_id = p.product_id\n" +
            "WHERE c.customer_id = ?;";
    private final String ORDER_DETAIL = "SELECT od.order_detail_id,od.quantity,o.customer_id,p.*\n" +
            "FROM order_detail AS od \n" +
            "INNER JOIN orders AS o ON od.order_id = o.order_id\n" +
            "INNER JOIN customers AS c ON o.customer_id = c.customer_id\n" +
            "INNER JOIN products AS p ON od.product_id = p.product_id\n" +
            "WHERE c.customer_id = ?;";
    private final String DELETE_ORDER_DETAIL = "DELETE FROM order_detail WHERE order_detail_id = ?;";

    private final String GET_CUSTOMER_ORDER = "SELECT  DISTINCT c.*, o.order_date\n" +
            "FROM order_detail AS od \n" +
            "INNER JOIN orders AS o ON od.order_id = o.order_id\n" +
            "INNER JOIN customers AS c ON o.customer_id = c.customer_id;";

    @Override
    public boolean addOrderDetail(OrderDetail orderDetail) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_DETAIL);
            preparedStatement.setInt(1, orderDetail.getOrderId());
            preparedStatement.setInt(2, orderDetail.getProductId());
            preparedStatement.setInt(3, orderDetail.getProductTypeId());
            preparedStatement.setDouble(4, orderDetail.getPrice());
            preparedStatement.setInt(5, orderDetail.getQuantity());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteOrderDetail(int productOrderDetailId) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER_DETAIL);
            preparedStatement.setInt(1, productOrderDetailId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<ProductDAO> getOrderDetailProduct(int customerId) {
        List<ProductDAO> productOrderDetailList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ORDER_DETAIL_CUSTOMER);
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                int productType = resultSet.getInt("product_type_id");
                String describe = resultSet.getString("describe");
                double price = resultSet.getDouble("price");
                String productImage = resultSet.getString("product_image_url");
                String createAt = resultSet.getString("createAt");
                String updateAt = resultSet.getString("updateAt");
                int orderDetailId = resultSet.getInt("order_detail_id");
                int quantity = resultSet.getInt("quantity");
                ProductDAO productOrderDetail = new ProductDAO(id, name, productType, describe, price, productImage, createAt, updateAt, orderDetailId, quantity);
                productOrderDetailList.add(productOrderDetail);
            }
            return productOrderDetailList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<OrderDetail> getOrderDetail(int customerId) {
        List<OrderDetail> orderDetailList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ORDER_DETAIL);
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_detail_id");
                int customerIdBase = resultSet.getInt("customer_id");
                int productId = resultSet.getInt("product_id");
                int productTypeId = resultSet.getInt("product_type_id");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                OrderDetail orderDetail = new OrderDetail(orderId, customerIdBase, productId, productTypeId, price, quantity);
                orderDetailList.add(orderDetail);
            }
            return orderDetailList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CustomerDAO> getCustomerOrder() {
        List<CustomerDAO> customerDAOList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CUSTOMER_ORDER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                String orderDate = resultSet.getString("order_date");
                CustomerDAO customerDAO = new CustomerDAO(id,name,email,phoneNumber,address,orderDate);
                customerDAOList.add(customerDAO);
            }
            return customerDAOList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
