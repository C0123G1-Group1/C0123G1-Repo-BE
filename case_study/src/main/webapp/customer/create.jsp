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
    <div class="row justify-content-center" >
        <div class="col-auto">
            <h2>Create customer</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
        </div>
        <div class="col-6"style="height: 100vh">
            <c:if test="${check}">
                <h5 style="color: darkgreen">Add success</h5>
            </c:if>
            <c:if test="${check == false}">
                <h5 style="color: red">Add fail</h5>
            </c:if>
<%--            <h4 style="color: blue; font-weight: bold">${mess}</h4>--%>
            <div class="content-box">
                <form method="post" action="/customer?action=create" >
                    <div class="fom-control">
                        <label>Username</label>
                        <input required oninput="checkUser()" class="form-control" id="user" placeholder="Enter username" type="text" name="userName">
                        <small id="1"  style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Password</label>
                        <input required oninput="checkPassword()" class="form-control" id="password" placeholder="Enter password" type="password" name="password">
                        <small id="2" style="color: red;font-weight: bolder ;font-weight: bolder"></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Confirm Password</label>
                        <input required oninput="checkPassword()" class="form-control" id="confirm-password" placeholder="Enter confirm password" type="password" name="password">
                        <small id="3" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>First And Last Name</label>
                        <input required oninput="checkName()" class="form-control" id="fullName" placeholder="Enter first and last name" type="text" name="fullName">
                        <small id="4" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Email</label>
                        <input required oninput="checkEmail()" class="form-control" id="email" placeholder="Enter password" type="email" name="email">
                        <small id="5" style="color: red;font-weight: bolder"></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Phone Number</label>
                        <input required oninput="checkPhoneNumber()" class="form-control" id="phoneNumber" placeholder="Enter phonenumber" type="text" name="phoneNumber">
                        <small id="6" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div class="fom-control">
                        <label>Address</label>
                        <input required class="form-control" id="address" placeholder="Enter address" type="text" name="address">
                        <small id="7" style="color: red;font-weight: bolder "></small>
                        <span></span>
                    </div>
                    <div style="margin-top: 30px">
                        <button  class="btn btn-success">Add</button>
                    </div>
                </form>
            </div>
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

