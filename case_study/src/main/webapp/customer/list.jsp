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
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<div class="container-fluid">
  <div class="row">
    <h1>Danh sách khách hàng</h1>
  </div>
  <div class="row">
    <div class="col-auto d-flex">
      <form action="/user" class="d-flex">
        <input type="hidden" name="action" value="search">
        <input class="form-control me-2" type="text" placeholder="Search" aria-label="Search" name="search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
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
            <button class="btn btn-danger" type="button" data-bs-toggle="modal"
                    data-bs-target="#deleteModal${customer.getId()}">Delete</button>
          </td>
        </tr>
        <div class="modal fade" id="deleteModal${customer.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa khách hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                Bạn có muốn xóa khách hàng có tên là ${customer.getName()}
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                <button type="button" class="btn btn-primary"
                        onclick="window.location.href='/customer?action=delete&id=${customer.id}'">
                  Có
                </button>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </table>
  </div>
  <button class="btn btn-success" onclick="window.location.href='/customer/create.jsp'">Create</button>
  <button class="btn btn-success" onclick="window.location.href='/customer?action=sort'">Sort</button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>