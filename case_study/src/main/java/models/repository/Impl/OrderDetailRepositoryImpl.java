package models.repository.Impl;

import models.model.OrderDetail;
import models.model.Product;
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
    private final String ORDER_DETAIL_CUSTOMER = "SELECT p.* \n" +
            "FROM order_detail AS od \n" +
            "INNER JOIN orders AS o ON od.order_id = o.order_id\n" +
            "INNER JOIN customers AS c ON o.customer_id = c.customer_id\n" +
            "INNER JOIN products AS p ON od.product_id = p.product_id\n" +
            "WHERE c.customer_id = ?;";

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
    public List<Product> getOrderDetail(int customerId) {
        List<Product> productList = new ArrayList<>();
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
                Product product = new Product(id, name, productType, describe, price, productImage);
                productList.add(product);
            }
            return productList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
