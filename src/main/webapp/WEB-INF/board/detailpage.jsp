<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Insert title here</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">--%>
<%--    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>--%>
<%--    <style>--%>
<%--        body *{--%>
<%--            font-family: 'Jua';--%>
<%--        }--%>
<%--        .table {--%>
<%--            margin-top: 30px;--%>
<%--            margin-left: 150px;--%>
<%--        }--%>

<%--        td.buttons button{--%>
<%--            width: 80px;--%>
<%--        }--%>

<%--        pre.adata{--%>
<%--            margin-top: 20px;--%>
<%--            margin-right: 230px;--%>
<%--            color: black;--%>
<%--        }--%>

<%--        span.aday{--%>
<%--            margin-left: 100px;--%>
<%--            color: gray;--%>
<%--            font-size: 0.9em;--%>
<%--        }--%>
<%--    </style>--%>
<%--    <script type="text/javascript">--%>
<%--        $(function(){--%>
<%--            //처음 로딩시 댓글 목록 출력--%>
<%--            answer_list();--%>

<%--            //댓글 추가 버튼--%>
<%--            $("#btnansweradd").click(function(){--%>
<%--                let num=${dto.idx};--%>
<%--                let content=$("#acontent").val();--%>
<%--                if(content==''){--%>
<%--                    alert("댓글을 입력후 등록해주세요");--%>
<%--                    return;--%>
<%--                }--%>

<%--                $.ajax({--%>
<%--                    type:'post',--%>
<%--                    dataType:'text',--%>
<%--                    url:"./ainsert",--%>
<%--                    data:{"num":num,"content":content},--%>
<%--                    success:function(){--%>
<%--                        //댓글 목록 다시 출력--%>
<%--                        answer_list();--%>
<%--                        //초기화--%>
<%--                        $("#acontent").val("");--%>
<%--                    }--%>
<%--                });--%>
<%--            });--%>

<%--            //댓글 삭제 이벤트--%>
<%--            $(document).on("click",".adel",function(){--%>
<%--                let aidx=$(this).attr("aidx");--%>
<%--                let a=confirm("해당 댓글을 삭제할까요?");--%>
<%--                if(a){--%>
<%--                    $.ajax({--%>
<%--                        type:"get",--%>
<%--                        dataType:"text",--%>
<%--                        data:{"aidx":aidx},--%>
<%--                        url:"./adelete",--%>
<%--                        success:function(){--%>
<%--                            //댓글 삭제후 목록 다시 출력--%>
<%--                            answer_list();--%>
<%--                        }--%>
<%--                    })--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>

<%--        function answer_list(){--%>
<%--            let num=${dto.idx};--%>
<%--            //로그인중인지 로그인중일경우 로그인 아이디 얻기--%>
<%--            let loginok='${sessionScope.loginok}';--%>
<%--            let loginid='${sessionScope.loginid}';--%>
<%--            console.log(loginok+","+loginid);--%>

<%--            $.ajax({--%>
<%--                type:"get",--%>
<%--                dataType:"json",--%>
<%--                data:{"num":num},--%>
<%--                url:"./alist",--%>
<%--                success:function(data){--%>
<%--                    //댓글 갯수 출력--%>
<%--                    $(".answercount").text(data.length);--%>
<%--                    //목록 출력--%>
<%--                    let s="";--%>
<%--                    $.each(data,function(idx,ele){--%>
<%--                        s+=--%>
<%--                            `--%>
<%--					  \${ele.writer}(\${ele.myid})--%>
<%--					  <span class="aday">\${ele.writeday}</span>--%>
<%--					  `;--%>
<%--                        //로그인중이면서 댓글 아이디와 로그인 아이디가 같을경우 삭제 아이콘 추가--%>
<%--                        if(loginok=='yes' && loginid==ele.myid){--%>
<%--                            s+=--%>
<%--                                `--%>
<%--						   <i class="bi bi-trash adel" aidx="\${ele.aidx}"--%>
<%--						   style="cursor:pointer;"></i>--%>
<%--						   `--%>
<%--                        }--%>

<%--                        s+=`--%>
<%--					  <br>--%>
<%--					  <pre class="adata">\${ele.content}</pre>--%>
<%--					  <br>--%>
<%--					  `;--%>
<%--                    });--%>
<%--                    $(".answerlist").html(s);--%>
<%--                }--%>
<%--            })--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<c:set var="stpath" value="https://kr.object.ncloudstorage.com/bitcamp-bh-98/football"/>--%>

<%--<body>--%>
<%--<table class="table" style="width: 1100px;">--%>
<%--    <tr>--%>
<%--        <td>--%>
<%--            <h2><b>${dto.title}</b></h2>--%>
<%--            <!-- 프로필 사진 -->--%>
<%--            <img src="${stpath}/${profile_photo}"--%>
<%--                 onerror="this.src='../image/pl.png'"--%>
<%--                 style="width: 45px;height: 45px;margin-right:5px;"--%>
<%--                 class="rounded-circle" align="left">--%>
<%--            <b>${dto.nickname}</b><br>--%>
<%--            <span style="color: gray;font-size: 13px;">--%>
<%--			  	<fmt:formatDate value="${dto.writeday}"--%>
<%--                                pattern="yyyy.MM.dd HH:mm"/>--%>
<%--			  	 &nbsp; &nbsp;--%>
<%--			  	 조회 &nbsp;${dto.readcount}--%>
<%--			  </span>--%>
<%--            <span style="float: right;color: gray;">--%>
<%--			  	<i class="bi bi-chat-dots"></i>--%>
<%--			  	&nbsp;--%>
<%--			  	댓글 <span class="answercount"></span>--%>
<%--			  </span>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>--%>
<%--            <c:if test="${dto.photo!='no' and dto.photo!=null}">--%>
<%--                <img src="${stpath}/${dto.photo}"--%>
<%--                     onerror="this.src='../image/pl.png'"--%>
<%--                     style="max-width: 300px;">--%>
<%--                <br><br>--%>
<%--            </c:if>--%>
<%--            <pre style="font-size: 17px;">${dto.content}</pre>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>--%>
<%--            <!-- 댓글 출력할 영역 -->--%>
<%--            댓글--%>
<%--            <div class="answerlist"></div>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <c:if test="${sessionScope.loginok!=null}">--%>
<%--        <tr>--%>
<%--            <td>--%>
<%--                <b>댓글</b><br>--%>
<%--                <textarea style="width: 80%;height: 60px;" id="acontent"></textarea>--%>
<%--                <button type="button" class="btn btn-outline-success"--%>
<%--                        style="height: 65px;position: relative;top:-25px;"--%>
<%--                        id="btnansweradd">등록</button>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:if>--%>


<%--    <tr>--%>
<%--        <td class="buttons">--%>


<%--            <!-- 수정,삭제는 로그인중이며 자기가 쓴글에만 나타나게 하기 -->--%>
<%--            <c:if--%>
<%--                    test="${sessionScope.loginok!=null and sessionScope.loginid==dto.myid}">--%>
<%--                <button type="button" class="btn btn-sm btn-outline-secondary"--%>
<%--                        onclick="location.href='./updateform?idx=${dto.idx}&currentPage=${currentPage}'">--%>
<%--                    수정</button>--%>

<%--                <button type="button" class="btn btn-sm btn-outline-secondary"--%>
<%--                        onclick="del()">--%>
<%--                    삭제</button>--%>
<%--            </c:if>--%>

<%--            <button type="button" class="btn btn-sm btn-outline-secondary"--%>
<%--                    onclick="location.href='./list?currentPage=${currentPage}'">--%>
<%--                목록</button>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--</table>--%>
<%--<script>--%>
<%--    function del()--%>
<%--    {--%>
<%--        let num=${dto.idx};--%>
<%--        let currentPage=${currentPage};--%>

<%--        let a=confirm("정말 삭제하시겠습니까?");--%>
<%--        if(a){--%>
<%--            location.href="./delete?idx="+num+"&currentPage="+currentPage;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

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
                let num =${dto.idx};
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
            $(document).on("click", "#likeButton", function () {

                    let likes = ${dto.idx};
                $.ajax({
                    type: 'post',
                    dataType: 'json', // 데이터 타입을 json으로 변경
                    url: "./like",
                    data: {"likes": likes},
                    success: function (data) {


                        alert("ddd");
                        location.reload(); // 페이지를 새로고침하여 좋아요 수를 업데이트
                        }
                    });
                });

            $(document).on("click", "#dislikeButton", function () {
                    let unlike = ${dto.idx};
                    $.post("./dislike", {postId: unlike}, function () {
                        location.reload(); // 페이지를 새로고침하여 싫어요 수를 업데이트
                    });
                });
            });




        function answer_list() {
            let num =${dto.idx};
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
                                <b>\${ele.writer}(\${ele.myid})</b>
                                <span class="aday">\${ele.writeday}</span>`;
                        if (loginok == 'yes' && loginid == ele.myid) {
                            s += `<i class="bi bi-trash adel" aidx="\${ele.aidx}" style="cursor:pointer;"></i>`;
                        }
                        s += `<div class="content">\${ele.content}</div>
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

    <div>
        <button type="button" id="likeButton">좋아요</button>

        <button type="button" id="dislikeButton">싫어요</button>
   
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
        let num =${dto.idx};
        let currentPage =${currentPage};

        let a = confirm("정말 삭제하시겠습니까?");
        if (a) {
            location.href = "./delete?idx=" + num + "&currentPage=" + currentPage;
        }
    }
</script>
</body>
</html>
