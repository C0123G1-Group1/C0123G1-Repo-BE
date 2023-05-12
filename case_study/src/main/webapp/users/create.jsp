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
</head>
<body>
<form action="/order-servlet?action=createOrderDetail" method="post">
    <table border="1" cellpadding="5">
        <tr>
            <th>Order Id</th>
            <td>
                <input type="text" name="orderId" id="describe" size="15" value="${orderId}" readonly/>
            </td>
        </tr>

        <tr>
            <th>Customer Id</th>
            <td>
                <input type="text" name="customerId" id="name" size="45" value="${customerId}" readonly/>
            </td>
        </tr>

        <tr>
            <th>Product Id</th>
            <td>
                <input type="text" name="productId" id="productId" size="15" value="${productId}" readonly/>
            </td>
        </tr>
        <tr>
            <th>ProductType</th>
            <td>
                <input type="text" name="productType" id="productImage" size="15" value="${productType}" readonly/>
            </td>
        </tr>
        <tr>
            <th>Price</th>
            <td>
                <input type="text" name="price" id="price" size="15" value="${price}" readonly/>
            </td>
        </tr>
        <tr>
            <th>Quantity</th>
            <td>
                <input type="text" name="quantity" id="quantity" size="15"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Buy"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
