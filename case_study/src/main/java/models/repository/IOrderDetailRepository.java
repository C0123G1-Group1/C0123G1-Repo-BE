package models.repository;

import models.model.OrderDetail;
import models.model.Product;

import java.util.List;

public interface IOrderDetailRepository {
    boolean addOrderDetail(OrderDetail orderDetail);
    List<Product> getOrderDetail(int customerId);
}
