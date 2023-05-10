<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/8/2023
  Time: 11:25 PM
  To change this template use File | Settings | File Templates.
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tạo loại phụ kiện đi kèm</title>
</head>
<body>
<div align="center" style="margin-top: 2%">
    <form action="/accessory?action=create" method="post">
        <div class="form-group" style="width: 80%;border: black solid 2px">
            <label style="color: darkblue;font-family: 'Times New Roman';font-weight: bold;font-size: 20px">Name
                Accessory</label>
            <input class="form-control" name="nameAccessory"><br>
            <label style="color: darkblue;font-family: 'Times New Roman';font-weight: bold;font-size: 20px">Price
                Accessory</label>
            <input type="number" class="form-control" name="priceAccessory"><br>
            <label style="color: darkblue;font-family: 'Times New Roman';font-weight: bold;font-size: 20px">Image
                Accessory</label>
            <textarea class="form-control" name="imageAccessory"> </textarea>
        </div>
        <br>
        <span style="color: darkblue;font-family: 'Times New Roman';font-weight: bold;font-size: 20px">Thêm phụ kiện vào database: </span>
        <button class="btn btn-success" type="submit"><i class="fas fa-user-edit"></i></button>
    </form>
</div>
</body>
</html>
