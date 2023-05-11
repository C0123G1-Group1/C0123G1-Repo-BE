package models.service;

import models.model.OrderDetail;
import models.model.Product;

import java.util.List;

public interface IOrderDetailSevice {
    boolean addOrderDetail(OrderDetail orderDetail);
    boolean deleteOrderDetail(int productId);
    List<Product> getOrderDetailProduct(int customerId);
    List<OrderDetail> getOrderDetail( int customerId);
}
