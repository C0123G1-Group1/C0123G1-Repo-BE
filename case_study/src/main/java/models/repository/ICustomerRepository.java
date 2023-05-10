package models.repository;

import models.model.Customer;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> getAllCustomer();

    boolean saveCustomer(Customer customer);
    boolean deleteCustomer(int id);
}
