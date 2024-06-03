<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>경기 일정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body * {
            font-family: 'Jua';
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-4">경기 일정</h1>

    <form method="get" action="${pageContext.request.contextPath}/test/test" class="mb-4">
        <div class="input-group">
            <label class="input-group-text" for="monthSelect">월 선택</label>
            <select class="form-select" id="monthSelect" name="month">
                <c:forEach begin="1" end="12" var="month">
                    <option value="${month}" <c:if test="${param.month == month}">selected</c:if>>${month}월</option>
                </c:forEach>
            </select>
            <button class="btn btn-primary" type="submit">확인</button>
        </div>
    </form>

    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>
    <c:if test="${empty error}">
        <table class="table table-striped mt-4">
            <thead>
            <tr>
                <th>홈 팀</th>
                <th>원정 팀</th>
                <th>날짜</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="fixture" items="${fixtures}">
                <c:if test="${fn:substring(fixture.date, 5, 7) == (param.month < 10 ? '0' : '') + param.month}">
                    <tr>
                        <td>${fixture.homeTeam}</td>
                        <td>${fixture.awayTeam}</td>
                        <td>${fn:substring(fn:replace(fixture.date, 'T', ' '), 0, 16)}</td> <!-- 'T'를 공백으로 대체 -->
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
