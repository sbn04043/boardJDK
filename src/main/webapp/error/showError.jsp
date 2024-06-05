<%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 5.
  Time: 오후 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show error</title>
</head>
<body>
<%
    String errorCode = request.getParameter("errorCode");

    String message = "";

    if (errorCode.equalsIgnoreCase("duplicated")) {
        message = "중복된 아이디로는 가입하실 수 없습니다.";
    }
%>

<h1>
    <%=message%>
</h1>
<a href="/">처음 페이지</a>로 돌아가기

</body>
</html>
