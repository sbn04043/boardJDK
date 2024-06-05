<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title>index</title>
</head>
<body>
<form action="/user/auth.jsp" method="post">
    아이디: <input type="text" name="username"> <br/>
    비밀번호: <input type="password" name="password"> <br/>
    <hr/>
    <input type="submit" value="로그인">
</form>
<hr/>
<a href="/user/register.jsp"><strong>회원가입</strong></a> 하기
</body>
</html>
