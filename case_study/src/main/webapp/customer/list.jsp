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
    <title>List customer</title>
    <link rel="stylesheet" href="/bootstrap520/css/bootstrap.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/customer/regex.css">
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<jsp:include page="/header_footer/header.jsp"></jsp:include>
<nav class="navbar navbar-light bg-light" style="position: sticky;top:0;left: 0;right: 0">
    <div class="container-fluid">
        <div style="display: flex; margin: 8px;position: relative">
            <div>
                <button type="button" class="btn btn-success btn-rounded"
                        onclick="window.location.href='/customer-servlet?action=create'">New customer
                </button>
            </div>
        </div>
        <c:if test="${check}">
            <h5 style="color: darkgreen">Delete success</h5>
        </c:if>
        <c:if test="${check == false}">
            <h5 style="color: red">Delete fail</h5>
        </c:if>
        <form action="/customer-servlet" class="d-flex my-0">
            <input type="hidden" name="action" value="search">
            <input class="form-control me-2" type="text" placeholder="Enter name customer" aria-label="Search"
                   name="nameCustomer" value="${nameCustomer}">
            <input class="form-control me-2" type="text" placeholder="Enter address" aria-label="Search"
                   name="addressCustomer" value="${addressCustomer}">
            <button class="btn btn-info btn-rounded" type="submit">Find</button>
        </form>
    </div>
</nav>
<div class="container-fluid my-lg-2">
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
            <div>
                <h3>List customer</h3>
            </div>
            <table id="tableCustomer" class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td>${customer.getId()}</td>
                        <td>${customer.getName()}</td>
                        <td>${customer.getEmail()}</td>
                        <td>${customer.getPhoneNumber()}</td>
                        <td>${customer.getAddress()}</td>
                        <td>
                            <button class="btn btn-warning"
                                    onclick="window.location.href='/customer-servlet?action=edit&customerId=${customer.getId()}'">
                                Edit
                            </button>
                            <button class="btn btn-danger" type="button" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal"
                                    onclick="infoDelete('${customer.getId()}','${customer.getName()}','${customer.getAccount().getUserName()}')">
                                Delete
                            </button>
                            <button class="btn btn-info" type="button" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal1"
                                    onclick="infoDetail('${customer.getId()}','${customer.getName()}','${customer.getCreateAt()}','${customer.getUpdateAt()}')">
                                Detail
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-1"></div>
    </div>
</div>
<%--Modal delete--%>
<div class="modal fade" id="deleteModal" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/customer-servlet?action=delete" method="post">
                <div class="modal-body">
                    <input hidden id="customerId" name="customerId">
                    <input hidden id="nameAccount" name="nameAccount">
                    <span>Do you want to delete the customer named</span><span id="deleteName"
                                                                               style="color: red"></span><span> ?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No
                    </button>
                    <button type="submit" class="btn btn-primary">
                        Yes
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
                <h5 class="modal-title" id="exampleModalLabel1">Customer details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/customer-servlet?action=delete" method="post">
                <div class="modal-body">
                    <p>ID customer: <span id="customerIdDetail"></span></p>
                    <p>Name customer: <span id="customerNameDetail"></span></p>
                    <p>Create Datetime: <span id="customerCreateAtDetail"></span></p>
                    <p>Update Datetime: <span id="customerUpdateAtDetail"></span></p>
                </div>
            </form>
        </div>
    </div>
</div>
<footer style="margin-top: 50px">
<%--    <jsp:include page="/header_footer/footer.jsp"></jsp:include>--%>
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