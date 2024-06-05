<%@ page import="controller.BoardController" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="java.sql.Array" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 5.
  Time: 오후 5:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show List</title>
</head>
<body>
<%
    MySqlConnector connector = new MySqlConnector();
    BoardController boardController = new BoardController(connector);

    ArrayList<BoardDTO> boardList = boardController.selectAll();

    for (BoardDTO board : boardList) {
        int userId = board.getWriterId();

%>
<%=board.getId()%>. <%=board.getTitle()%> 작성자: <%=%>
<%

    }
%>
</body>
</html>
