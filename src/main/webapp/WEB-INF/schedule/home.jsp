<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Football Team Standings</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<body>
    <h1>${season-2000}-${season-1999} 시즌 프리미어리그</h1>

    <table class="table table-striped" style="width: 800px; font-size: 10px;" border="1">
        <thead>
            <tr class="table-danger">
                <th>#</th>
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
            <c:forEach items="${teamInfoList}" var="teamInfo">
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
        <tr>
            <td colspan="9">
                <button type="button" onclick="location.href='./topscore'">자세히보기</button>
            </td>
        </tr>
    </table>
</body>
</html>
