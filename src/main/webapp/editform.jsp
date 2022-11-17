<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    MemberDAO memberDAO = new MemberDAO();
    String id = request.getParameter("id");
    MemberVO u = memberDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="./assets/css/sticky-footer-navbar.css" rel="stylesheet">
    <style>
        .form-label{
            font-weight: 600 !important;
        }
    </style>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>

<body>
<header>
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
<div class="container">
    <div class="text-center my-3"><h3>Edit Registration Form </h3></div>
    <div class="py-5">
        <form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="sid" value="${vo.getSid()}">
            <div class="mb-2">
                <label class="form-label" for="form6Example1">Profile Image</label>
                <div class="row">
                    <div class="col">
                        <div class="form-outline">

                            <c:if test="${vo.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo" </c:if> width="100px" height="100px" class="img-thumbnail" id="profile">

                        </div>
                    </div>
                    <div class="col d-flex flex-column justify-content-center">
                        <input type="file" class="form-control" id="customFile" name="photo" onchange="setThumbnail(this)" value="susanna.png" accept="image/*,.pdf">
                    </div>

                </div>
            </div>

            <div class="row mb-2">
                <div class="col">
                    <div class="form-outline">
                        <label class="form-label" for="form6Example1">ID</label>
                        <input type="text" id="form6Example1" class="form-control" name="userid" value="${vo.getUserid()}">
                    </div>
                </div>
                <div class="col">
                    <div class="form-outline">
                        <label class="form-label" for="form6Example2">Name</label>
                        <input type="text" id="form6Example2" class="form-control" name="username" value="${vo.getUsername()}">
                    </div>
                </div>
            </div>

            <!-- Radio input -->
            <div class="row mb-2">
                <div class="col">
                    <div class="form-outline">
                        <label class="form-label" for="form6Example3">Email</label>
                        <input type="email" id="form6Example3" class="form-control" name="email" value="${vo.getEmail()}">
                    </div>
                </div>
                <div class="col">
                    <div class="form-outline form-group">
                        <label class="form-label" for="form6Example4">Blog URL</label>
                        <input type="text" id="form6Example4" class="form-control" name="blogurl" value="${vo.getBlogurl()}">
                    </div>
                </div>
            </div>

            <!-- Number input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form6Example6">Detail</label>
                <textarea cols="50" rows="5" id="form6Example6" class="form-control" name="detail">${vo.getDetail()}</textarea>
            </div>

            <!-- Submit button -->
            <div class="d-flex justify-content-between mb-2">
                <div><a href="posts.jsp">Cancel</a></div>
                <div><button type="submit" class="btn btn-primary">Edit</button></div>
            </div>
        </form>
    </div>
</div>
<script>

    function setThumbnail(input){

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('profile').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('profile').src = "./assets/images/defaultImage.png";
        }
    }
</script>


<footer class="footer">
    <div class="container">
        <span class="text-muted">copyright © 2022 WALAB. 실전프로젝트1 연습 사이트</span>
    </div>
</footer>


</body>
</html>
