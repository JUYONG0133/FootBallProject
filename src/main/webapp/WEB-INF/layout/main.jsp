<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프리미어리그</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@latest/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        .top-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .carousel-wrapper {
            width: 500px;
            overflow: hidden;
            position: relative;
            padding: 20px;
        }
        .carousel {
            display: flex;
            transition: transform 0.5s ease;
        }
        .carousel img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            margin: 0 5px;
        }
        .carousel-button {
            margin-left: 20px;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            border: none;
            color: white;
            font-size: 24px;
            cursor: pointer;
            z-index: 1;
        }
        .carousel-button.left {
            left: 0;
        }
        .carousel-button.right {
            right: 0;
        }
        .news-table {
            flex: 1;
            margin-left: 20px;
        }
        .news-table table {
            width: 110%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .news-table th, .news-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .news-table th {
            background-color: #4CAF50;
            color: white;
        }
        .news-table a {
            text-decoration: none;
            color: #000;
        }
        .news-table a:hover {
            text-decoration: underline;
        }
        .news-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }
        .news-card {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: calc(33.333% - 20px);
        }
        .news-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        .news-card p {
            margin: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <div class="top-section">
        <div class="carousel-wrapper">
            <div class="carousel-title"><b style="color: blue;">해외축구 이슈 Pick</b></div>
            <button class="carousel-button left">&lt;</button>
            <div id="carouselExample" class="carousel">
                <a href="https://m.sports.naver.com/wfootball/article/477/0000494019">
                    <img src="${root}/image/p1.png">
                </a>
                <a href="https://m.sports.naver.com/wfootball/article/117/0003837845">
                    <img src="${root}/image/p2.png">
                </a>
                <a href="https://m.sports.naver.com/wfootball/article/139/0002203726">
                    <img src="${root}/image/p3.png">
                </a>
                <a href="https://m.sports.naver.com/wfootball/article/109/0005090378">
                    <img src="${root}/image/p4.png">
                </a>
                <a href="https://m.sports.naver.com/wfootball/article/076/0004152360">
                    <img src="${root}/image/p5.png">
                </a>
                <a href="https://m.sports.naver.com/wfootball/article/477/0000494019">
                    <img src="${root}/image/p6.png">
                </a>
                <a href="https://m.sports.naver.com/wfootball/article/117/0003837847">

                    <img src="${root}/image/p7.png">
                </a>
                <a href="https://m.sports.naver.com/wfootball/article/477/0000494014">
                    <img src="${root}/image/p8.png">
                </a>
            </div>
            <button class="carousel-button right">&gt;</button>
        </div>

        <div class="news-table" style="margin-left: 110px;">
            <table class="table">
                <thead>
                <tr>
                    <th>이 시각 많이 본 뉴스<a href="https://sports.news.naver.com/wfootball/news/index?isphoto=N&type=popular" style="float: right; font-size: 12px; color: white;">더보기</a></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><a href="https://m.sports.naver.com/wfootball/article/117/0003837774">[오피셜] '2400억 FA 이적 완료' 레알, 음바페 영입 공식 발표...'5년 계약...</a></td>
                </tr>
                <tr>
                    <td><a href="https://m.sports.naver.com/wfootball/article/117/0003837759">"충격 대반전! 뮌헨 CB 판 뒤집혔다"…김민재 아니라 '데 리흐트+우파메카노...</a></td>
                </tr>
                <tr>
                    <td><a href="https://m.sports.naver.com/wfootball/article/411/0000046947">손흥민 동료, 휴가 도중 강도에 피습 사고...얼굴에 최루탄 습격+4억 5천짜리...</a></td>
                </tr>
                <tr>
                    <td><a href="https://m.sports.naver.com/wfootball/article/139/0002203719">‘갑작스러운 배신→첼시 이적’... 레스터 시티, 마레스카 감독 저격 “그의 결정에...</a></td>
                </tr>
                <tr>
                    <td><a href="https://m.sports.naver.com/wfootball/article/076/0004152364">'너무 잔혹한 구단!' 토트넘, '리빙 레전드' 손흥민과 재계약 대신 홀대한 충격...</a></td>
                </tr>
                <tr>
                    <td><a href="https://m.sports.naver.com/wfootball/article/109/0005090401">음바페, 염원의 레알 입단...갈락티코 4기 ING -> 벨링엄+음바페 한솥밥...</a></td>
                </tr>
                <tr>
                    <td><a href="https://m.sports.naver.com/wfootball/article/076/0004152391">[오피셜]'기나긴 사가는 끝났다' 음바페, 레알 마드리드행 확정 '계약기간...</a></td>
                </tr>
                <tr>
                    <td><a href="https://m.sports.naver.com/wfootball/article/139/0002203717">‘맨유 배신→첼시로 이적’ 희대의 통수왕, 퍼거슨과 20년 만에 재회...</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="news-grid">
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/076/0004152391">
                <img src="${root}/image/a1.png">
                <p>[오피셜]'기나긴 사가는 끝났다' 음바페, 레알...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/411/0000046955">
                <img src="${root}/image/a2.png">
                <p>안토니보다 더 심각하다...'7경기 0골' FW 올...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/436/0000087049">
                <img src="${root}/image/a3.png">
                <p>'독일 국대에 백인이 더 많아야죠?' 시대 역행...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/436/0000087050">
                <img src="${root}/image/a4.png">
                <p>'저도 토트넘에서 나가고 싶어요' 러브콜 덥썩...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/108/0003240234">
                <img src="${root}/image/a5.png">
                <p>첼시 마레스카 선임→곧바로 폭풍영입 준비...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/109/0005090418">
                <img src="${root}/image/a6.png">
                <p>"팀을 협박했다"...'뒷통수 논란' 日 가마다...</p>
            </a>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const carousel = document.querySelector('.carousel');
        const images = document.querySelectorAll('.carousel img');
        let currentIndex = 0;
        const imageWidth = 110; // 이미지 너비 + 여백
        const totalImages = images.length;

        function updateCarousel() {
            carousel.style.transform = `translateX(${-currentIndex * imageWidth}px)`;
        }

        document.querySelector('.carousel-button.left').addEventListener('click', () => {
            if (currentIndex > 0) {
                currentIndex--;
            } else {
                currentIndex = totalImages - 1;
            }
            updateCarousel();
        });

        document.querySelector('.carousel-button.right').addEventListener('click', () => {
            if (currentIndex < totalImages - 1) {
                currentIndex++;
            } else {
                currentIndex = 0;
            }
            updateCarousel();
        });
    });
</script>
</body>
</html>
