package controller;

import connector.MySqlConnector;
import model.BoardDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardController {
    Connection connection;

    public BoardController (MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    public ArrayList<BoardDTO> selectAll() {
        ArrayList<BoardDTO> boardList = new ArrayList<>();
        String query = "select * from board " +
                "INNER JOIN user" +
                "ON board.writer_id = user.id";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                BoardDTO temp = new BoardDTO();
                temp.setId(resultSet.getInt("id"));
                temp.setTitle(resultSet.getString("title"));
                temp.setContent(resultSet.getString("content"));
                temp.setWriterId(resultSet.getInt("writer_id"));
                boardList.add(temp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return boardList;
    }
}
