<%@ page import="model.UserDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.UserController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 입력받은 username과 password를 다음 페이지로 전해주는 페이지 -->

<html>
<head>
    <title>auth</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserDTO userDTO = new UserDTO();
    userDTO.setUsername(username);
    userDTO.setPassword(password);

    MySqlConnector connector = new MySqlConnector();
    UserController userController = new UserController(connector);

    UserDTO result = userController.auth(userDTO);

    if (result != null) {
        //로그인 성공
        //현재 로그인 성공한 정보를 session에 저장
        session.setAttribute("logIn", result);

        //게시판으로 이동
        //다른 페이지로 강제 이동 시킬 때
        //response.sendRedirect("위치") 사용
        //이후 다른 sendRedirect()를 실행할 수 없다.
        response.sendRedirect("../board/showList.jsp");
    } else {
        //로그인 실패
        //인덱스 화면으로 이동
        response.sendRedirect("../index.jsp");
    }
%>

<%=result%>
</body>
</html>


















