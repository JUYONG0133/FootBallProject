<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Football Team Standings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body {
            font-family: 'Jua', sans-serif;
            background-color: #f8f9fa;
        }
        h1 {
            font-family: 'Pacifico', cursive;
            text-align: center;
            margin: 20px 0;
        }
        .table {
            margin: 0 auto;
            width: 90%;
            max-width: 1200px;
            font-size: 14px;
            border-collapse: collapse;
            border-spacing: 0;
            border: 2px solid #dee2e6;
        }
        .table th,
        .table td {
            padding: 8px;
            text-align: center;
            border-bottom: 2px solid #dee2e6;
        }
        .table th {
            background-color: #343a40;
            color: #ffffff;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }
        .table-hover tbody tr:hover {
            background-color: #e2e6ea;
        }
        .btn-custom {
            display: inline-block;
            margin-right: 10px;
            font-size: 16px;
        }
        .btn-group-end {
            float: right;
            margin-right: 70px;
        }
        .logo-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px; /* 이미지와 제목 사이에 여백 추가 */
        }

        .logo {
            margin-right: 10px; /* 이미지 오른쪽 여백 설정 */
        }

    </style>
</head>
<body>
<div style="margin-left: 50px;">

<c:set  var="root" value="<%=request.getContextPath()%>"/>
<div class="container">
    <div class="logo-container">
        <img src="${root}/image/serie.png" class="logo">
        <h1>${season-2000}-${season-1999} 시즌 이탈리아 세리에a 리그</h1>
    </div>
</div>
<button type="button" class="btn btn-primary btn-custom" onclick="location.href='./sascore'" style="margin-left: 70px;">개인 선수 순위</button>
    <div class="btn-group btn-group-end">
        <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='./pl'">프리미어리그</button>
        <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='./sa'">세리에 A</button>
        <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='./bun'">분데스리가</button>
        <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='./la'">라리가</button>
    </div>
    <br><br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>순위</th>
            <th>팀</th>
            <th>경기</th>
            <th>승</th>
            <th>무</th>
            <th>패</th>
            <th>+/-</th>
            <th>득실차</th>
            <th>승점</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="count" value="1" />
        <c:forEach items="${teamInfoList}" var="teamInfo" varStatus="loop">
            <tr>
                <td>${count}</td>
                <td>${teamInfo.teamName}</td>
                <td>${teamInfo.playedGames}</td>
                <td>${teamInfo.wins}</td>
                <td>${teamInfo.draws}</td>
                <td>${teamInfo.losses}</td>
                <td>${teamInfo.goalsFor} / ${teamInfo.goalsAgainst}</td>
                <td>${teamInfo.goalDifference}</td>
                <td>${teamInfo.points}</td>
            </tr>
            <c:set var="count" value="${count + 1}" />
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
