package models.repository;

import models.model.Order;

import java.util.List;

public interface IOrderRepository {
    List<Order> getAll();
}
