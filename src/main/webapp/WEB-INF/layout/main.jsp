<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프리미어리그</title>

    <style>
        body * {
            font-family: 'Jua';
        }

        .content {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .carousel-container {
            display: flex;
            align-items: center;
        }
        .carousel-wrapper {
            overflow: hidden;
            width: 440px; /* 4 images * 100px + 3 margins * 10px */
        }
        .carousel {
            display: flex;
            transition: transform 0.5s ease;
        }
        .carousel img {
            min-width: 100px;
            height: 100px;
            border-radius: 10px;
        }
        .carousel img:not(:first-child) {
            margin-left: 10px;
        }
        .carousel-buttons {
            display: flex;
            align-items: center;
        }
        .carousel-buttons button {
            padding: 10px;
            background-color: #4a90e2;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .news-table {
            border-collapse: collapse;
            width: 300px;
            background-color: white;
            float: right;
        }
        .news-table th, .news-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .news-table th {
            background-color: #f2f2f2;
        }
        .grid {
            float: left;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            padding: 20px;
        }
        .grid .card {
            width: 150px;
            height: 200px; /* Adjusted height to fit image and text */
            border-radius: 10px;
            background-size: cover;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            align-items: center;
            color: white;
            font-size: 16px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .grid .card img {
            width: 100%;
            height: auto;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
        }
        .grid .card div {
            z-index: 2;
            position: relative;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            width: 100%;
            padding: 5px;
        }
        b.ma{
            margin-right: 180px;
        }

    </style>
</head>

<body>
<div class="content">
    <div class="carousel-container" style="margin-left: 120px;">
        <div class="carousel-buttons">
            <button onclick="moveLeft()">&#60;</button>
        </div>
        <div class="carousel-wrapper">
            <b>이슈 Pick</b>
            <div class="carousel" id="carousel">
                <img src="../image/uefalogo.jpeg" alt="Image 1">
                <img src="../image/uefalogo.jpeg" alt="Image 2">
                <img src="../image/uefalogo.jpeg" alt="Image 3">
                <img src="../image/uefalogo.jpeg" alt="Image 4">
                <img src="../image/uefalogo.jpeg" alt="Image 5">
                <img src="../image/uefalogo.jpeg" alt="Image 6">
                <img src="../image/uefalogo.jpeg" alt="Image 7">
            </div>
        </div>
        <div class="carousel-buttons">
            <button onclick="moveRight()">&#62;</button>
        </div>
    </div>

    <table class="news-table">
        <thead>
        <tr>
            <th>뉴스</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><a href="https://m.sports.naver.com/wfootball/article/477/0000493847" target="_blank"><b>'희찬아 안녕' 울버햄튼 떠난다…연봉 '2배' 제안에 맨유행 '고민'</b></a></td>
        </tr>
        <tr>
            <td>기사 2</td>
        </tr>
        <tr>
            <td>기사 3</td>
        </tr>
        <tr>
            <td>기사 4</td>
        </tr>
        <tr>
            <td>기사 5</td>
        </tr>
        <tr>
            <td>기사 6</td>
        </tr>
        <tr>
            <td>기사 6</td>
        </tr>
        <tr>
            <td>기사 6</td>
        </tr>
        </tbody>
    </table>
</div>
<br><br>
<div class="grid">
    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 1">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>
    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 2">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>

    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 3">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>
</div>
<div class="grid">
    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 1">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>
    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 2">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>

    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 3">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>
</div>
<div class="grid">
    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 1">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>
    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 2">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>

    <div class="card">
        <img src="../image/uefalogo.jpeg" alt="Image 3">
        <div>Title</div>
        <div>Description</div>
    </div>
    <b class="ma">ㅇㅇ</b>
</div>


<script>
    let currentIndex = 0;
    const carousel = document.getElementById('carousel');
    const images = carousel.querySelectorAll('img');
    const totalImages = images.length;

    function moveLeft() {
        if (currentIndex > 0) {
            currentIndex--;
        } else {
            currentIndex = totalImages - 4; // Assuming 4 images are shown at a time
        }
        updateCarousel();
    }

    function moveRight() {
        if (currentIndex < totalImages - 4) { // Assuming 4 images are shown at a time
            currentIndex++;
        } else {
            currentIndex = 0;
        }
        updateCarousel();
    }

    function updateCarousel() {
        const offset = -currentIndex * (images[0].clientWidth + 10); // 10px margin
        carousel.style.transform = `translateX(${offset}px)`;
    }

    window.addEventListener('resize', updateCarousel); // Update the carousel when the window is resized
</script>
</body>
</html>
