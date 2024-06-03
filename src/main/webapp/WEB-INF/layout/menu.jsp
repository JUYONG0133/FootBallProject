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
        div.menu {
            background-color: #4071e3;
            text-align: center;
        }
        div.bt button {
            width: 120px;
            height: 50px;
            line-height: 30px;
            background-color: #ffffff;
            border: 2px solid #4071e3;
            border-radius: 20px;
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 18px;
            color: #4071e3;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }
        div.bt button:hover {
            background-color: #a0b4e5;
            color: #ffffff;
            transform: translateY(-10px); /* 위로 5px 이동 */
            transition: transform 0.2s; /* 부드러운 이동 효과 */
        }
    </style>
</head>
<c:set  var="root" value="<%=request.getContextPath()%>"/>
<body>
<div class="menu">
    <div class="bt" style="margin-left: 500px;">
        <button type="button" onclick="location.href='../home.jsp'">Home</button>
        <button type="button" onclick="location.href='${root}/test/pl?month=5'">일정</button>
    <button type="button" onclick="location.href='${root}/test/list'">순위</button>
    <button type="button" onclick="location.href='../board.jsp'">게시판</button>
        <img src="../aa.jpg"  style="border: 3px solid black; border-radius: 20px; margin-left: 250px;">
        <button type="button">로그인</button>
        <button type="button" onclick="location.href='../loginform.jsp'">회원가입</button>
    </div>
</div>

<!-- 로그인 모달 다이얼로그 -->
<div class="modal" id="myLoginModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">회원 로그인</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form id="loginfrm">
                <!-- Modal body -->
                <div class="modal-body">
                    <table class="table table-bordered">
                        <caption align="top">
                            <label>
                                <input type="checkbox" name="saveid" ${sessionScope.saveid == null or sessionScope.saveid == 'no'?"":"checked"}>
                                &nbsp;아이디저장
                            </label>
                        </caption>
                        <tr>
                            <th class="table-success" width="80">아이디</th>
                            <td>
                                <input type="text" name="myid" class="form-control" required="required"
                                       value="${sessionScope.saveid != null and sessionScope.saveid =='yes'?sessionScope.loginid:''}">
                            </td>
                        </tr>
                        <tr>
                            <th class="table-success" width="80">비밀번호</th>
                            <td>
                                <input type="password" name="pass" id="pass" class="form-control"
                                       required="required">
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-sm btn-danger" data-bs-dismiss="modal"
                            id="btnmemberlogin">로그인</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                            id="btnclose">닫기</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
