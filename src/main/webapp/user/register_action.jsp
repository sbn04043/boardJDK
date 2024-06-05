<%@ page import="controller.UserController" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="model.UserDTO" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 5.
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register_action page</title>
</head>
<body>
<%
    MySqlConnector connector = new MySqlConnector();
    UserController userController = new UserController(connector);
    UserDTO attempt = new UserDTO();

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String nickname = request.getParameter("nickname");

    attempt.setUsername(username);
    attempt.setPassword(password);
    attempt.setNickname(nickname);

    boolean result = userController.register(attempt);
    if (result) {
        response.sendRedirect("/");
    } else {
        response.sendRedirect("/error/showError.jsp?errorCode=duplicated");
    }
%>
</body>
</html>
