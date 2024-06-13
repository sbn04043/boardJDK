<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.MovieController" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 12.
  Time: 오전 11:09
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
    int id = Integer.parseInt(request.getParameter("id"));

    movieController.delete(id);
    response.sendRedirect("showList.jsp");
%>
</body>
</html>
