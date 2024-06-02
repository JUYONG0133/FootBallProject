<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프리미어리그</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .navbar button {
            margin: 0 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: white;
            cursor: pointer;
        }
        .content {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .carousel {
            display: flex;
            gap: 10px;
        }
        .carousel img {
            width: 100px;
            height: 100px;
            border-radius: 10px;
        }
        .news-table {
            border-collapse: collapse;
            width: 50%;
            background-color: white;
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
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            padding: 20px;
        }
        .grid .card {
            width: 150px;
            height: 100px;
            border-radius: 10px;
            background-image: url('https://via.placeholder.com/150');
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="content">
    <div class="carousel-wrapper">
        <b>이슈 Pick</b>
        <div class="carousel">
            <img src="../image/mycar/mycar1.png" alt="Image 1">
            <img src="../image/mycar/mycar2.png" alt="Image 2">
            <img src="../image/mycar/mycar3.png" alt="Image 3">
            <img src="../image/mycar/mycar4.png" alt="Image 4">
            <img src="../image/mycar/mycar5.png" alt="Image 5">
            <img src="../image/mycar/mycar6.png" alt="Image 6">
        </div>
    </div>
    <table class="news-table">
        <thead>
        <tr>
            <th>Title</th>
            <th>Col 1</th>
            <th>Col 2</th>
            <th>Col 3</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Row 1</td>
            <td>123</td>
            <td>456</td>
            <td>789</td>
        </tr>
        <tr>
            <td>Row 2</td>
            <td>123</td>
            <td>456</td>
            <td>789</td>
        </tr>
        <tr>
            <td>Row 3</td>
            <td>123</td>
            <td>456</td>
            <td>789</td>
        </tr>
        <tr>
            <td>Row 4</td>
            <td>123</td>
            <td>456</td>
            <td>789</td>
        </tr>
        <tr>
            <td>Row 5</td>
            <td>123</td>
            <td>456</td>
            <td>789</td>
        </tr>
        <tr>
            <td>Row 6</td>
            <td>123</td>
            <td>456</td>
            <td>789</td>
        </tr>
        <tr>
            <td>Row 7</td>
            <td>123</td>
            <td>456</td>
            <td>789</td>
        </tr>
        </tbody>
    </table>
</div>
<div class="grid">
    <div class="card">
        <div>Title</div>
        <div>Description</div>
    </div>
    <div class="card">
        <div>Title</div>
        <div>Description</div>
    </div>
    <div class="card">
        <div>Title</div>
        <div>Description</div>
    </div>
    <div class="card">
        <div>Title</div>
        <div>Description</div>
    </div>
</div>
</body>
</html>
