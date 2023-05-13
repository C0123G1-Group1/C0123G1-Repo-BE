<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/9/2023
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm mới khách hàng</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<jsp:include page="/header_footer/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-auto">
            <h2>Thêm mới khách hàng</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
        </div>
        <div class="col-6" style="height: 100vh">
<%--            <c:if test="${check}">--%>
<%--                <h5 style="color: darkgreen">Thêm mới thành công</h5>--%>
<%--            </c:if>--%>
<%--            <c:if test="${check == false}">--%>
<%--                <h5 style="color: red">Thêm mới thất bại</h5>--%>
<%--            </c:if>--%>
            <div class="content-box">
                <form method="post" action="/customer-servlet?action=create" class="content">
                    <div class="fom-control">
                        <label>Tên đăng nhập</label>
                        <input required oninput="checkUser()" class="form-control" id="user"
                               placeholder="Nhập tên đăng nhập" type="text" name="userName">
                        <small id="1" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Mật khẩu</label>
                        <input required oninput="checkPassword()" class="form-control" id="password"
                               placeholder="Nhập mật khẩu" type="password" name="password">
                        <small id="2" style="color: red;font-weight: bolder ;font-weight: bolder"></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Xác nhận lại mật khẩu</label>
                        <input required oninput="checkPassword()" class="form-control" id="confirm-password"
                               placeholder="Nhập lại mật khẩu" type="password" name="password">
                        <small id="3" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Họ và tên</label>
                        <input required oninput="checkName()" class="form-control" id="fullName"
                               placeholder="Nhập họ và tên" type="text" name="fullName">
                        <small id="4" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Email</label>
                        <input required oninput="checkEmail()" class="form-control" id="email"
                               placeholder="Vui lòng nhập email" type="email" name="email">
                        <small id="5" style="color: red;font-weight: bolder"></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Số điện thoại</label>
                        <input required oninput="checkPhoneNumber()" class="form-control" id="phoneNumber"
                               placeholder="Vui lòng nhập số điện thoại" type="text" name="phoneNumber">
                        <small id="6" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Địa chỉ</label>
                        <input required class="form-control" id="address" placeholder="Vui lòng nhập email" type="text"
                               name="address">
                        <small id="7" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <ul class="d-flex justify-content-between list-unstyled">
                        <li>
                            <button class="btn btn-success">Thêm mới</button>
                        </li>
                        <li>
                            <button type="button" onclick="window.location.href='/customer-servlet'" class="btn btn-primary">Trở lại</button>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
        <div class="col-3">
        </div>
    </div>
</div>
<%--Modal create --%>
<div class="modal fade" id="deleteResultModal4" tabindex="-1" aria-labelledby="deleteResultModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <c:if test="${check}">
                    <div class="d-flex justify-content-center">
                        <h5 style="color: darkgreen">Thêm mới thành công!</h5>
                    </div>
                </c:if>
                <c:if test="${check == false}">
                    <div>
                        <h5 style="color: red" class="d-flex justify-content-center">Thêm mới thất bại!</h5>
                    </div>
                </c:if>
            </div>
            <div class="modal-footer" style="height: 49px">
            </div>
        </div>
    </div>
</div>
<c:if test="${check || check == false}">
    <script>
        let deleteResultModal = new bootstrap.Modal(document.getElementById('deleteResultModal4'));
        deleteResultModal.show();
    </script>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>

