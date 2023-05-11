package models.service;

import models.model.OrderDetail;
import models.model.Product;

import java.util.List;

public interface IOrderDetailSevice {
    boolean addOrderDetail(OrderDetail orderDetail);

    List<Product> getOrderDetail(int customerId);
}
