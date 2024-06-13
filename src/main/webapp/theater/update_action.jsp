<%@ page import="model.TheaterDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.TheaterController" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 12.
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    TheaterDTO theater = (TheaterDTO) session.getAttribute("theater");
    theater.setName(request.getParameter("name"));
    theater.setAddress(request.getParameter("address"));
    theater.setNumber(request.getParameter("number"));

    MySqlConnector connector = new MySqlConnector();
    TheaterController theaterController = new TheaterController(connector);
    theaterController.update(theater);

    session.removeAttribute("theater");
    response.sendRedirect("showList.jsp");
%>
</body>
</html>
