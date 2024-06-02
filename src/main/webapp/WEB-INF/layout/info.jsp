<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body * {
            font-family: 'Jua';
        }
        .chat-box {
            width: 200px;
            border: 1px solid #ddd;
            padding: 10px;
            background-color: white;
        }
        .chat-box .message {
            margin: 10px 0;
        }

    </style>

</head>
<body>
<div class="chat-box">
    <div class="message">
        <strong>Helena Hunt</strong>
        <p>Active 20m ago</p>
    </div>
    <div class="message">
        <p>Simple</p>
    </div>
    <div class="message">
        <p>Boom</p>
    </div>
    <div class="message">
        <p>Hmmm</p>
        <p>I think I get it</p>
        <p>Will head to the Help Center</p>
    </div>
    <input type="text" placeholder="Enter...">
</div>
</body>
</html>
