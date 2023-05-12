<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/12/2023
  Time: 12:36 AM
  To change this template use File | Settings | File Templates.
--%>
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
<body>
<jsp:include page="/header_footer/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row ">
        <div class="justify-content-center">
            <h2>Edit Accessory</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
        </div>
        <div class="col-6">
            <h4 style="color: blue; font-weight: bold">${mess}</h4>
            <form method="post" action="/accessory?action=edit">
                <label>ID</label>
                <input class="form-control" type="hidden" name="id" value="${product.getId()}"/><br>
                <label>Name</label>
                <input class="form-control" type="text" name="name" value="${product.getName()}" required><br>
                <label>Type</label>
                <select class="form-control" name="productType" id="">
                    <option value="2">Accessory</option>
                </select><br>
                <label>Describe</label>
                <input class="form-control" type="text" name="describe" value="${product.getDescribe()}" required><br>
                <label>Price</label>
                <input class="form-control" type="number" name="price" value="${product.getPrice()}" required><br>
                <label>Image</label>
                <input class="form-control" type="text" name="productImage" value="${product.getProductImage()}"
                       required><br>
                <input class="btn btn-success" type="submit" value="Save"/>
            </form>
            <p style="color: blue;font-weight: bold;justify-content: center">${mess}</p>
        </div>
        <div class="col-3">
        </div>
    </div>
</div>
<jsp:include page="/header_footer/footer.jsp"></jsp:include>
</body>
</html>


<h1>User Management</h1>
<h2>
    <a href="/accessory">List All Users</a>
</h2>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/accessory">List All Users</a>
    </h2>
</center>
<div align="center">
    <form action="/accessory?action=edit" method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit User
                </h2>
            </caption>
            <input type="hidden" name="id" value="${product.getId()}"/>
            <tr>
                <th>User Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="${product.getName()}"
                    />
                </td>
            </tr>
            <tr>
                <th>Product Type:</th>
                <td>
                    <select name="productType">
                        <option value="2">Accessory</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Describe:</th>
                <td>
                    <input type="text" name="describe" size="45"
                           value="${product.getDescribe()}"
                    />
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>
                    <input type="text" name="price" size="45"
                           value="${product.getPrice()}"
                    />
                </td>
            </tr>
            <tr>
                <th>Image:</th>
                <td>
                    <input type="text" name="productImage" size="15"
                           value="${product.getProductImage()}"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>