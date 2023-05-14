<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2023
  Time: 8:18 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>IG1 Store</title>
    <link rel="stylesheet" href="register_css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .gradient-custom-3 {
            /* fallback for old browsers */
            background: #84fab0;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
        }
        .gradient-custom-4 {
            /* fallback for old browsers */
            background: #84fab0;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
        }
    </style>
</head>

<body>
<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5" style="height: 100vh">
                            <h4 class="text-uppercase text-center mb-2">Create an account</h4>
                            <c:if test="${statusRegister}">
                                <h5>Dang ky thanh cong</h5>
                            </c:if>
                            <c:if test="${statusRegister == false}">
                                <h5>Dang ky that bai</h5>
                            </c:if>
                            <form action="/account-servlet?action=register" method="post">
                                <input type="text" name="action" value="register" hidden>
                                <div class="form-outline mb-2">
                                    <label  class="form-label" for="user">User Name</label>
                                    <input oninput="checkUser()" type="text" id="user" class="form-control form-control-lg"
                                           name="customerName" />
                                    <small id="1" style="color: red;font-weight: bolder "></small>
                                    <span></span>
                                </div>
                                <div class="form-outline mb-2">
                                    <label  class="form-label" for="email">Your Email</label>
                                    <input oninput="checkEmail()" type="email" id="email" class="form-control form-control-lg"
                                           name="email" />
                                    <small id="2" style="color: red;font-weight: bolder "></small>
                                    <span></span>
                                </div>
                                <div class="form-outline mb-2">
                                    <label class="form-label" for="form3Example3cg">Phone number</label>
                                    <input oninput="checkPhoneNumber()" type="text" id="form3Example3cg" class="form-control form-control-lg"
                                           name="phoneNumber" />
                                    <small id="3" style="color: red;font-weight: bolder "></small>
                                    <span></span>
                                    <div class="form-outline mb-2">
                                        <label class="form-label" for="form3Example4cg">Địa chỉ</label>
                                        <input type="text" id="form3Example4cg" class="form-control form-control-lg"
                                               name="address"/>
                                    </div>
                                    <div class="form-outline mb-2">
                                        <label class="form-label" for="form3Example5cg">Password</label>
                                        <input oninput="checkPassword()" type="password" id="form3Example5cg"
                                               class="form-control form-control-lg" />
                                    </div>
                                    <div class="form-outline mb-2">
                                        <label class="form-label" for="form3Example6cdg">Confirm your
                                            password</label>
                                        <input oninput="checkPassword()" type="password" id="form3Example6cdg"
                                               class="form-control form-control-lg" name="password" />
                                        <small id="check" style="color: red;font-weight: bolder "></small>
                                        <span></span>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <button type="submit"
                                                class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                    </div>
                                    <p class="text-center text-muted mt-5 mb-0">Have already an account? <a
                                            href="../index.jsp" class="fw-bold text-body"><u>Login here</u></a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    function checkPassword() {
        let passwordFirst = document.getElementById("form3Example5cg").value;
        let passwordLast = document.getElementById("form3Example6cdg").value;
        if (passwordLast !== "") {
            if (passwordFirst === passwordLast) {
                document.getElementById("check").innerText = "";
            } else {
                document.getElementById("check").innerText = "Password invaild";
            }
        }
    }
    function checkUser() {
        let name = document.getElementById("user").value;
        let regexName = /^[a-z]{5,}[0-9]*$/;
        if (regexName.test(name)) {
            document.getElementById("1").innerText = "";
        } else {
            document.getElementById("1").innerText = "The Name is not in the correct format";
        }
    }
    function checkEmail() {
        let name = document.getElementById("email").value;
        let regexName = /^[a-z]\w{5,}\@[a-z]{3,5}\.[a-z]{2,5}$/;
        if (regexName.test(name)) {
            document.getElementById("2").innerText = "";
        } else {
            document.getElementById("2").innerText = "The Name is not in the correct format";
        }
    }
    function checkPhoneNumber() {
        let name = document.getElementById("form3Example3cg").value;
        let regexPhone = /^((\+84)|0)[0-9]{9}$/;
        if (regexPhone.test(name)) {
            document.getElementById("3").innerText = "";
        } else {
            document.getElementById("3").innerText = "The Name is not in the correct format";
        }
    }
</script>
</body>
<script src="/bootstrap-5.3.0-alpha3-dist/js/bootstrap.js"></script>
</html>