package models.service;

import models.model.Order;

import java.util.List;

public interface IOrderService {
    List<Order> getAll();
}
