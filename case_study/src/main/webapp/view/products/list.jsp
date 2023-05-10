<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: orange">
    <div class="container-fluid">
        <a id="ig1-user-page" href="/product" class="navbar-brand">IG1 Store</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Manager
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" style="color: black" href="/product">Products</a></li>
                        <li><a class="dropdown-item" style="color: black" href="#">Accessory</a></li>
                        <li><a class="dropdown-item" style="color: black" href="#">Customers</a></li>
                        <li><a class="dropdown-item" style="color: black" href="#">Order</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex m-0" role="search" action="/product?action=search" method="post">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                       name="name">
                <select name="price" id="">
                    <option value="1">Dưới 5 triệu</option>
                    <option value="2">5-10 triệu</option>
                    <option value="3">10-15 triệu</option>
                    <option value="3">Trên 15 triệu</option>
                </select>
                <button class="btn btn-outline-dark" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="my-3">
    <button type="button" class="btn btn-primary mx-2" onclick="window.location.href='view/products/create.jsp'">
        Create Product
    </button>
</div>
<div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Product ID</th>
            <th scope="col">Name</th>
            <th scope="col">Type</th>
            <th scope="col" hidden>Describe</th>
            <th scope="col">Price(VND)</th>
            <th scope="col" hidden>Image</th>
            <th scope="col">Create At</th>
            <th scope="col">Update At</th>
            <th scope="col">Manipulate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>
                <c:if test="${product.getProductType() == 1}">
                    Iphone
                </c:if>
                <c:if test="${product.getProductType() == 2}">
                    SamSung
                </c:if>
                <c:if test="${product.getProductType() == 3}">
                    Vivo
                </c:if>
                <c:if test="${product.getProductType() == 4}">
                    Asus
                </c:if>
                <c:if test="${product.getProductType() == 5}">
                    OPPO
                </c:if>
            </td>
            <td hidden>${product.getDescribe()}</td>
            <td>${product.getPrice()}</td>
            <td hidden>${product.getProductImage()}</td>
            <td>${product.getCreatAt()}</td>
            <td>${product.getUpdateAt()}</td>
            <td>
                <button type="submit" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal"
                        onclick="deleteProduct('${product.getId()}','${product.getName()}')">
                    Delete
                </button>
                <button class="btn btn-warning"
                        onclick="window.location.href='/product?action=edit&id=${product.getId()}'">
                    Update
                </button>
                <button class="btn btn-info">Detail</button>
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
                <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/product" method="post">
                <div class="modal-body">
                    <input type="text" name="action" value="delete" hidden>
                    <input type="text" id="id" name="id" hidden>
                    Do you want to delete the product <span id="name"></span> ?
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
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-end">
        <li class="page-item">
            <a class="page-link" href="#">Previous</a>
        </li>
        <c:forEach varStatus="i" begin="1" end="${Math.ceil(productListSize/10.0)}">
            <li class="page-item"><a class="page-link"
                                     href="/product?action=displayPageAdmin&page=${i.count}">${i.count}</a>
            </li>
        </c:forEach>
        <li class="page-item">
            <a class="page-link" href="#">Next</a>
        </li>
    </ul>
</nav>
<script>
    function deleteProduct(id, name) {
        document.getElementById("id").value = id;
        document.getElementById("name").innerText = name;
    }
</script>
</body>
</html>
