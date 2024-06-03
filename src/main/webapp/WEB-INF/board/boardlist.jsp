<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body {
            font-family: 'Jua', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 50px;
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .page-header h5 {
            margin: 0;
            color: #495057;
        }
        .btn-write {
            width: 100px;
        }
        .table thead {
            background-color: #e9ecef;
        }
        .table td, .table th {
            vertical-align: middle;
            text-align: center;
        }
        .table tbody tr:hover {
            background-color: #f1f3f5;
        }
        .pagination {
            justify-content: center;
        }
        .pagination a {
            color: black;
            text-decoration: none;
        }
        .pagination a.active {
            color: red;
        }
        .no-data {
            font-size: 18px;
            color: #868e96;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h5>총 ${totalCount}개의 글이 있습니다</h5>
        <c:if test="${sessionScope.loginok != null}">
            <button type="button" class="btn btn-sm btn-outline-success btn-write"
                    onclick="location.href='./form'">글쓰기</button>
        </c:if>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="15%">작성일</th>
            <th width="10%">조회</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${totalCount == 0}">
            <tr>
                <td colspan="5" class="text-center no-data">
                    <b>등록된 글이 없습니다</b>
                </td>
            </tr>
        </c:if>
        <c:forEach var="dto" items="${list}" varStatus="status">
            <tr>
                <td>${no - status.index}</td>
                <td class="text-start">
                    <a href="./detail?num=${dto.num}&currentPage=${currentPage}" class="text-decoration-none text-dark">
                            ${dto.title}
                        <c:if test="${dto.photo != 'no' && dto.photo != null}">
                            <i class="bi bi-image" style="color: gray;"></i>
                        </c:if>
                    </a>
                </td>
                <td>${dto.nickname}</td>
                <td>
                    <fmt:formatDate value="${dto.writeday}" pattern="yyyy.MM.dd."/>
                </td>
                <td>${dto.readcount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${startPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="./list?currentPage=${startPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <li class="page-item <c:if test='${currentPage == pp}'>active</c:if>">
                    <a class="page-link" href="./list?currentPage=${pp}">${pp}</a>
                </li>
            </c:forEach>
            <c:if test="${endPage < totalPage}">
                <li class="page-item">
                    <a class="page-link" href="./list?currentPage=${endPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
</body>
</html>
