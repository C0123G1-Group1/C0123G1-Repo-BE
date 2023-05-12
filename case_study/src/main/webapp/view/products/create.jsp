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
            <h2>Create New Product</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
        </div>
        <div class="col-6">
            <h4 style="color: blue; font-weight: bold">${mess}</h4>
            <form method="post" action="/product?action=create">
                <label>Name</label>
                <input class="form-control" type="text" name="name" required><br>
                <label>Type</label>
                <select class="form-control" name="productType" id="">
                    <option value="1">Phone</option>
                </select><br>
                <label>Describe</label>
                <input class="form-control" type="text" name="describe" required><br>
                <label>Price</label>
                <input class="form-control" type="number" name="price" required><br>
                <label>Image</label>
                <input class="form-control" type="text" name="productImage" required><br>
                <button class="btn btn-success">Create</button>
            </form>
            <div style="color: blue;font-weight: bold;justify-content: center">${mess}</div>
        </div>
        <div class="col-3">
        </div>
    </div>
</div>
<jsp:include page="/header_footer/footer.jsp"></jsp:include>
</body>
</html>
