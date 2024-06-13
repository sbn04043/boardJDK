<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.TheaterController" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 12.
  Time: 오후 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    MySqlConnector connector = new MySqlConnector();
    TheaterController theaterController = new TheaterController(connector);

    theaterController.delete(id);

    response.sendRedirect("showList.jsp");
%>
</body>
</html>
