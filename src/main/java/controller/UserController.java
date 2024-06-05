package controller;

import connector.MySqlConnector;
import model.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserController {
    private Connection connection;

    public UserController(MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    public UserDTO auth(UserDTO userDTO) {
        String query = "select * from user WHERE username = ? AND password = ?";
        UserDTO result = null;

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userDTO.getUsername());
            preparedStatement.setString(2, userDTO.getPassword());

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                result = new UserDTO();

                result.setId(resultSet.getInt("id"));
                result.setUsername(resultSet.getString("username"));
                result.setPassword(resultSet.getString("password"));
                result.setNickname(resultSet.getString("nickname"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean register(UserDTO attempt) {
        String query = "INSERT INTO user(username, password, nickname) VALUES(?,?,?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, attempt.getUsername());
            preparedStatement.setString(2, attempt.getPassword());
            preparedStatement.setString(3, attempt.getNickname());

            preparedStatement.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


}
