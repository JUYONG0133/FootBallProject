<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body {
            font-family: 'Jua', sans-serif;
        }

        .container {
            margin-top: 30px;
            max-width: 900px;
        }

        .post-header {
            display: flex;
            align-items: center;
            border: 2px solid salmon;
            border-radius: 20px;
            margin-bottom: 20px;
        }

        .post-header img {
            width: 45px;
            height: 45px;
            margin-right: 10px;
            border-radius: 50%;
        }

        .post-header .title {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .post-header .metadata {
            color: gray;
            font-size: 0.9rem;
        }

        .post-content {
            background: white;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid salmon;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .post-content img {
            max-width: 100%;
            border-radius: 8px;
            margin: 10px 0;
        }

        .comment-section {
            margin-top: 30px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .comment-section textarea {
            width: 100%;
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 10px;
        }

        .comment-section .btn {
            height: 45px;
        }

        .answerlist {
            margin-top: 20px;
        }

        .answerlist .comment {
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }

        .answerlist .comment:last-child {
            border-bottom: none;
        }

        .answerlist .comment .content {
            white-space: pre-wrap;
        }

        .answerlist .comment .actions {
            color: gray;
            font-size: 0.9em;
            margin-top: 5px;
        }

        .post-buttons {
            margin-top: 20px;
        }

        .post-buttons .btn {
            margin-right: 10px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            answer_list();

            $("#btnansweradd").click(function () {
                let num = ${dto.idx};
                let content = $("#acontent").val();
                if (content == '') {
                    alert("댓글을 입력후 등록해주세요");
                    return;
                }

                $.ajax({
                    type: 'post',
                    dataType: 'json', // 데이터 타입을 json으로 변경
                    url: "./ainsert",
                    data: {"num": num, "content": content},
                    success: function (data) {
                        answer_list();
                        $("#acontent").val("");
                    },
                    error: function (request, status, error) {
                        console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });

            $(document).on("click", ".adel", function () {
                let aidx = $(this).attr("aidx");
                let a = confirm("해당 댓글을 삭제할까요?");
                if (a) {
                    $.ajax({
                        type: "get",
                        dataType: "text",
                        data: {"aidx": aidx},
                        url: "./adelete",
                        success: function () {
                            answer_list();
                        },
                        error: function (request, status, error) {
                            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                        }
                    })
                }
            });

            $('#likeBtn').click(function() {
                $.ajax({
                    url: '${pageContext.request.contextPath}/board/like',
                    type: 'POST',
                    data: { idx: ${dto.idx} },
                    success: function(response) {
                        $('#likeCount').text(response.likes);
                    },
                    error: function(xhr, status, error) {
                        console.error('좋아요 요청 실패:', status, error);

                    }
                });
            });

            $('#unlikeBtn').click(function() {
                $.ajax({
                    url: '${pageContext.request.contextPath}/board/dislike',
                    type: 'POST',
                    data: { idx: ${dto.idx} },
                    success: function(response) {
                        $('#unlikeCount').text(response.unlikes);
                    },
                    error: function(xhr, status, error) {
                        console.error('싫어요 요청 실패:', status, error);
                    }
                });
            });
        });

        function answer_list() {
            let num = ${dto.idx};
            let loginok = '${sessionScope.loginok}';
            let loginid = '${sessionScope.loginid}';

            $.ajax({
                type: "get",
                dataType: "json",
                data: {"num": num},
                url: "./alist",
                success: function (data) {
                    $(".answercount").text(data.length);
                    let s = "";
                    $.each(data, function (idx, ele) {
                        s += `
                            <div class="comment">
                                <b>${ele.writer}(${ele.myid})</b>
                                <span class="aday">${ele.writeday}</span>`;
                        if (loginok == 'yes' && loginid == ele.myid) {
                            s += `<i class="bi bi-trash adel" aidx="${ele.aidx}" style="cursor:pointer;"></i>`;
                        }
                        s += `<div class="content">${ele.content}</div>
                            </div>`;
                    });
                    $(".answerlist").html(s);
                },
                error: function (request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            })
        }
    </script>
</head>
<c:set var="stpath" value="https://kr.object.ncloudstorage.com/bitcamp-bh-98/football"/>

<body>
<div class="container">
    <div class="post-header">
        <img src="${stpath}/${profile_photo}" onerror="this.src='../image/noimage1.png'">
        <div>
            <div class="title">${dto.title}</div>
            <div class="metadata">
                <b>${dto.nickname}</b><br>
                <fmt:formatDate value="${dto.writeday}" pattern="yyyy.MM.dd HH:mm"/>
                &nbsp; | &nbsp; 조회수: ${dto.readcount}
                <span style="float: right;">
                    <i class="bi bi-chat-dots"></i> 댓글 <span class="answercount"></span>
                </span>
            </div>
        </div>
    </div>

    <div class="post-content">
        <c:if test="${dto.photo!='no' and dto.photo!=null}">
            <img src="${stpath}/${dto.photo}" onerror="this.src='../image/pl.png'">
        </c:if>
        <pre>${dto.content}</pre>
    </div>

    <div class="post-actions">
        <button id="likeBtn">좋아요 (<span id="likeCount">${dto.likes}</span>)</button>
        <button id="unlikeBtn">싫어요 (<span id="unlikeCount">${dto.unlikes}</span>)</button>
    </div>

    <div class="comment-section">
        <h5>댓글</h5>
        <div class="answerlist"></div>
        <c:if test="${sessionScope.loginok!=null}">
            <textarea id="acontent" placeholder="댓글을 입력하세요..."></textarea>
            <button type="button" class="btn btn-outline-success" id="btnansweradd">등록</button>
        </c:if>
    </div>

    <div class="post-buttons">
        <c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.myid}">
            <button type="button" class="btn btn-sm btn-outline-secondary"
                    onclick="location.href='./updateform?idx=${dto.idx}&currentPage=${currentPage}'">수정
            </button>
            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="del()">삭제</button>
        </c:if>
        <button type="button" class="btn btn-sm btn-outline-secondary"
                onclick="location.href='./list?currentPage=${currentPage}'">목록
        </button>
    </div>
</div>
<script>
    function del() {
        let num = ${dto.idx};
        let currentPage = ${currentPage};

        let a = confirm("정말 삭제하시겠습니까?");
        if (a) {
            location.href = "./delete?idx=" + num + "&currentPage=" + currentPage;
        }
    }
</script>
</body>
</html>
