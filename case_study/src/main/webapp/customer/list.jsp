<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/9/2023
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link rel="stylesheet" href="/bootstrap520/css/bootstrap.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/header_footer/header.jsp"></jsp:include>
<nav class="navbar navbar-expand-lg navbar-light " style="position: sticky;top:0;left: 0;right: 0;background-color:
#e8e8e8">
    <div class="container-fluid py-3">
        <div>
            <button class="btn btn-outline-success" onclick="window.location.href='/customer?action=create'">Thêm mới
            </button>
        </div>
        <h4 style="color: red; font-weight: bold">${mess}</h4>
        <form action="/customer" class="d-flex my-0">
            <input type="hidden" name="action" value="search">
            <input class="form-control me-2" type="text" placeholder="Nhập tên khách hàng" aria-label="Search"
                   name="nameCustomer" value="${nameCustomer}">
            <input class="form-control me-2" type="text" placeholder="Nhập địa chỉ" aria-label="Search"
                   name="addressCustomer" value="${addressCustomer}">
            <button class="btn btn-outline-primary" type="submit">Tìm kiếm</button>
        </form>
    </div>
</nav>
<div class="container-fluid ">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <div>
                <h3>Danh sách khách hàng</h3>
            </div>
            <table id="tableCustomer" class="table table-hover">
                <thead>
                <tr>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Địa chỉ</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td>${customer.getName()}</td>
                        <td>${customer.getEmail()}</td>
                        <td>${customer.getPhoneNumber()}</td>
                        <td>${customer.getAddress()}</td>
                        <td>
                            <button class="btn btn-warning"
                                    onclick="window.location.href='/customer?action=edit&customerId=${customer.getId()}'">
                                Sửa
                            </button>
                            <button class="btn btn-danger" type="button" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal"
                                    onclick="infoDelete('${customer.getId()}','${customer.getName()}','${customer.getAccount().getUserName()}')">
                                Xóa
                            </button>
                            <button class="btn btn-info" type="button" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal1"
                                    onclick="infoDetail('${customer.getId()}','${customer.getName()}','${customer.getCreateAt()}','${customer.getUpdateAt()}')">
                                Chi tiết
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-2"></div>
    </div>
</div>
<%--Modal delete--%>
<div class="modal fade" id="deleteModal" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa khách hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <input hidden id="customerId" name="customerId">
                    <input hidden id="nameAccount" name="nameAccount">
                    <span>Bạn có muốn xóa khách hàng </span><span id="deleteName" style="color: red"></span><span> không?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không
                    </button>
                    <button type="submit" class="btn btn-primary">
                        Có
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--Modal detail--%>
<div class="modal" id="deleteModal1" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Chi tiết khách hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <p>ID khách hàng:  <span id="customerIdDetail"></span></p>
                    <p>Tên Khách hàng: <span id="customerNameDetail"></span></p>
                    <p>Ngày thêm:      <span id="customerCreateAtDetail"></span></p>
                    <p>Ngày Sửa:       <span id="customerUpdateAtDetail"></span></p>
                </div>
            </form>
        </div>
    </div>
</div>
<footer style="margin-top: 50px">
    <jsp:include page="/header_footer/footer.jsp"></jsp:include>
</footer>
<script>
    function infoDelete(id, name, account) {
        document.getElementById("customerId").value = id;
        document.getElementById("nameAccount").value = account;
        document.getElementById("deleteName").innerText = name;
    }

    function infoDetail(id, name, createAt, updateAt) {
        document.getElementById("customerIdDetail").innerText = id;
        document.getElementById("customerNameDetail").innerText = name;
        document.getElementById("customerCreateAtDetail").innerText = createAt;
        document.getElementById("customerUpdateAtDetail").innerText = updateAt;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        });
    });
</script>
</body>
</html>