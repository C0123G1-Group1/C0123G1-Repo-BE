package models.service;

import models.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getAllCustomer();

    boolean saveCustomer(Customer customer);

}
