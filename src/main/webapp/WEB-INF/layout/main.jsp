<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프리미어리그</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
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
        .news-table {
            margin-left: 20px;
            flex: 1;
        }

        .news-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .news-card {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-left: 50px;
        }
        .news-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        .news-card h3 {
            font-size: 1.2em;
            margin: 10px;
        }
        .news-card p {
            margin: 10px;
        }
        .carousel-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="top-section">
        <div class="carousel-wrapper" style="margin-left: 20px;">
            <b>이슈 Pick</b>
            <div id="carouselExample" class="carousel" style="margin-top: 100px;">
                <img src="https://via.placeholder.com/100" alt="Pick 1">
                <img src="https://via.placeholder.com/100" alt="Pick 2">
                <img src="https://via.placeholder.com/100" alt="Pick 3">
                <img src="https://via.placeholder.com/100" alt="Pick 4">
                <img src="https://via.placeholder.com/100" alt="Pick 5">
                <img src="https://via.placeholder.com/100" alt="Pick 6">
                <img src="https://via.placeholder.com/100" alt="Pick 7">
                <img src="https://via.placeholder.com/100" alt="Pick 8">
            </div>
            <div class="carousel-controls">
                <button class="btn btn-light" onclick="moveCarousel(-1)"><i class="bi bi-chevron-left"></i></button>
                <button class="btn btn-light" onclick="moveCarousel(1)"><i class="bi bi-chevron-right"></i></button>
            </div>
        </div>
        <div class="news-table" style="margin-left: 130px;">
            <table class="table">
                <thead>
                <tr style="height: 50px; background-color: gray;">
                    <th><b>이 시각 많이 본 뉴스</b><a href="https://sports.news.naver.com/wfootball/news/index?isphoto=N&type=popular"><b style="margin-left: 300px;">더보기</b></a></th>
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
                </tbody>
            </table>
        </div>
    </div>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <div class="news-grid" style="margin-top: 100px;">
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/076/0004152391">
            <img src="${root}/image/a1.png" style="width: 300px; height: 150px;">
            <h3>Title</h3>
            <p>[오피셜]'기나긴 사가는 끝났다' 음바페, 레알...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/411/0000046955">
                <img src="${root}/image/a2.png" style="width: 300px; height: 150px;">
                <h3>Title</h3>
                <p>안토니보다 더 심각하다...'7경기 0골' FW 올...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/436/0000087049">
                <img src="${root}/image/a3.png" style="width: 300px; height: 150px;">
                <h3>Title</h3>
                <p>'독일 국대에 백인이 더 많아야죠?' 시대 역행...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/436/0000087050">
                <img src="${root}/image/a4.png" style="width: 300px; height: 150px;">
                <h3>Title</h3>
                <p>'저도 토트넘에서 나가고 싶어요' 러브콜 덥썩...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/108/0003240234">
                <img src="${root}/image/a5.png" style="width: 300px; height: 150px;">
                <h3>Title</h3>
                <p>첼시 마레스카 선임→곧바로 폭풍영입 준비...</p>
            </a>
        </div>
        <div class="news-card">
            <a href="https://m.sports.naver.com/wfootball/article/109/0005090418">
                <img src="${root}/image/a6.png" style="width: 300px; height: 150px;">
                <h3>Title</h3>
                <p>"팀을 협박했다"...'뒷통수 논란' 日 가마다...</p>
            </a>
        </div>
    </div>
</div>
<script>
    let currentSlide = 0;

    function moveCarousel(direction) {
        const carousel = document.getElementById('carouselExample');
        const items = carousel.querySelectorAll('img');
        const totalItems = items.length;
        const itemsToShow = 4;
        const maxSlide = totalItems - itemsToShow;

        currentSlide += direction;
        if (currentSlide < 0) currentSlide = 0;
        if (currentSlide > maxSlide) currentSlide = maxSlide;

        const offset = currentSlide * (items[0].offsetWidth + 10); // image width + margin
        carousel.style.transform = `translateX(-${offset}px)`;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
