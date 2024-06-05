<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Top Scorers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body {
            font-family: 'Jua', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        h1 {
            font-family: 'Pacifico', cursive;
            text-align: center;
            margin: 20px 0;
            color: #343a40;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table {
            width: 100%;
            font-size: 14px;
        }
        .table th, .table td {
            padding: 12px;
            text-align: center;
        }
        .table th {
            background-color: #343a40;
            color: #ffffff;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }
        .btn-custom {
            font-size: 16px;
            margin-right: 10px;
        }
        .btn-group-end {
            float: right;
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
    <div class="container">
        <div class="logo-container">
            <img src="${root}/image/pl.png" class="logo">
            <h1>${season-2000}-${season-1999} 시즌 잉글랜드 프리미어리그</h1>
        </div>
        <button type="button" class="btn btn-primary btn-custom" onclick="location.href='./pl'">팀 순위</button>
        <div class="btn-group btn-group-end" style="margin-bottom: 30px;">
            <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='./plscore'">프리미어리그</button>
            <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='./sascore'">세리에 A</button>
            <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='./bunscore'">분데스리가</button>
            <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='./lascore'">라리가</button>
        </div>
        <table class="table table-striped">라
            <tr>
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
    </div>
</div>
</body>
</html>
