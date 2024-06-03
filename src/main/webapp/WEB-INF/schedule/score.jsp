<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Top Scorers</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<body>
    <h1>${season-2000}-${season-1999} 시즌 프리미어리그 득점자</h1>

    <table class="table table-striped" style="width: 800px; font-size: 10px;" border="1">
        <thead>
            <tr class="table-danger">
                <th>#</th>
                <th>선수</th>
                <th>득점 수</th>
                <th>소속팀</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${scorerInfoList}" var="scorerInfo" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${scorerInfo.playerName}</td>
                    <td>${scorerInfo.goals}</td>
                    <td>${scorerInfo.teamName}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
