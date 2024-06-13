package controller;

import com.mysql.cj.x.protobuf.MysqlxPrepare;
import connector.MySqlConnector;
import model.ReplyDTO;

import java.sql.*;
import java.util.ArrayList;

public class ReplyController {
    Connection connection;

    public ReplyController(MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    public ArrayList<ReplyDTO> selectByMovieId(int movieId) {
        String query = "SELECT * FROM reply INNER JOIN user ON reply.writer_id = user.id WHERE movie_id=?";
        ArrayList<ReplyDTO> replies = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, movieId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ReplyDTO temp = new ReplyDTO();

                temp.setId(resultSet.getInt("id"));
                if (resultSet.getInt("grade") == 2) {
                    temp.setContent(resultSet.getString("content"));
                } else {
                    temp.setContent("");
                }
                temp.setEntryDate(resultSet.getDate("entry_date"));
                temp.setModifyDate(resultSet.getDate("modify_date"));
                temp.setWriterId(resultSet.getInt("writer_id"));
                temp.setMovieId(resultSet.getInt("movie_id"));
                temp.setNickname(resultSet.getString("nickname"));
                temp.setScore(resultSet.getInt("score"));

                replies.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return replies;
    }

    public ReplyDTO selectOne(int id) {
        String query = "SELECT * FROM reply WHERE id=?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                ReplyDTO temp = new ReplyDTO();
                temp.setId(resultSet.getInt("id"));
                temp.setContent(resultSet.getString("content"));
                temp.setEntryDate(resultSet.getDate("entry_date"));
                temp.setModifyDate(resultSet.getDate("modify_date"));
                temp.setWriterId(resultSet.getInt("writer_id"));
                temp.setMovieId(resultSet.getInt("movie_id"));
                temp.setScore(resultSet.getInt("score"));

                return temp;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void delete(int id) {
        String query = "DELETE FROM reply WHERE id=?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insert(ReplyDTO reply) {
        String query = "INSERT INTO reply(content, writer_id, movie_id, score) VALUES (?,?,?,?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            if (reply.getContent() == null) {
                preparedStatement.setNull(1, Types.VARCHAR);
            } else {
                preparedStatement.setString(1, reply.getContent());
            }
            preparedStatement.setInt(2, reply.getWriterId());
            preparedStatement.setInt(3, reply.getMovieId());
            preparedStatement.setInt(4, reply.getScore());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(ReplyDTO reply) {
        String query = "UPDATE reply SET content=?, score=?, modify_date=NOW() WHERE id=?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            if (reply.getContent() == null) {
                preparedStatement.setNull(1, Types.VARCHAR);
            } else {
                preparedStatement.setString(1, reply.getContent());
            }
            preparedStatement.setInt(2, reply.getScore());
            preparedStatement.setInt(3, reply.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
