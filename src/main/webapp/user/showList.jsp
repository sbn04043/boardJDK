<%@ page import="model.UserDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.UserController" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 13.
  Time: 오후 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link href="/css/CSS.css" rel="stylesheet">
</head>
<body style="background-color: #bee6bc">

<div class="container text-center">
    <div class="row" style="margin-top: 200px"></div>
    <div class="row">
        <div class="col-2"></div>
        <div class="col">
            <%
                UserDTO logIn = (UserDTO) session.getAttribute("logIn");
                if (logIn.getGrade() != 1) {
            %>
            <h1>권한이 없습니다.</h1>
            <%
            } else {
            %>
            <div class="container" style="background-color: #d4f2bd">
                <div class="row" style="background-color: mediumspringgreen">
                    <div class="col">
                        <h1>UserName</h1>
                    </div>
                    <div class="col">
                        <h1>NickName</h1>
                    </div>
                    <div class="col">
                        <h1>Grade</h1>
                    </div>
                </div>
                <%
                    MySqlConnector mySqlConnector = new MySqlConnector();
                    UserController userController = new UserController(mySqlConnector);
                    ArrayList<UserDTO> users = userController.selectAll();

                    for (UserDTO user : users) {
                        String grade;
                        if (user.getGrade() == 1) {
                            grade = "관리자";
                        } else if (user.getGrade() == 2) {
                            grade = "평론가";
                        } else if (user.getGrade() == 3) {
                            grade = "일반인";
                        } else {
                            grade = "에러";
                        }
                %>
                <div class="row">
                    <div class="col">
                        <h3><%=user.getUsername()%>
                        </h3>
                    </div>
                    <div class="col">
                        <h3><%=user.getNickname()%>
                        </h3>
                    </div>
                    <div class="col">
                        <h3><%=grade%>
                        </h3>
                    </div>
                    <div class="col">
                        <button onclick="location.href='showOne.jsp?id=<%=user.getId()%>'"
                                class="from-control">
                            정보 관리
                        </button>
                    </div>
                </div>
                <%
                    }
                %>


            </div>
            <%
                }
            %>
            <div class="container"></div>
        </div>
        <div class="col-2"></div>
    </div>
</div>
</body>
</html>
