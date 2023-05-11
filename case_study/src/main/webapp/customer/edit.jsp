<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/11/2023
  Time: 01:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa thông tin khách hàng</title>
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
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <h4 style="color: blue; font-weight: bold">${mess}</h4>
            <h3>Sửa thông tin khách hàng</h3>
        </div>
        <div class="row">
                <form method="post" action="/customer?action=edit">
                    <label>Tên đăng nhập</label>
                    <input disabled class="form-control" type="text" name="userNameDisable" value="${customer.getAccount().getUserName()}"><br>
                    <label>Mật khẩu</label>
                    <input class="form-control" type="text" name="password" value="${customer.getAccount().getPassword()}"><br>
                    <label>Họ và Tên</label>
                    <input class="form-control" type="text" name="fullName" value="${customer.getName()}"><br>
                    <label>Email</label>
                    <input class="form-control" type="email" name="email" value="${customer.getEmail()}"><br>
                    <label>Số điện thoại</label>
                    <input class="form-control" type="number" name="phoneNumber" value="${customer.getPhoneNumber()}"><br>
                    <label>Địa chỉ</label>
                    <input class="form-control" type="text" name="address"value="${customer.getAddress()}"><br>
                    <button class="btn btn-success">Sửa</button>
                </form>
            <input hidden class="form-control" type="text" name="userNameHidden" value="${customer.getAccount().getUserName()}"><br>
            <input hidden class="form-control" type="text" name="userId" value="${customer.getAccount().getId()}"><br>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
