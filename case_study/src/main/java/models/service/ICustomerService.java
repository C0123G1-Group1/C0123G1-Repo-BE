package models.service;

import models.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getAllCustomer();

    boolean saveCustomer(Customer customer);
    boolean deleteCustomer(int id);
    Customer getCustomerById(int id);
}
