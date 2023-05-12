<%@ page import="models.model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/05/2023
  Time: 8:34 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        #ig1-user-page{
            color: black;
        }
        #ig1-user-page:hover{
            color: white;
        }
        #navbarSupportedContent ul li:hover a{
            color: white;
        }

        #navbarSupportedContent ul li a {
            color: black;
        }
    </style>
</head>
<body>
<c:set var="customerId" value="<%= ((Customer)session.getAttribute(\"userSession\")).getId() %>"></c:set>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: orange">
    <div class="container-fluid">
        <a id="ig1-user-page" href="/products-servlet?action=displayUser" class="navbar-brand">IG1 Store</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/account-servlet?action=homeUser">Home</a>
                </li>
            </ul>
            <form class="d-flex m-0" role="search" action="/order-detail-servlet" method="get">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                       name="productName">
                <input type="text" name="customerId" value="${customerId}" hidden>
                <input type="text" name="action" value="search" hidden>
                <button class="btn btn-outline-dark" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Tên sản phẩm</th>
            <th scope="col">Loại sản phẩm</th>
            <th scope="col">Giá</th>
            <th scope="col">Ngày mua</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Tùy chỉnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="productDAOList" items="${productDAOList}">
            <tr>
                <td>${productDAOList.getId()}</td>
                <td>${productDAOList.getName()}</td>
                <td>
                    <c:if test="${productDAOList.getProductType() == 1}">
                        Phone
                    </c:if>
                    <c:if test="${productDAOList.getProductType() == 2}">
                        Accessory
                    </c:if>
                </td>
<%--                <td>${productDAOList.getDescribe()}</td>--%>
                <td>${productDAOList.getPrice()}</td>
                <td>${productDAOList.getCreatAt()}</td>
                <td>${productDAOList.getQuantity()}</td>
                <td>
                    <button type="submit" class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onclick="deleteProduct('${productDAOList.getOrderDetailId()}','${productDAOList.getName()}')">
                        Xóa
                    </button>
                </td>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa sản phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/order-servlet" method="get">
                <div class="modal-body">
                    <input type="text" name="action" value="delete" hidden>
                    <input type="text" name="customerId" value="${customerId}" hidden>
                    <input type="text" id="productId" name="productOrderDetailId" hidden>
                    Bạn có muốn xóa sản phẩm <span id="productName"></span> không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">
                        Có
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<c:set value="${statusOrderDetail}" var="statusOrderDetail"></c:set>
<script>
    function deleteProduct(id, name) {
        document.getElementById("productId").value = id;
        document.getElementById("productName").innerText = name;
    }
</script>

<script>
    let statusOrderDetail = ${statusOrderDetail};
    if (!statusOrderDetail) {
        alert("Xóa không thành công")
    } else {
        alert("Xóa thành công")
    }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
