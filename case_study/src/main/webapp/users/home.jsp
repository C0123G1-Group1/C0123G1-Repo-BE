<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2023
  Time: 8:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>IG1 Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="user.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        #scroll-left {
            overflow-y: scroll;
            height: 100%;
            position: fixed;
            left: 0px;
            top: 6.7vh;
        }

        #content {
            position: relative;
            left: 17.5vw;
        }

        #content #pagination {
            position: fixed;
            top: 7.2vh;
            background-color: white;
            z-index: 1;
            height: 5vh;
        }

        #content-product {
            position: relative;
            top: 3vh
        }

        #shopping-cart {
            display: flex;
            justify-content: center;
            height: 100%;
            width: 5vw;
        }

        #shopping-cart #shopping-icon {
            font-size: 30px;
            color: black;
        }
        #shopping-cart #shopping-icon:hover {
            color: white;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: orange">
    <div class="container-fluid">
        <a id="ig1-user-page" href="/products-servlet?action=displayUser" class="navbar-brand">IG1 Store</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                        Manager--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu">--%>
<%--                        <li><a class="dropdown-item" style="color: black" href="/product-servlet">Products</a></li>--%>
<%--                        <li><a class="dropdown-item" style="color: black" href="/customer-servlet">Customers</a></li>--%>
<%--                        <li><a class="dropdown-item" style="color: black" href="/order-servlet">Order</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
            </ul>
            <form class="d-flex m-0" role="search" action="/products-servlet" method="get">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="productName">
                <button class="btn btn-outline-dark" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="row col-lg-12" style="height: 90vh;position: relative; top: 6.7vh ">
    <div id="scroll-left" class="col-lg-2 mt-2" style="">
        <div class="list-group">
            <p class="list-group-item list-group-item-action active" aria-current="true">
                Product Type
            </p>
            <a href="#" class="list-group-item list-group-item-action">Iphone</a>
            <a href="#" class="list-group-item list-group-item-action">SamSung</a>
            <a href="#" class="list-group-item list-group-item-action">Vivo</a>
        </div>
    </div>
    <div id="content" class="col-lg-10">
        <div id="pagination" class="row col-lg-12">
            <nav aria-label="Page navigation example" style="height: 100%; width: 100%">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="#">Previous</a>
                    </li>
                    <c:forEach varStatus="i" begin="1" end="${Math.ceil(productListSize/12)}">
                        <li class="page-item"><a class="page-link"
                                                 href="/products-servlet?action=displayPageUser&page=${i.count}">${i.count}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="content-product" class="row col-lg-12 " style="height: 100%">
            <c:forEach items="${productList}" var="productList">
                <div class="col-lg-3 pt-4">
                    <div class="card" style="height: 450px">
                        <img src="${productList.getProductImage()}" class="card-img-top" alt="..." height="60%">
                        <div class="card-body text-center">
                            <h5 class="card-title">${productList.getName()}</h5>
                            <p class="card-text">${productList.getPrice()} VND</p>
                            <a href="/products-servlet?action=detail&productId=${productList.getId()}"
                               class="btn btn-primary ">Buy</a>
                            <a href="/products-servlet?action=detail&productId=${productList.getId()}"
                               class="btn btn-primary ">Detail</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
