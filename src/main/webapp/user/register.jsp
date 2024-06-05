<%@ page import="controller.UserController" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
</head>
<body>
<h1>register page</h1>

<form action="register_action.jsp" method="post">
    아이디: <input type="text" name="username"> <br/>
    비밀번호: <input type="password" name="password"><br/>
    닉네임: <input type="text" name="nickname"><br/>
    <input type="submit" name="회원가입">
</form>


</body>
</html>
