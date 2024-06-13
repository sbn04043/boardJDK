<%@ page import="model.MovieDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.MovieController" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 12.
  Time: 오전 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    MySqlConnector connector = new MySqlConnector();
    MovieController movieController = new MovieController(connector);

    MovieDTO movie = (MovieDTO) session.getAttribute("movie");
    movie.setTitle(request.getParameter("title"));
    movie.setContent(request.getParameter("content"));
    movie.setGrade(Integer.parseInt(request.getParameter("grade")));

    movieController.update(movie);

    response.sendRedirect("showList.jsp");
%>
</body>
</html>
