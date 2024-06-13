<%@ page import="model.UserDTO" %>
<%@ page import="model.MovieDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.ReplyController" %>
<%@ page import="model.ReplyDTO" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 11.
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    UserDTO logIn = (UserDTO) session.getAttribute("logIn");
    MovieDTO movie = (MovieDTO) session.getAttribute("movie");
    int score = Integer.parseInt(request.getParameter("score"));
    MySqlConnector connector = new MySqlConnector();
    ReplyController replyController = new ReplyController(connector);
    ReplyDTO reply = new ReplyDTO();

    reply.setContent(request.getParameter("content"));
    reply.setWriterId(logIn.getId());
    reply.setMovieId(movie.getId());
    reply.setScore(score);

    replyController.insert(reply);

    response.sendRedirect("../movie/showOne.jsp?id=" + movie.getId());
%>
</body>
</html>
