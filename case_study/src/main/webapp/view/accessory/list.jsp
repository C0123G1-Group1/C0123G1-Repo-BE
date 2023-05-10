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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>


<html>
<head>
    <title>Hiển thị danh sách phụ kiện đi kèm</title>
</head>
<body>
<center>
    <h1>Quản lý phụ kiện</h1>
</center>
<div style="margin: auto; width: 80%">
    <span style="color: chocolate;font-size: 20px;font-weight: bold;font-family: 'Times New Roman'">Thêm phụ kiện vào database: </span>
    <button class="add-product-btn" onclick="window.location.href='/accessory?action=create'" type="button"
            class="btn btn-danger"><i class="fas fa-user-edit"></i>
    </button>


    <form action="/accessory?action=search" method="post">
        <input type="text" name="nameAccessory" placeholder="Search follow name">
        <select name="priceAccessory" id="">
            <option value="5"></option>
            <option value="1">Dưới 5 trăm</option>
            <option value="2">Từ 500 đến 1 triệu</option>
            <option value="3">Từ 1 triệu đến 5 triệu</option>
            <option value="4">Từ 5 triệu đến 100 triệu</option>
        </select>
        <input type="submit" value="Search">
    </form>

</div>

<br>
<div align="center">

    <table border="1" cellpadding="5" class="table table-dark table-striped" style="width: 80%">
        <tr>
            <th>ID</th>
            <th>Name Accessory</th>
            <th>Price Accessory</th>
            <th>Image Accessory</th>
            <th>Date Created</th>
            <th>Update day</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="phukien" items="${accessoryList}">
            <tr>
                <td><c:out value="${phukien.id}"/></td>
                <td><c:out value="${phukien.nameAccessory}"/></td>
                <td><c:out value="${phukien.priceAccessory}"/></td>
                <td><img style="width: 20px;height: 20px" src="${phukien.imageAccessory}" alt=""></td>
                <td><c:out value="${phukien.createAt}"/></td>
                <td><c:out value="${phukien.updateAt}"/></td>
                <td>
                    <a href="/accessory?action=update&id=${phukien.id}"><i class="fas fa-pen"></i> </a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" data-bs-toggle="modal"
                            data-bs-target="#modelId${phukien.id}" style="border-radius: 35px">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                </td>
            </tr>
            <!-- Modal -->
            <form action="/accessory?action=delete" method="get">
                <div class="modal fade" id="modelId${phukien.id}" tabindex="-1" role="dialog"
                     aria-labelledby="modelTitleId"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="modelTitleId">Xóa một phụ kiện</h4>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="${phukien.id}">
                            <div class="modal-body">
                                Bạn muốn xóa phụ kiện ${phukien.nameAccessory} không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </c:forEach>
    </table>
    <br>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</div>
</body>
</html>
