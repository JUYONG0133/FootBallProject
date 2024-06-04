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
    <style>
        body * {
            font-family: 'Jua';
        }
        .table th {
            background-color: #343a40;
            color: #ffffff;
        }
    </style>
</head>
<body>
<div style="margin-left: 150px;">
<div class="container">
    <h1 class="mt-4 d-flex align-items-center">
        경기 일정
        <button type="button" class="btn btn-sm btn-secondary ms-auto me-2" onclick="location.href='/schedule/pl?month=5'">프리미어리그</button>
        <button type="button" class="btn btn-sm btn-secondary  me-2" onclick="location.href='/schedule/a1?month=5'">세리에 A</button>
        <button type="button" class="btn btn-sm btn-secondary me-2" onclick="location.href='/schedule/bun?month=5'">분데스리가</button>
        <button type="button" class="btn btn-sm btn-secondary me-2" onclick="location.href='/schedule/LL?month=5'">라리가</button>
    </h1>

    <form method="get" action="${pageContext.request.contextPath}/schedule/a1" class="mb-4">
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
                <th>라운드</th>
                <th>홈 팀</th>
                <th>원정 팀</th>
                <th>날짜</th>
            </tr>
            </thead>
<%--            <tbody id="fixtureTableBody">--%>
<%--            <c:forEach var="fixture" items="${fixtures}">--%>
<%--                <tr>--%>
<%--                    <td>${fn:substringAfter(fixture.round, ' - ')} 라운드</td>--%>
<%--                    <td><a href="${pageContext.request.contextPath}/schedule/detail/${fixture.id}">${fixture.homeTeam}</a></td>--%>
<%--                    <td>${fixture.awayTeam}</td>--%>
<%--                    <td>${fn:substring(fn:replace(fixture.date, 'T', ' '), 0, 16)}</td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>

            <tbody id="fixtureTableBody">
            <c:forEach var="fixture" items="${fixtures}">
                <tr>
                    <td>${fn:substringAfter(fixture.round, ' - ')} 라운드</td>
                    <td><a href="${pageContext.request.contextPath}/schedule/detail/${fixture.id}">${fixture.homeTeam}</a></td>
                    <td>${fixture.awayTeam}</td>
                    <td>${fn:substring(fn:replace(fixture.date, 'T', ' '), 0, 16)}</td>
                </tr>
            </c:forEach>
            </tbody>

            </tbody>
        </table>
    </c:if>
</div>
</div>
<script>
    $(document).ready(function () {
        sortTableByDate();
    });

    function sortTableByDate() {
        var rows = $('#fixtureTableBody tr').get();

        rows.sort(function (a, b) {
            var dateA = new Date($(a).find('td:eq(3)').text());
            var dateB = new Date($(b).find('td:eq(3)').text());

            return dateA - dateB;
        });

        $.each(rows, function (index, row) {
            $('#fixtureTableBody').append(row);
        });
    }
</script>
</body>
</html>
