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

        #back {
            color: black;
        }

        #back:hover {
            color: white;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: orange">
    <div class="container-fluid">
        <i onclick="window.history.back()" id="back" class="fa-solid fa-circle-chevron-left"></i>
        <a id="ig1-user-page" href="/product" class="navbar-brand">IG1 Store</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li clx ass="nav-item">
                    <a class="nav-link active" aria-current="page" href="/admin/admin.jsp">Trang chủ</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Quản lý
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" style="color: black" href="/product">Sản phẩm</a></li>
                        <li><a class="dropdown-item" style="color: black" href="/customer-servlet">Khách hàng</a></li>
                        <li><a class="dropdown-item" style="color: black" href="/order-servlet">Hóa đơn</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex m-0" role="search" action="/order-detail-servlet?action=searchProductOrderDetail"
                  method="post" style="height: 5vh">
                <input type="text" name="customerId" value="${customerId}" hidden>
                <input class="form-control me-2" type="search" placeholder="Tìm sản phẩm" aria-label="Search"
                       name="productName" value="${productName}">
                <button class="btn btn-outline-dark" type="submit" style="width: 12vw">Tìm kiếm</button>
            </form>
        </div>
    </div>
</nav>
<div align="center">
    <c:if test="${statusDeleteOrderDetail}">
        <h5 class="text-success">Xóa thành công</h5>
    </c:if>
    <c:if test="${statusDeleteOrderDetail == false}">
        <h5 class="text-danger">Xóa thất bại</h5>
    </c:if>
</div>
<div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Tên sản phẩm</th>
            <th scope="col">Loại</th>
            <th scope="col">Hình ảnh</th>
            <th scope="col">Giá</th>
            <th scope="col">Ngày thêm</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Tùy chỉnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="limitDAOList" items="${limitDAOList}">
            <tr>
                <td>${limitDAOList.getId()}</td>
                <td>${limitDAOList.getName()}</td>
                <td>
                    <c:if test="${limitDAOList.getProductType() == 1}">
                        Phone
                    </c:if>
                    <c:if test="${limitDAOList.getProductType() == 2}">
                        Accessory
                    </c:if>
                </td>
                <td><img src="${limitDAOList.getProductImage()}" alt="" width="80vw"></td>
                <td>${limitDAOList.getPrice()}</td>
                <td>${limitDAOList.getCreatAt()}</td>
                <td>${limitDAOList.getQuantity()}</td>
                <td>
                    <button type="submit" class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onclick="deleteProduct('${customerId}','${limitDAOList.getOrderDetailId()}','${limitDAOList.getName()}')">
                        Xóa
                    </button>
                </td>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div id="pagination" class="row col-lg-12">
    <nav aria-label="Page navigation example" style="height: 100%; width: 100%">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#">Trước</a>
            </li>
            <c:forEach varStatus="i" begin="1" end="${Math.ceil(productDAOListSize/6)}">
                <li class="page-item"><a class="page-link"
                                         href="/order-detail-servlet?action=orderDetailPage&customerId=${customerId}&page=${i.count}">${i.count}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="#">Sau</a>
            </li>
        </ul>
    </nav>
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
            <form action="/order-detail-servlet?action=delete" method="get">
                <div class="modal-body">
                    <input type="text" name="action" value="delete" hidden>
                    <input type="text" id="customerId" name="customerId" hidden>
                    <input type="text" id="productOrderDetailId" name="productOrderDetailId" hidden>
                    Bạn có muốn xóa sản phẩm <span id="productName"></span> không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-danger">
                        Có
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<c:set value="${statusOrderDetail}" var="statusOrderDetail"></c:set>

<script>
    function deleteProduct(customerId, orderDetailId, productName) {
        document.getElementById("customerId").value = customerId;
        document.getElementById("productOrderDetailId").value = orderDetailId;
        document.getElementById("productName").innerText = productName;
    }
</script>

<script>
    let statusOrderDetail = ${statusOrderDetail};
    if (!statusOrderDetail) {
        alert("Xóa không thành công")
    } else {
        alert("Xóa không thành công")
    }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
