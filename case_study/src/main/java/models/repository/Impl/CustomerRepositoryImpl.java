package models.repository.Impl;

import models.model.Account;
import models.model.Customer;
import models.repository.BaseRepository;
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
    private final String INSERT_ACCOUNT = "INSERT INTO account_users (user_name,password) VALUE(?,?);";
    private final String SELECT_ACCOUNT = "SELECT*FROM account_users;";
    private final String DELETE_CUSTOMER = "DELETE FROM customers WHERE customer_id=?;";
    private final String DELETE_ACCOUNT = "DELETE FROM account_users WHERE user_name=?;";
    private final String SEARCH_CUSTOMER = "SELECT c.*,ac.user_name,ac.password FROM customers AS c INNER JOIN account_users AS ac ON c.account_id=ac.account_id WHERE c.customer_name LIKE ? AND c.address LIKE ?;";
    private final String SELECT_CUSTOMER = "SELECT c.*,ac.user_name,ac.password FROM customers AS c INNER JOIN account_users AS ac ON c.account_id=ac.account_id WHERE c.customer_id= ?;";


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
                Customer customer = new Customer(customerId, name, email, phoneNumber, address, account, createAt, updateAt);
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

    @Override
    public boolean deleteCustomer(int id, String account) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1, id);
            int transaction = preparedStatement.executeUpdate();
            if (transaction > 0) {
                preparedStatement = connection.prepareStatement(DELETE_ACCOUNT);
                preparedStatement.setString(1, account);
                transaction += preparedStatement.executeUpdate();
            }
            if (transaction == 2) {
                connection.commit();
                return true;
            } else {
                connection.rollback();
            }
        } catch (SQLException e) {
            try {
                connection.rollback();
                connection.commit();
            } catch (SQLException ex) {
                e.printStackTrace();
            }
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> searchCustomer(String nameCustomer,String addressCustomer) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER);
            preparedStatement.setString(1, '%' + nameCustomer + '%');
            preparedStatement.setString(2, '%' + addressCustomer + '%');
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
                Customer customer = new Customer(customerId, name, email, phoneNumber, address, account, createAt, updateAt);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer getCustomer(int id) {
        Connection connection =BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement =connection.prepareStatement(SELECT_CUSTOMER);
            preparedStatement.setInt(1,id);
            ResultSet resultSet= preparedStatement.executeQuery();
            Customer customer=null;
            if (resultSet.next()){
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
                customer = new Customer(customerId, name, email, phoneNumber, address, account, createAt, updateAt);
            }
            return customer;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
