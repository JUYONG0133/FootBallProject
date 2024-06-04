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
    let jungbok = false;
    $(function() {
        $("#myfile").change(function() {
            let reg = /(.*?)\/(jpg|jpeg|png|gif)$/;
            let f = $(this)[0].files[0];
            if (!f.type.match(reg)) {
                alert("이미지 파일만 가능합니다");
                return;
            }
            if (f) {
                let reader = new FileReader();
                reader.onload = function(e) {
                    $("#showimg").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            }
        });

        // 중복 버튼 이벤트
        $("#btncheckid").click(function() {
            if ($("#id").val() == '') {
                alert("가입할 아이디를 입력해주세요");
                return;
            }

            $.ajax({
                type: "get",
                dataType: "json",
                url: "/member/idcheck",
                data: {"searchid": $("#id").val()},
                success: function(data) {
                    if (data.count == 0) {
                        alert("가입 가능한 아이디입니다");
                        jungbok = true;
                    } else {
                        alert("이미 가입되어있는 아이디입니다");
                        jungbok = false;
                        $("#id").val("");
                    }
                },
                error: function(xhr, status, error) {
                    alert("서버와의 통신에 문제가 발생했습니다: " + error);
                    jungbok = false;
                }
            });
        });

        // 아이디를 입력시 다시 중복확인을 누르도록 중복변수를 초기화
        $("#id").keyup(function() {
            jungbok = false;
        });
    });

    function check() {
        if (!jungbok) {
            alert("아이디 중복확인을 해주세요");
            return false; // false 반환 시 action 실행을 안함
        }
    }
</script>
<body>
<div class="container">
    <h1>회원가입</h1>
    <form action="./insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
        <div class="profile-section">
            <img src="https://via.placeholder.com/50" alt="Profile Image" id="showimg">
            <div>
                <input type="file" id="myfile" name="myfile">
            </div>
        </div>
        <div class="form-group">
            <label>이름</label>
            <input type="text" id="username" name="name" placeholder="이름을 입력하세요" required>
        </div>
        <div class="form-group">
            <label>아이디</label>
            <input type="text" name="id" id="id" placeholder="아이디를 입력하세요" required>
            <button type="button" class="btn btn-sm btn-danger" id="btncheckid">중복확인</button>
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="pw" placeholder="8글자이내로 입력하세요" maxlength="8" required>
        </div>
        <div class="form-group">
            <label>닉네임</label>
            <input type="text" name="nickname" placeholder="닉네임을 입력하세요" required>
        </div>
        <div class="form-group">
            <label>이메일</label>
            <input type="email" name="email" placeholder="이메일을 입력하세요" required>
        </div>
        <button class="save-btn" type="submit">회원가입</button>
    </form>
</div>
</body>
</html>
