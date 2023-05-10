<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/8/2023
  Time: 11:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>Cập nhật cho phụ kiện đi kèm</title>
</head>
<body>
<div style="margin-top: 2%;margin-left: 2%">
    <form action="/accessory?action=update" method="post">
        <div class="form-group" style="width: 80%;border: black solid 2px">
            <label style="padding-left: 10px"> id :</label><input type="text" name="id" id="id"
                                                                  value="${accessory.getId()}"
                                                                  style="margin-left: 2%;">
            <br>
            <label style="padding-left: 10px"> nameAccessory :</label> <input type="text" name="nameAccessory"
                                                                              id="nameAccessory"
                                                                              value="${accessory.getNameAccessory()}">
            <br>
            <label style="padding-left: 10px">priceAccessory :</label> <input type="text" name="priceAccessory"
                                                                              id="priceAccessory"
                                                                              value="${accessory.getPriceAccessory()}">
            <br>
            <label style="padding-left: 10px"> imageAccessory :</label> <input type="text" name="imageAccessory"
                                                                               id="imageAccessory"
                                                                               value="${accessory.getImageAccessory()}">
            <br>
            <span style="color: darkblue;font-family: 'Times New Roman';font-weight: bold;font-size: 20px;padding-left: 10px">Cập nhật thông tin loại phụ kiện vào database: </span>
            <button type="submit">update</button>
        </div>
    </form>
</div>
</body>
</html>
