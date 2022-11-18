<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="./css/style.css" rel="stylesheet">
    <style>
        .form-label{
            font-weight: 600 !important;
        }
    </style>
    <title>ADD Form</title>
</head>
<body>

<!-- Fixed navbar -->
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark px-3">
        <a class="navbar-brand" href="posts.jsp">JM's Site</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
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
    <div class="text-center my-3"><h3>Registration Form</h3></div>
    <div class="py-5">
        <form action="add_ok.jsp" enctype="multipart/form-data" method="post">
            <div class="mb-2">
                <label class="form-label" for="form6Example1">Profile Image</label>
                <div class="row">
                    <div class="col">
                        <div class="form-outline">
                            <img src="./assets/images/defaultImage.png" alt="..." width="100px" height="100px" class="img-thumbnail" id="profile">
                        </div>
                    </div>
                    <div class="col d-flex flex-column justify-content-center">
                        <input type="file" class="form-control" id="customFile" name="photo" onchange="setThumbnail(this)" accept="image/*,.pdf">
                    </div>

                </div>
            </div>

            <!-- 2 column grid layout with text inputs for the first and last names -->
            <div class="row mb-2">
                <div class="col">
                    <div class="form-outline">
                        <label class="form-label" for="form6Example1">Id</label>
                        <input type="text" id="form6Example1" class="form-control" name="userid" required="">
                    </div>
                </div>
                <div class="col">
                    <div class="form-outline">
                        <label class="form-label" for="form6Example2">Name</label>
                        <input type="text" id="form6Example2" class="form-control" name="username" required="">
                    </div>
                </div>
            </div>

            <!-- Radio input -->
            <div class="row mb-2">
                <div class="col">
                    <div class="form-outline">
                        <label class="form-label" for="form6Example3">Email</label>
                        <input type="email" id="form6Example3" class="form-control" name="email" required="">
                    </div>
                </div>
                <div class="col">
                    <div class="form-outline form-group">
                        <label class="form-label" for="form6Example4">Blog URL</label>
                        <input type="text" id="form6Example4" class="form-control" name="blogurl" required="">
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
                <div><a href="posts.jsp">View All Records</a></div>
                <div><button type="submit" value="Add Post" class="btn btn-primary">Register</button></div>
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
