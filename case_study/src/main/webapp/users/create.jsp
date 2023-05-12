<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/05/2023
  Time: 8:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row justify-content-center" >
        <div class="col-auto" t>
            <h2>Chi tiết sản phẩm</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-8">
            <div class="col-8">
                <div class="row">
                    <div class="col-6"><img src="${productImage}" alt="" width="100%" border="1" style="border-radius: 5px"></div>
                    <div class="col-6">${productDescribe}</div>
                </div>
            </div>
        </div>
        <div class="col-4">
            <h4 style="color: blue; font-weight: bold">${mess}</h4>
            <form method="post" action="/order-servlet?action=createOrderDetail">
                <input type="text" name="orderId" id="describe" size="15" value="${orderId}" hidden/>
                <input type="text" name="customerId" id="name" size="45" value="${customerId}" hidden/>
                <input type="text" name="productId" id="productId" size="15" value="${productId}" hidden/>
                <input type="text" name="productType" id="productImage" size="15" value="${productType}" hidden/>
                <label for="productName">Tên sản phẩm</label>
                <input class="form-control" type="text" id="productName" name="productName" size="15" value="${productName}" readonly/>
                <label for="price">Giá</label>
                <input class="form-control" type="text" id="price" name="price" value="${price}" readonly>
                <br>
                <label for="quantity">Số lượng</label>
                <input class="form-control" type="text" id="quantity" name="quantity" required>
                <br>
                <button class="btn btn-success">Mua</button>
            </form>
        </div>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
