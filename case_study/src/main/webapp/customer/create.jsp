<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/9/2023
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới khách hàng</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="position: sticky;top:0;left: 0;right: 0">
        <div class="container-fluid">
            <div>
                <button class="btn btn-success" type="button" onclick="window.location.href='/customer'">Xem danh sách</button>
            </div>
            <h4 style="color: red; font-weight: bold">${mess}</h4>
        </div>
    </nav>
</div>
<div class="container-fluid">
    <div class="row justify-content-center" >
        <div class="col-auto">
            <h2>Thêm mới khách hàng</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
        </div>
        <div class="col-6">
            <h4 style="color: blue; font-weight: bold">${mess}</h4>
            <form method="post" action="/customer?action=create">
                <label>Tên đăng nhập</label>
                <input class="form-control" type="text" name="userName"><br>
                <label>Mật khẩu</label>
                <input class="form-control" type="password" name="password"><br>
                <label>Họ và Tên</label>
                <input class="form-control" type="text" name="fullName"><br>
                <label>Email</label>
                <input class="form-control" type="email" name="email"><br>
                <label>Số điện thoại</label>
                <input class="form-control" type="number" name="phoneNumber"><br>
                <label>Địa chỉ</label>
                <input class="form-control" type="text" name="address"><br>
                <button class="btn btn-success">Thêm</button>
            </form>
            <p style="color: blue;font-weight: bold;justify-content: center">${mess}</p>
        </div>
        <div class="col-3">
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>

