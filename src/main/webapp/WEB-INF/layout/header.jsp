<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>해외 축구 갤러리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body {
            font-family: 'Gaegu', cursive; /* 더욱 유쾌한 느낌을 주기 위해 폰트를 'Gaegu'로 변경했습니다. */
            background-color: #ffffff; /* 밝은 흰색 배경 */
            color: #333; /* 어두운 텍스트 색상 */
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #f8f9fa; /* 헤더 배경색을 흰색에 가깝게 조정 */
            color: #333; /* 흰색 텍스트 색상 */
            /*padding: 20px 0; !* 패딩을 더 늘려줌 *!*/
            text-align: center;
            font-size: 32px; /* 더 큰 폰트 크기 */
            font-weight: bold; /* 굵은 텍스트 */
            margin-bottom: 20px; /* 아래 여백 추가 */
        }
        .logo {
            width: 80px; /* 로고 크기 증가 */
            height: 80px;
            border-radius: 50%; /* 원형 테두리 */
            margin-bottom: 10px; /* 아래 여백 추가 */
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="header"><img src="${root}/image/uefalogo.jpeg" class="logo"> 해외 축구 갤러리</div>
</body>
</html>
