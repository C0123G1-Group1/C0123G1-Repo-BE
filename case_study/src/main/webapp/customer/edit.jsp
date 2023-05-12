<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/11/2023
  Time: 01:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="regex.css">
</head>
<body>
<jsp:include page="/header_footer/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row justify-content-center" >
        <div class="col-auto">
           <h2>Edit customer</h2>
<%--            <h4 style="color: blue; font-weight: bold">${mess}</h4>--%>
            <c:if test="${check}">
                <h5 style="color: darkgreen">Edit success</h5>
            </c:if>
            <c:if test="${check == false}">
                <h5 style="color: red">Edit fail</h5>
            </c:if>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
        </div>
        <div class="col-6">
            <form method="post" action="/customer?action=edit">
                <input hidden type="text" name="id" value="${customer.getId()}"><br>
                <label>First And Last Name</label>
                <input class="form-control" type="text" name="fullName" value="${customer.getName()}"><br>
                <label>Email</label>
                <input class="form-control" type="email" name="email" value="${customer.getEmail()}"><br>
                <label>Phone Number</label>
                <input class="form-control" type="number" name="phoneNumber" value="${customer.getPhoneNumber()}"><br>
                <label>Address</label>
                <input class="form-control" type="text" name="address" value="${customer.getAddress()}"><br>
                <button class="btn btn-success">Edit</button>
            </form>
        </div>
        <div class="col-3">
        </div>
    </div>
</div>
<div></div>
<jsp:include page="/header_footer/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
