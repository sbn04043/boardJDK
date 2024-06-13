<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.ReplyController" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="controller.MovieController" %>
<%@ page import="model.MovieDTO" %>
<%@ page import="model.ReplyDTO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    MySqlConnector connector = new MySqlConnector();
    ReplyController replyController = new ReplyController(connector);
    ReplyDTO replyDTO = replyController.selectOne(id);
    int movieId = replyDTO.getMovieId();
    replyController.delete(id);

    response.sendRedirect("../movie/showOne.jsp?id="+movieId);
%>
</body>
</html>
