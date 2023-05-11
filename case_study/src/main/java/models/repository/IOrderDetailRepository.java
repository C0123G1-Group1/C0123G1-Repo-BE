package models.repository;

import models.model.OrderDetail;
import models.model.Product;

import java.util.List;

public interface IOrderDetailRepository {
    boolean addOrderDetail(OrderDetail orderDetail);
    boolean deleteOrderDetail(int productId);
    List<Product> getOrderDetailProduct(int customerId);
    List<OrderDetail> getOrderDetail( int customerId);
}
