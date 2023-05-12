<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/9/2023
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Danh sách</title>
  <style>
    #ig1-user-page {
      color: black;
    }

    #ig1-user-page:hover {
      color: white;
    }

    #navbarSupportedContent ul li:hover a {
      color: white;
    }

    #navbarSupportedContent ul li a {
      color: black;
    }
  </style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: orange">
  <div class="container-fluid">
    <a id="ig1-user-page" href="/products-servlet?action=displayUser" class="navbar-brand">IG1 Store</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/admin/admin.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Manager
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" style="color: black" href="/product-servlet">Products</a></li>
            <li><a class="dropdown-item" style="color: black" href="/customer-servlet">Customers</a></li>
            <li><a class="dropdown-item" style="color: black" href="/order-servlet">Order</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex m-0" role="search" action="/products-servlet" method="get">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="productName">
        <button class="btn btn-outline-dark" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>


<div class="container-fluid">
  <table class="table table-striped">
    <tr>
      <th>ID</th>
      <th>Tên</th>
      <th>Email</th>
      <th>SĐT</th>
      <th>Địa chỉ</th>
      <th>Ngày thêm Order</th>
      <th>Thao tác</th>
    </tr>
    <c:forEach var="customerDAOList" items="${customerDAOList}">
      <tr>
        <td>${customerDAOList.getId()}</td>
        <td>${customerDAOList.getName()}</td>
        <td>${customerDAOList.getEmail()}</td>
        <td>${customerDAOList.getPhoneNumber()}</td>
        <td>${customerDAOList.getAddress()}</td>
        <td>${customerDAOList.getOrderDate()}</td>
        <td>
          <button type="submit" class="btn btn-danger" data-bs-toggle="modal"
                  data-bs-target="#exampleModal"
                  onclick="window.location.href='/order-detail-servlet?action=orderDetail&customerId=${customerDAOList.getId()}'">
          Order Detail
          </button>
        </td>
      </tr>
    </c:forEach>
  </table>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>