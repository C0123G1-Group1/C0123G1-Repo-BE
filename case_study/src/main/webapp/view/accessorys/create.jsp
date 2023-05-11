<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/12/2023
  Time: 12:36 AM
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
        <a href="/accessory">List All Product</a>
    </h2>
</center>
<div align="center">
    <form action="/accessory?action=create" method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Product</h2>
            </caption>
            <tr>
                <th>Name</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Type</th>
                <td>
                    <select name="productType" id="">
                        <option value="1">Phone</option>
                        <option value="2">Accessory</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Describe</th>
                <td>
                    <input type="text" name="describe" id="describe" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Price</th>
                <td>
                    <input type="text" name="price" id="price" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Image</th>
                <td>
                    <input type="text" name="productImage" id="productImage" size="15"/>
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
