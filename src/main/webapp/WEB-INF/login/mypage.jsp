<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
        }

        .container h1 {
            text-align: center;
            font-size: 24px;
        }

        .profile-section {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-section img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
        }

        .profile-section div {
            display: flex;
            flex-direction: column;
        }

        .profile-section .username {
            font-weight: bold;
        }

        .profile-section .change-photo {
            color: #007bff;
            cursor: pointer;
            font-size: 12px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group textarea {
            resize: vertical;
        }

        .urls .form-group {
            margin-bottom: 5px;
        }

        .save-btn {
            width: 100%;
            padding: 10px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
    </style>

</head>
<script type="text/javascript">
    $(function () {
        $("#myfile").change(function () {
            //console.log($(this)[0]);//type 이 file 인경우 배열타입으로 넘어온다
            let reg = /(.*?)\/(jpg|jpeg|png|gif)$/;
            let f = $(this)[0].files[0];
            if (!f.type.match(reg)) {
                alert("이미지 파일만 가능합니다");
                return;
            }
            if (f) {
                let reader = new FileReader();
                reader.onload = function (e) {
                    $("#showimg").attr("src", e.target.result);
                }
                reader.readAsDataURL($(this)[0].files[0]);
            }
        });

    });  //close function
</script>
<body>
<div class="container">
    <h1>마이페이지</h1>
    <form action="./update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="num" value="${dto.num}">
        <div class="profile-section">
            <img src="https://via.placeholder.com/50" alt="Profile Image" id="showimg">
            <div>
                <input type="file" id="myfile">
            </div>
        </div>
        <div class="form-group">
            <label>이름 : ${dto.name}</label>
        </div>
        <div class="form-group">
            <label>아이디 : ${dto.id}</label>
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="pw" value="${dto.pw}" required>
        </div>
        <div class="form-group">
            <label>닉네임</label>
            <input type="text" name="nickname" value="${dto.nickname}" required>
        </div>
        <div class="form-group">
            <label>이메일</label>
            <input type="email" name="email" value="${dto.email}" required>
        </div>
        <div class="form-group">
            <label>가입일 :
                <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/></label>
        </div>
        <button class="save-btn" type="submit">수정</button>
    </form>
</div>
</body>
</html>
