<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 02/05/2023
  Time: 8:51 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>IG1 Store</title>
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

<div id="container">
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: orange">
        <div class="container-fluid">
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
                <%--            <form class="d-flex m-0" role="search" action="/product?action=search" method="post">--%>
                <%--                <input class="form-control me-2" type="search" placeholder="Nhập tên sản phẩm" aria-label="Search"--%>
                <%--                       name="name" id="searchInput" oninput="saveSearchInput()">--%>
                <%--                <select name="price" id="" class="form-control me-2">--%>
                <%--                    <option value="1">--Chọn giá--</option>--%>
                <%--                    <option value="1">Dưới 5 triệu</option>--%>
                <%--                    <option value="2">5-10 triệu</option>--%>
                <%--                    <option value="3">10-15 triệu</option>--%>
                <%--                    <option value="4">Trên 15 triệu</option>--%>
                <%--                </select>--%>
                <%--                <button type="submit" class="btn btn-outline-primary"--%>
                <%--                        style="background: white; width: 200px;height: auto; color: black">--%>
                <%--                    Tìm kiếm--%>
                <%--                </button>--%>
                <%--            </form>--%>
            </div>
        </div>
    </nav>
    <br>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
