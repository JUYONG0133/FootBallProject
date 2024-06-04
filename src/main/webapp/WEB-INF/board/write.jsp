<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글쓰기 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body * {
            font-family: 'Jua', sans-serif;
        }
        .tab {
            margin-left: 280px;
        }
    </style>
</head>
<body>
<c:if test="${sessionScope.loginok == null}">
    <script type="text/javascript">
        alert("먼저 로그인 후 글을 작성해주세요.");
        history.back();
    </script>
</c:if>
<div style="margin-left: 100px;">

<form action="./insert" method="post" enctype="multipart/form-data">
    <input type="hidden" name="currentPage" value="${currentPage}">

    <table class="tab table table-bordered" style="width: 500px;">
        <caption align="top"><h4><b>글 쓰기</b></h4></caption>
        <tr>
            <th width="50" class="table-warning" style="background-color: #a0b4e5">제목</th>
            <td width="180">
                <input type="text" name="title" class="form-control" required>
            </td>
            <td rowspan="2" width="70">
                <img src="" id="showimg1" style="height: 100px; position: relative; border: 1px solid black" onerror="this.src='../image/uefalogo.jpeg'">
            </td>
        </tr>
        <tr>
            <th width="50" class="table-warning" style="background-color: #a0b4e5">사진</th>
            <td width="180">
                <input type="file" name="upload" id="upload" class="form-control">
            </td>
        </tr>
        <tr style="height: 300px;">
            <td colspan="3">
                <textarea name="content" required style="width: 100%; height: 300px;" placeholder="내용을 입력하세요"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="text-center">
                <button type="submit" class="btn btn-secondary" style="width: 100px;">글저장</button>
                <button type="button" class="btn btn-secondary" style="width: 100px;" onclick="history.back()">이전으로</button>
            </td>
        </tr>
    </table>
</form>

    <script>
        $(function () {
            $("#upload").change(function () {
                //console.log($(this));
                let reg = /(.*?)\/(jpg|jpeg|png|gif)$/;
                let f = $(this)[0].files[0];
                if (!f.type.match(reg)) {
                    alert("이미지 파일만 가능합니다.");
                    return;
                }
                if ($(this)[0].files[0]) {
                    let reader = new FileReader();
                    reader.onload = function (e) {
                        $("#showimg1").attr("src", e.target.result);
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }
            });
        });
    </script>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
