package models.service.impl;

import models.model.OrderDetail;
import models.model.Product;
import models.repository.IOrderDetailRepository;
import models.repository.Impl.OrderDetailRepositoryImpl;
import models.service.IOrderDetailSevice;

import java.util.List;

public class OrderDetailServiceImpl implements IOrderDetailSevice {
    IOrderDetailRepository orderDetailRepository = new OrderDetailRepositoryImpl();
    @Override
    public boolean addOrderDetail(OrderDetail orderDetail) {
        return orderDetailRepository.addOrderDetail(orderDetail);
    }

    @Override
    public boolean deleteOrderDetail(int productId) {
        return orderDetailRepository.deleteOrderDetail(productId);
    }

    @Override
    public List<Product> getOrderDetailProduct(int customerId) {
        return orderDetailRepository.getOrderDetailProduct(customerId);
    }

    @Override
    public List<OrderDetail> getOrderDetail( int customerId) {
        return orderDetailRepository.getOrderDetail(customerId);
    }
}
