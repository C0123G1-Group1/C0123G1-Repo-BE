package models.service;

import models.model.Customer;
import models.model.CustomerDAO;
import models.model.OrderDetail;
import models.model.ProductDAO;

import java.util.List;

public interface IOrderDetailSevice {
    boolean addOrderDetail(OrderDetail orderDetail);
    boolean deleteOrderDetail(int productOrderDetailId);
    List<ProductDAO> getOrderDetailProduct(int customerId);
    List<OrderDetail> getOrderDetail( int customerId);
    List<CustomerDAO> getCustomerOrder();
}
