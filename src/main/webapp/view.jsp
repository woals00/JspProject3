<%--
  Created by IntelliJ IDEA.
  User: jaeminjeong
  Date: 2022/11/16
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" import="com.example.dao.MemberDAO, com.example.bean.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="./css/style.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>회원정보 - 회원관리 v1</title>
    <link rel="stylesheet" href="">
    <style>
        ody {
            padding: 1.5em;
            background: #f5f5f5
        }

        table {
            border: 1px #a39485 solid;
            font-size: .9em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
            width: 100%;
            border-collapse: collapse;
            border-radius: 5px;
            overflow: hidden;
            margin-top: 100px;
            margin-bottom: 100px;
        }

        th {
            text-align: left;
        }

        thead {
            font-weight: bold;
            color: #fff;
            background: darkcyan;
        }

        td, th {
            padding: 1em .5em;
            vertical-align: middle;
        }

        td {
            border-bottom: 1px solid rgba(0, 0, 0, .1);
            background: #fff;
        }

        a {
            color: #73685d;
        }

        @media all and (max-width: 768px) {

            table, thead, tbody, th, td, tr {
                display: block;
            }

            th {
                text-align: right;
            }

            table {
                position: relative;
                padding-bottom: 0;
                border: none;
                box-shadow: 0 0 10px rgba(0, 0, 0, .2);
            }

            thead {
                float: left;
                white-space: nowrap;
            }

            tbody {
                overflow-x: auto;
                overflow-y: hidden;
                position: relative;
                white-space: nowrap;
            }

            tr {
                display: inline-block;
                vertical-align: top;
            }

            th {
                border-bottom: 1px solid #a39485;
            }

            td {
                border-bottom: 1px solid #e5e5e5;
            }
        }
    </style>
</head>
<body>
<%
    MemberDAO memberDAO = new MemberDAO();
    String id = request.getParameter("id");
    MemberVO u = memberDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>
<header class="header">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark px-3">
        <a class="navbar-brand" href="posts.jsp">JM's Site</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="posts.jsp">Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addpostform.jsp">Add</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<table id="edit">
    <thead>
    <tr>
        <th>Photo</th>
        <th>User Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Blog URL</th>
        <th>Detail</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><c:if test="${vo.getPhoto() ne ''}"><br/>
            <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo" </c:if></td>
        <td>${vo.getUserid()}</td>
        <td>${vo.getUsername()}</td>
        <td>${vo.getEmail()}</td>
        <td>${vo.getBlogurl()}</td>
        <td>${vo.getDetail()}</td>
    </tr>
    </tbody>

</table>
<button type="button" onclick="history.back()">뒤로 가기</button>
<button type="button" onclick="location.href='editform.jsp?id=${vo.getSid()}'">수정하기</button>
<footer class="footer">
    <div class="container">
        <span class="text-muted">copyright © 2022 WALAB. 실전프로젝트1 연습 사이트</span>
    </div>
</footer>
</body>
</html>

<%--<body>--%>

<%--<%--%>
<%--    MemberDAO memberDAO = new MemberDAO();--%>
<%--    String id = request.getParameter("id");--%>
<%--    MemberVO u = memberDAO.getOne(Integer.parseInt(id));--%>
<%--    request.setAttribute("vo", u);--%>
<%--%>--%>

<%--<!-- Fixed navbar -->--%>
<%--<header>--%>
<%--    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark px-3">--%>
<%--        <a class="navbar-brand" href="posts.jsp">JM's Site</a>--%>
<%--        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"--%>
<%--                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarCollapse">--%>
<%--            <ul class="navbar-nav mr-auto">--%>
<%--                <li class="nav-item active">--%>
<%--                    <a class="nav-link" href="posts.jsp.jsp">Home </a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="addpostform.jsp">Add</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</header>--%>
<%--<div class="container">--%>
<%--    <div class="text-center my-3"><h3>View Form</h3></div>--%>
<%--    <div class="py-5">--%>
<%--        <form action="add_ok.jsp" enctype="multipart/form-data" method="post">--%>
<%--            <div class="mb-2">--%>
<%--                <label class="form-label" for="form6Example1">Profile Image</label>--%>
<%--                <div class="row">--%>
<%--                    <div class="col">--%>
<%--                        <div class="form-outline">--%>
<%--                            <img src="./assets/images/defaultImage.png" alt="..." width="100px" height="100px"--%>
<%--                                 class="img-thumbnail" id="profile">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col d-flex flex-column justify-content-center">--%>
<%--                        <input type="file" class="form-control" id="customFile" name="photo"--%>
<%--                               onchange="setThumbnail(this)" accept="image/*,.pdf">--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- 2 column grid layout with text inputs for the first and last names -->--%>
<%--            <div class="row mb-2">--%>
<%--                <div class="col">--%>
<%--                    <div class="form-outline">--%>
<%--                        <label class="form-label" for="form6Example1">Id</label>--%>
<%--                        <input type="text" id="form6Example1" class="form-control" name="userid" required="">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col">--%>
<%--                    <div class="form-outline">--%>
<%--                        <label class="form-label" for="form6Example2">Name</label>--%>
<%--                        <input type="text" id="form6Example2" class="form-control" name="username" required="">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Radio input -->--%>
<%--            <div class="row mb-2">--%>
<%--                <div class="col">--%>
<%--                    <div class="form-outline">--%>
<%--                        <label class="form-label" for="form6Example3">Email</label>--%>
<%--                        <input type="email" id="form6Example3" class="form-control" name="email" required="">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col">--%>
<%--                    <div class="form-outline form-group">--%>
<%--                        <label class="form-label" for="form6Example4">Blog URL</label>--%>
<%--                        <input type="text" id="form6Example4" class="form-control" name="blogurl" required="">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Number input -->--%>
<%--            <div class="form-outline mb-4">--%>
<%--                <label class="form-label" for="form6Example6">Detail</label>--%>
<%--                <textarea cols="50" rows="5" id="form6Example6" class="form-control"--%>
<%--                          name="detail">${vo.getDetail()}</textarea>--%>
<%--            </div>--%>

<%--            <!-- Submit button -->--%>
<%--            <div class="d-flex justify-content-between mb-2">--%>
<%--                <div>--%>
<%--                    <button type="button" onclick="history.back()">뒤로 가기</button>--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    <button type="button" class="btn btn-primary"--%>
<%--                            onclick="location.href='editform.jsp?id=${vo.getSid()}'">수정하기--%>
<%--                    </button>--%>
<%--                    Register--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<script>--%>

<%--    function setThumbnail(input) {--%>

<%--        if (input.files && input.files[0]) {--%>
<%--            var reader = new FileReader();--%>
<%--            reader.onload = function (e) {--%>
<%--                document.getElementById('profile').src = e.target.result;--%>
<%--            };--%>
<%--            reader.readAsDataURL(input.files[0]);--%>
<%--        } else {--%>
<%--            document.getElementById('profile').src = "./assets/images/defaultImage.png";--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>


<%--<footer class="footer">--%>
<%--    <div class="container">--%>
<%--        <span class="text-muted">copyright © 2022 WALAB. 실전프로젝트1 연습 사이트</span>--%>
<%--    </div>--%>
<%--</footer>--%>


<%--</body>--%>