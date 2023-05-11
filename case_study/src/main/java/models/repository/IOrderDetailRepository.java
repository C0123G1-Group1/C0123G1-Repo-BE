package models.repository;

import models.model.Customer;
import models.model.CustomerDAO;
import models.model.OrderDetail;
import models.model.ProductDAO;

import java.util.List;

public interface IOrderDetailRepository {
    boolean addOrderDetail(OrderDetail orderDetail);
    boolean deleteOrderDetail(int productId);
    List<ProductDAO> getOrderDetailProduct(int customerId);
    List<OrderDetail> getOrderDetail( int customerId);
    List<CustomerDAO> getCustomerOrder();

}
