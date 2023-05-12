package models.repository;

import models.model.Customer;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> getAllCustomer();

    boolean saveCustomer(Customer customer);

    boolean deleteCustomer(int id, String account);

    List<Customer> searchCustomer(String nameCustomer,String addressCustomer);

    Customer getCustomer(int id);

    boolean editCustomer(Customer customer);
}
