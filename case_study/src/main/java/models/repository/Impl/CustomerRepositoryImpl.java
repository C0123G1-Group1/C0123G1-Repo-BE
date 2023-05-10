package models.repository.Impl;

import connection.BaseRepository;
import models.model.Account;
import models.model.Customer;
import models.repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private final String SELECT_ALL_CUSTOMER = "SELECT c.*,ac.user_name,ac.password FROM customers AS c INNER JOIN account_users AS ac ON c.account_id=ac.account_id;";
    private final String INSERT_CUSTOMER = "INSERT INTO customers(customer_name, email, phone_number, address, account_id) VALUES (?,?,?,?,?);";
    private final String INSERT_ACCOUNT="INSERT INTO account_users (user_name,password) VALUE(?,?);";
    private final String SELECT_ACCOUNT="SELECT*FROM account_users;";


    @Override
    public List<Customer> getAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                int accountId = resultSet.getInt("account_id");
                String createAt = resultSet.getString("create_at");
                String updateAt = resultSet.getString("update_at");
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("password");
                Account account = new Account(accountId, userName, password);
                Customer customer =new Customer(customerId, name, email, phoneNumber, address, account, createAt, updateAt);
                customerList.add(customer);
            }
            return customerList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public boolean saveCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACCOUNT);
            preparedStatement.setString(1, customer.getAccount().getUserName());
            preparedStatement.setString(2, customer.getAccount().getPassword());
            int transaction = preparedStatement.executeUpdate();
            if (transaction > 0) {
                preparedStatement = connection.prepareStatement(SELECT_ACCOUNT);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    if (resultSet.getString("user_name").equals(customer.getAccount().getUserName())) {
                        int accountId = resultSet.getInt("account_id");
                        preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
                        preparedStatement.setString(1, customer.getName());
                        preparedStatement.setString(2, customer.getEmail());
                        preparedStatement.setString(3, customer.getPhoneNumber());
                        preparedStatement.setString(4, customer.getAddress());
                        preparedStatement.setInt(5, accountId);
                        transaction += preparedStatement.executeUpdate();
                        break;
                    }
                }
            }
            if (transaction == 2) {
                connection.commit();
                return true;
            } else {
                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
