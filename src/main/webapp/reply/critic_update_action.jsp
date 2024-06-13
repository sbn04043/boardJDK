<%@ page import="model.ReplyDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.ReplyController" %><%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 6. 11.
  Time: 오후 5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int id = ((ReplyDTO) session.getAttribute("reply")).getId();
    MySqlConnector connector = new MySqlConnector();
    ReplyController replyController = new ReplyController(connector);

    ReplyDTO reply = replyController.selectOne(id);
    reply.setScore(Integer.parseInt(request.getParameter("score")));
    reply.setContent(request.getParameter("content"));

    replyController.update(reply);

    response.sendRedirect("../movie/showOne.jsp?id=" + reply.getMovieId());
%>
</body>
</html>
