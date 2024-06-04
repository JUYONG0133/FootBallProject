<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="data.dto.Player" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.fasterxml.jackson.core.type.TypeReference" %>
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

        table {
            width: 450px;
            border-collapse: collapse;
            font-size: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #f2f2f2;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            width: 25px;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .rank {
            font-size: 14px;
            font-weight: bold;
            color: #4CAF50;
        }

        .age {
            font-size: 14px;
            font-weight: bold;
            color: #4CAF50;
        }

        .player-name {
            font-size: 13px;
            font-weight: bold;
        }

        .player-info {
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<%
    String filePath = "/Users/ibyeonghyeon/Desktop/naver0314/FootBallProject/src/main/resources/static/image/transfermakt25.json";
    StringBuilder jsonData = new StringBuilder();

    try (FileReader fileReader = new FileReader(filePath);
         BufferedReader bufferedReader = new BufferedReader(fileReader)) {
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            jsonData.append(line);
        }
    } catch (IOException e) {
        e.printStackTrace();
    }

    // JSON 데이터를 파싱하여 각 player 객체 추출
    List<Player> players = new ObjectMapper().readValue(jsonData.toString(), new TypeReference<List<Player>>() {});
    request.setAttribute("players", players);
%>

<body>
<table>
    <tr>
        <th colspan="2">순위/나이</th>
        <th>선수명</th>
        <th>포지션</th>
        <th>국가</th>
        <th>소속팀</th>
        <th>이적료</th>
    </tr>
    <c:forEach items="${players}" var="player">
        <tr>
            <td class="rank">${player.number}</td>
            <td class="age">${player.age}</td>
            <td class="player-name">${player.name}</td>
            <td class="player-info">${player.position}</td>
            <td class="player-info">${player.nation}</td>
            <td class="player-info">${player.team}</td>
            <td class="player-info">${player.value}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
