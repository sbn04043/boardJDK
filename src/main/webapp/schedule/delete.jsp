<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.ScheduleController" %>
<%@ page import="model.ScheduleDTO" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 13.
  Time: 오후 3:11
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

</head>
<body style="background-color: #d4f2bd">
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String whereFrom = (String) session.getAttribute("whereFrom");
    MySqlConnector connector = new MySqlConnector();
    ScheduleController scheduleController = new ScheduleController(connector);
    ScheduleDTO schedule = scheduleController.selectOne(id);
%>
<div class="container text-center">
    <div class="row" style="margin-top: 200px;"></div>
    <div class="row">
        <div class="col"></div>
        <div class="col" style="background-color: #bee6bc">
            <div class="row">
                <h3 style="background-color: mediumspringgreen;">정말로 삭제하시겠습니까?</h3>
            </div>
            <div class="row">
                <div class="container">
                    <div class="row" style="padding: 20px">
                        <div class="col">
                            <button onclick="location.href='delete_action.jsp?id=<%=id%>'">예</button>
                        </div>
                        <div class="col">
                            <%
                                if (whereFrom.equals("movie")) {
                            %>
                            <button onclick="location.href='/movie/showOne.jsp?id=<%=schedule.getMovieId()%>'">아니오
                            </button>
                            <%
                            } else if (whereFrom.equals("theater")) {
                            %>
                            <button onclick="location.href='/theater/showOne.jsp?id=<%=schedule.getTheaterId()%>'">아니오
                            </button>
                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col"></div>
    </div>
</div>

</body>
</html>
