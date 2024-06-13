<%@ page import="model.UserDTO" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="model.ReplyDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.ReplyController" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 7.
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String content = request.getParameter("content");
    int writerId = ((UserDTO) session.getAttribute("logIn")).getId();
    int boardId = ((BoardDTO) session.getAttribute("board")).getId();

    ReplyDTO temp = new ReplyDTO();
    temp.setContent(content);
    temp.setWriterId(writerId);
    temp.setBoardId(boardId);

    MySqlConnector connector = new MySqlConnector();
    ReplyController replyController = new ReplyController(connector);

    replyController.insert(temp);
    response.sendRedirect("/reply/showList.jsp?boardId=" + boardId);
%>
</body>
</html>
