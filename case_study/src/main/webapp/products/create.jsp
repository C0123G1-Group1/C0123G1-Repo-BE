<%--
  Created by IntelliJ IDEA.
  User: lapto
  Date: 5/8/2023
  Time: 11:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Product Management</h1>
    <h2>
        <a href="/product-servlet">List All Product</a>
    </h2>
</center>
<div align="center">
    <form action="/product-servlet?action=create" method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Product</h2>
            </caption>
            <tr>
                <th>Tên</th>
                <td>
                    <input type="text" name="name" id="name" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>Loại sản phẩm</th>
                <td>
<%--                    <input type="text" name="productType" id="productType" size="45"/>--%>
                    <select name="productType" id="">
                        <option value="1">Phone</option>
                        <option value="2">Accessory</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Thông tin</th>
                <td>
                    <input type="text" name="describe" id="describe" size="15" required/>
                </td>
            </tr>
            <tr>
                <th>Giá</th>
                <td>
                    <input type="text" name="price" id="price" size="15" required/>
                </td>
            </tr>
            <tr>
                <th>Hình ảnh</th>
                <td>
                    <input type="text" name="productImage" id="productImage" size="15" required/>
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
</body>
</html>
