package models.repository.accessory.impl;

import models.model.Accessory;
import models.repository.BaseRepository;
import models.repository.accessory.IAccessoryRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccessoryRepository implements IAccessoryRepository {
    private final String SELECT_ALL = "SELECT * FROM ig1_store.accessory;";
    private final String INSERT_INTO = "INSERT INTO accessory(accessory_name,accessory_price,image_accessory) VALUES(?,?,?)";
    private final String DELETE_ID = "DELETE FROM accessory WHERE accessory_id =?;";
    private final String SELECT_ACCESSORY_BY_ID = "select * from accessory where accessory_id =?";
    private final String UPDATE_ACCESSORY = "update accessory set accessory_name = ?,accessory_price= ?, image_accessory =? where accessory_id = ?;";
    private final String SELECT_ACCESSORY_BY_NAME_AND_PRICE = "SELECT * FROM accessory  WHERE accessory_name  LIKE ? AND accessory_price BETWEEN ? AND ?;";

    @Override

    public List<Accessory> findAll() {
        List<Accessory> accessoryList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("accessory_id");
                String nameAccessory = resultSet.getString("accessory_name");
                double priceAccessory = resultSet.getDouble("accessory_price");
                String imageAccessory = resultSet.getString("image_accessory");
                String createAt = resultSet.getString("create_at");
                String updateAt = resultSet.getString("create_at");
                accessoryList.add(new Accessory(id, nameAccessory, priceAccessory, imageAccessory, createAt, updateAt));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return accessoryList;
    }

    @Override
    public void save(Accessory accessory) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, accessory.getNameAccessory());
            preparedStatement.setDouble(2, accessory.getPriceAccessory());
            preparedStatement.setString(3, accessory.getImageAccessory());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void update(int id, Accessory accessory) {
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareCall(UPDATE_ACCESSORY);
            preparedStatement.setInt(4, id);
            preparedStatement.setString(1, accessory.getNameAccessory());
            preparedStatement.setDouble(2, accessory.getPriceAccessory());
            preparedStatement.setString(3, accessory.getImageAccessory());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareCall(DELETE_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Accessory findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCESSORY_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            Accessory accessory = null;
            if (resultSet.next()) {
                accessory = new Accessory();
                accessory.setId(resultSet.getInt("accessory_id"));
                accessory.setNameAccessory(resultSet.getString("accessory_name"));
                accessory.setPriceAccessory(resultSet.getDouble("accessory_price"));
                accessory.setImageAccessory(resultSet.getString("image_accessory"));
                accessory.setCreateAt(resultSet.getString("create_at"));
                accessory.setCreateAt(resultSet.getString("update_at"));
            }
            return accessory;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Accessory> findByNameAndPrice(String name, double startPrice, double endPrice) {
        List<Accessory> accessoryList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCESSORY_BY_NAME_AND_PRICE);
            preparedStatement.setString(1, '%' + name + '%');
            preparedStatement.setDouble(2, startPrice);
            preparedStatement.setDouble(3, endPrice);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("accessory_id");
                String nameAccessory = resultSet.getString("accessory_name");
                double priceAccessory = resultSet.getDouble("accessory_price");
                String imageAccessory = resultSet.getString("image_accessory");
                String createAt = resultSet.getString("create_at");
                String updateAt = resultSet.getString("update_at");
                accessoryList.add(new Accessory(id, nameAccessory, priceAccessory, imageAccessory, createAt, updateAt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accessoryList;
    }
}
