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
            width: 100%;
            margin: 0 auto;
            padding: 20px;
        }
        .head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .head h1 {
            font-size: 24px;
            margin: 0;
        }
        .search-filter {
            display: flex;
            gap: 10px;
        }
        .search-filter input, .search-filter button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        .priority-high {
            color: red;
        }
        .priority-medium {
            color: orange;
        }
        .priority-low {
            color: green;
        }
        .owner img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }
        .project, .priority, .date, .owner {
            white-space: nowrap;
        }
        .ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>


    </style>

</head>
<body>
<div class="container">
    <div class="head">
        <h1>게시판</h1>
        <div class="search-filter">
            <input type="text" placeholder="Search tickets...">
            <button>Filter</button>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
            <th>프로필</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>FIG-123</td>
            <td class="ellipsis">Task 1</td>
            <td class="project">Project 1</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile1.jpg" alt="Owner 1"></td>
        </tr>
        <tr>
            <td>FIG-122</td>
            <td class="ellipsis">Task 2</td>
            <td class="project">Acme GTM</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile2.jpg" alt="Owner 2"></td>
        </tr>
        <tr>
            <td>FIG-121</td>
            <td class="ellipsis">Write blog post for demo day</td>
            <td class="project">Acme GTM</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile3.jpg" alt="Owner 3"></td>
        </tr>
        <tr>
            <td>FIG-120</td>
            <td class="ellipsis">Publish blog page</td>
            <td class="project">Website launch</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile4.jpg" alt="Owner 4"></td>
        </tr>
        <tr>
            <td>FIG-119</td>
            <td class="ellipsis">Add gradients to design system</td>
            <td class="project">Design backlog</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile5.jpg" alt="Owner 5"></td>
        </tr>
        <tr>
            <td>FIG-118</td>
            <td class="ellipsis">Responsive behavior doesn't work on Android</td>
            <td class="project">Bug fixes</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile6.jpg" alt="Owner 6"></td>
        </tr>
        <tr>
            <td>FIG-117</td>
            <td class="ellipsis">Confirmation states not rendering properly</td>
            <td class="project">Bug fixes</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile7.jpg" alt="Owner 7"></td>
        </tr>
        <tr>
            <td>FIG-116</td>
            <td class="ellipsis">Text wrapping is awkward on older iPhones</td>
            <td class="project">Bug fixes</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile8.jpg" alt="Owner 8"></td>
        </tr>
        <tr>
            <td>FIG-115</td>
            <td class="ellipsis">Revise copy on About page</td>
            <td class="project">Website launch</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile9.jpg" alt="Owner 9"></td>
        </tr>
        <tr>
            <td>FIG-114</td>
            <td class="ellipsis">Publish HackerNews post</td>
            <td class="project">Acme GTM</td>
            <td class="date">Dec 5</td>
            <td class="owner"><img src="profile10.jpg" alt="Owner 10"></td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
