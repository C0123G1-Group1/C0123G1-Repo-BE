<%--
  Created by IntelliJ IDEA.
  User: lapto
  Date: 5/8/2023
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Products Of Management</h1>
    <h2>
        <a href="/product?action=create">Add New Product</a>
    </h2>
</center>
<div align="center">
    <form action="product?action=search" method="post">
        <input type="text" name="name" placeholder="Search follow name">
        <select name="price" id="">
            <option value="1">Dưới 5 triệu</option>
            <option value="2">5-10 triệu</option>
            <option value="3">10-15 triệu</option>
            <option value="3">Trên 15 triệu</option>
        </select>
        <input type="submit" value="Search">
    </form>
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Producs Type</th>
            <th>Describe</th>
            <th>Price</th>
            <th>Image</th>
            <th>Create At</th>
            <th>Update At</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr>
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
                <td>${product.getDescribe()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getProductImage()}</td>
                <td>${product.getCreatAt()}</td>
                <td>${product.getUpdateAt()}</td>
                <td>
                    <a href="/product?action=edit&id=${product.getId()}">Edit</a>
                    <form action="/product?action=delete" method="post">
                        <input name="id" value="${product.getId()}" hidden>
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
