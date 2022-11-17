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
    <meta charset="UTF-8">
    <title>회원정보 - 회원관리 v1</title>
    <link rel="stylesheet" href="">
</head>
<body>
<%
    MemberDAO memberDAO = new MemberDAO();
    String id = request.getParameter("id");
    MemberVO u =memberDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>

<h1>회원 정보 보기</h1>
<table id="edit">
    <tr>
        <td>User Id</td><td>${vo.getUserid()}</td>
    </tr>
    <tr>
        <td>Name</td><td>${vo.getUsername()}</td>
    </tr>
    <tr>
        <td>Password</td><td>${vo.getPassword()}</td>
    </tr>
    <tr>
        <td>Email</td><td>${vo.getEmail()}</td>
    </tr>
    <tr>
        <td>Blogurl</td><td>${vo.getBlogurl()}</td>
    </tr>
    <tr>
        <td>Photo</td><td><c:if test="${vo.getPhoto() ne ''}"><br/>
    <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo" </c:if></td>
    </tr>
    <tr>
        <td>Detail</td><td>${vo.getDetail()}</td>
    </tr>

</table>
<button type="button" onclick="history.back()">뒤로 가기</button>
<button type="button" onclick="location.href='editform.jsp?id=${vo.getSid()}'">수정하기</button>

</body>
</html>