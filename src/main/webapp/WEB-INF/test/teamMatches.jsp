<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Team Matches</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<body>
    <h1>팀 경기 기록</h1>

    <table class="table table-striped" style="width: 800px; font-size: 10px;" border="1">
        <thead>
            <tr class="table-danger">
                <th>라운드</th>
                <th>홈팀</th>
                <th>어웨이팀</th>
                <th>점수</th>
                <th>결과</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${matchInfoList}" var="matchInfo" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${matchInfo.homeTeam}</td>
                    <td>${matchInfo.awayTeam}</td>
                    <td>${matchInfo.homeScore} - ${matchInfo.awayScore}</td>
                    <td>
                        <c:choose>
                            <c:when test="${matchInfo.isHomeTeam}">
                                <c:choose>
                                    <c:when test="${matchInfo.homeScore > matchInfo.awayScore}">승</c:when>
                                    <c:when test="${matchInfo.homeScore < matchInfo.awayScore}">패</c:when>
                                    <c:otherwise>무</c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${matchInfo.homeScore < matchInfo.awayScore}">승</c:when>
                                    <c:when test="${matchInfo.homeScore > matchInfo.awayScore}">패</c:when>
                                    <c:otherwise>무</c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
