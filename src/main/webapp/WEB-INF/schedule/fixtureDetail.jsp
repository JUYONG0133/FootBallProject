<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>경기 상세 정보</title>
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
<div class="container">
    <h1 class="mt-4">경기 상세 정보</h1>
    <c:if test="${not empty fixtureDetail}">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">경기 ID: ${fixtureDetail.id}</h5>
                <p class="card-text">라운드: ${fixtureDetail.round}</p>
                <p class="card-text">홈 팀: ${fixtureDetail.homeTeam}</p>
                <p class="card-text">원정 팀: ${fixtureDetail.awayTeam}</p>
                <p class="card-text">날짜: ${fn:substring(fn:replace(fixtureDetail.date, 'T', ' '), 0, 16)}</p>
                <p class="card-text">경기장: ${fixtureDetail.venue}</p>
                <p class="card-text">상태: ${fixtureDetail.status}</p>
            </div>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>
    <a href="${pageContext.request.contextPath}/schedule/events/${fixture.id}" class="btn btn-primary mt-3">경기 이벤트 보기</a>
</div>
</body>
</html>
