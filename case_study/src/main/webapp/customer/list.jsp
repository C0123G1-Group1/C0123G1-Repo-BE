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
          <a class="nav-link active" aria-current="page" href="#">Home</a>
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
<%--  <div class="row">--%>
<%--    <h1>Danh sách khách hàng</h1>--%>
<%--  </div>--%>
<%--  <div class="row">--%>
<%--    <div class="col-auto d-flex">--%>
<%--      <form action="/user" class="d-flex">--%>
<%--        <input type="hidden" name="action" value="search">--%>
<%--        <input class="form-control me-2" type="text" placeholder="Search" aria-label="Search" name="search">--%>
<%--        <button class="btn btn-outline-success" type="submit">Search</button>--%>
<%--      </form>--%>
<%--    </div>--%>
    <table class="table table-striped">
      <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Email</th>
        <th>SĐT</th>
        <th>Địa chỉ</th>
        <th>Ngày thêm</th>
        <th>Ngày sửa</th>
        <th>Tên đăng nhập</th>
        <th>Thao tác</th>
      </tr>
      <c:forEach var="customer" items="${customerList}">
        <tr>
          <td>${customer.getId()}</td>
          <td>${customer.getName()}</td>
          <td>${customer.getEmail()}</td>
          <td>${customer.getPhoneNumber()}</td>
          <td>${customer.getAddress()}</td>
          <td>${customer.getCreateAt()}</td>
          <td>${customer.getUpdateAt()}</td>
          <td>${customer.getAccount().getUserName()}</td>
          <td>
            <button type="submit" class="btn btn-danger" data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    onclick="deleteCustomer('${customer.getId()}','${customer.getName()}')">
              Delete
            </button>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
  <button class="btn btn-success" onclick="window.location.href='/customer/create.jsp'">Create</button>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Order</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <form action="/customer-servlet" method="post">
        <div class="modal-body">
          <input type="text" name="action" value="delete" hidden>
          <input type="text" id="customerId" name="id" hidden>
          Do you want to delete the order <span id="customerName"></span> ?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
          <button type="submit" class="btn btn-primary">
            Yes
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--<nav aria-label="Page navigation example">--%>
<%--    <ul class="pagination justify-content-end">--%>
<%--        <li class="page-item">--%>
<%--            <a class="page-link" href="#">Previous</a>--%>
<%--        </li>--%>
<%--        <c:forEach varStatus="i" begin="1" end="${Math.ceil(productListSize/10.0)}">--%>
<%--            <li class="page-item"><a class="page-link"--%>
<%--                                     href="/products-servlet?action=displayPageAdmin&page=${i.count}">${i.count}</a>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
<%--        <li class="page-item">--%>
<%--            <a class="page-link" href="#">Next</a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</nav>--%>
<script>
  function deleteCustomer(id, name) {
    document.getElementById("customerId").value = id;
    document.getElementById("customerName").innerText = name;
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>