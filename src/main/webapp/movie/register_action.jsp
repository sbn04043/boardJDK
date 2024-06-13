<%@ page import="model.MovieDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.MovieController" %>
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
<body>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int grade = Integer.parseInt(request.getParameter("grade"));
    MovieDTO movie = new MovieDTO();
    movie.setTitle(title);
    movie.setContent(content);
    movie.setGrade(grade);

    MySqlConnector connector = new MySqlConnector();
    MovieController movieController = new MovieController(connector);
    movieController.insert(movie);

    response.sendRedirect("showList.jsp");
%>
</body>
</html>
