package models.repository.Impl;

import models.repository.BaseRepository;
import models.repository.IAccountRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountRepositoryImpl implements IAccountRepository {
    private final String SELECT_ACCOUNT = "SELECT * FROM account_users;";

    @Override
    public boolean checkAccount(String userName, String password) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                if(resultSet.getString("user_name").equals(userName) && resultSet.getString("password").equals(password)){
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
