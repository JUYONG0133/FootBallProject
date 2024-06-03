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
        div.menu {
            background-color: #4071e3;
            text-align: center;
        }
        div.bt button {
            width: 120px;
            height: 50px;
            line-height: 30px;
            background-color: #ffffff;
            border: 2px solid #4071e3;
            border-radius: 20px;
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 18px;
            color: #4071e3;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }
        div.bt button:hover {
            background-color: #a0b4e5;
            color: #ffffff;
            transform: translateY(-10px); /* 위로 5px 이동 */
            transition: transform 0.2s; /* 부드러운 이동 효과 */
        }
    </style>
</head>
<body>
<div class="menu">
    <div class="bt" style="margin-left: 500px;">
    <button>일정</button>
    <button>순위</button>
    <button>게시판</button>
        <img src="../aa.jpg"  style="border: 3px solid black; border-radius: 20px; margin-left: 300px;">
        <button>로그인</button>
        <button>회원가입</button>
    </div>
</div>
</body>
</html>
