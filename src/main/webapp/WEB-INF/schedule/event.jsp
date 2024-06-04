<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>경기 이벤트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <style>
        body * {
            font-family: 'Jua';
        }
    </style>
</head>
<body>
<div style="margin-left: 150px;">
<div class="container">
    <h1 class="mt-4">경기 이벤트</h1>
    <c:if test="${not empty events}">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">시간</th>
                <th scope="col">이벤트</th>
                <th scope="col">설명</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="event" items="${events}">
                <tr>
                    <td>${event.time}분</td>
                    <td>${event.type}</td>
                    <td>${event.detail}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty events}">
        <div class="alert alert-info" role="alert">
            이벤트가 없습니다.
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>
</div>
</div>
</body>
</html>
