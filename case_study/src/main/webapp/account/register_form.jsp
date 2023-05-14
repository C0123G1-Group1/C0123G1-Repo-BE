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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                                <h5 class="text-success">Đăng ký thành công</h5>
                            </c:if>
                            <c:if test="${statusRegister == false}">
                                <h5 class="text-danger">Đăng ký thất bại</h5>
                            </c:if>

                            <form method="post" action="/account-servlet?action=register"
                                  class="align-items-center mt-lg-5 mb-0">
                                <div class="fom-control mb-3">
                                    <label>Tên đăng nhập</label>
                                    <input required oninput="checkUser()" class="form-control" id="user"
                                           placeholder="Nhập tên đăng nhập" type="text" name="userName">
                                    <small id="user1" style="color: red;font-weight: bolder "></small>
                                    <span></span>
                                </div>
                                <div class="fom-control mb-3">
                                    <label>Mật khẩu</label>
                                    <input required oninput="checkPassword()" class="form-control" id="password"
                                           placeholder="Nhập mật khẩu" type="password" name="password">
                                </div>
                                <div class="fom-control mb-3">
                                    <label>Xác nhận lại mật khẩu</label>
                                    <input required oninput="checkPassword()" class="form-control" id="confirm-password"
                                           placeholder="Nhập lại mật khẩu" type="password" name="password">
                                    <small id="pass1" style="color: red;font-weight: bolder "></small>
                                    <span></span>
                                </div>
                                <div class="fom-control mb-3">
                                    <label>Họ và tên</label>
                                    <input required oninput="checkFullName()" class="form-control" id="fullName"
                                           placeholder="Nhập họ và tên" type="text" name="customerName">
                                    <small id="fullName1" style="color: red;font-weight: bolder "></small>
                                    <span></span>
                                </div>
                                <div class="fom-control mb-3">
                                    <label>Email</label>
                                    <input required oninput="checkEmail()" class="form-control" id="email"
                                           placeholder="Vui lòng nhập email" type="email" name="email">
                                    <small id="email1" style="color: red;font-weight: bolder"></small>
                                    <span></span>
                                </div>
                                <div class="fom-control mb-3">
                                    <label>Số điện thoại</label>
                                    <input required oninput="checkPhoneNumber()" class="form-control" id="phoneNumber"
                                           placeholder="Vui lòng nhập số điện thoại" type="text" name="phoneNumber">
                                    <small id="phone1" style="color: red;font-weight: bolder "></small>
                                    <span></span>
                                </div>
                                <div class="fom-control mb-3">
                                    <label>Địa chỉ</label>
                                    <input required class="form-control" placeholder="Vui lòng nhập địa chỉ"
                                           type="text"
                                           name="address">
                                </div>
                                <div class="d-flex justify-content-center">
                                    <button type="submit"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Đăng ký
                                    </button>
                                </div>
                                <p class="text-center text-muted mt-3 mb-0">Bạn đã có tài khoản?
                                    <a href="/login.jsp" class="fw-bold text-body"><u>Đăng nhập</u></a></p>

                            </form>
                            <%--                            <form action="/account-servlet?action=register" method="post">--%>
                            <%--                                <input type="text" name="action" value="register" hidden>--%>
                            <%--                                <div class="form-outline mb-2">--%>
                            <%--                                    <label  class="form-label" for="user">Tên đăng nhập</label>--%>
                            <%--                                    <input oninput="checkUser()" type="text" id="user" class="form-control form-control-lg"--%>
                            <%--                                           name="customerName" />--%>
                            <%--                                    <small id="1" style="color: red;font-weight: bolder "></small>--%>
                            <%--                                    <span></span>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="form-outline mb-2">--%>
                            <%--                                    <label  class="form-label" for="email">Email</label>--%>
                            <%--                                    <input oninput="checkEmail()" type="email" id="email" class="form-control form-control-lg"--%>
                            <%--                                           name="email" />--%>
                            <%--                                    <small id="2" style="color: red;font-weight: bolder "></small>--%>
                            <%--                                    <span></span>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="form-outline mb-2">--%>
                            <%--                                    <label class="form-label" for="form3Example3cg">Số điện thoại</label>--%>
                            <%--                                    <input oninput="checkPhoneNumber()" type="text" id="form3Example3cg" class="form-control form-control-lg"--%>
                            <%--                                           name="phoneNumber" />--%>
                            <%--                                    <small id="3" style="color: red;font-weight: bolder "></small>--%>
                            <%--                                    <span></span>--%>
                            <%--                                    <div class="form-outline mb-2">--%>
                            <%--                                        <label class="form-label" for="form3Example4cg">Địa chỉ</label>--%>
                            <%--                                        <input type="text" id="form3Example4cg" class="form-control form-control-lg"--%>
                            <%--                                               name="address"/>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="form-outline mb-2">--%>
                            <%--                                        <label class="form-label" for="form3Example5cg">Mật khẩu</label>--%>
                            <%--                                        <input oninput="checkPassword()" type="password" id="form3Example5cg"--%>
                            <%--                                               class="form-control form-control-lg" />--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="form-outline mb-2">--%>
                            <%--                                        <label class="form-label" for="form3Example6cdg">Xác nhận mật khẩu</label>--%>
                            <%--                                        <input oninput="checkPassword()" type="password" id="form3Example6cdg"--%>
                            <%--                                               class="form-control form-control-lg" name="password" />--%>
                            <%--                                        <small id="check" style="color: red;font-weight: bolder "></small>--%>
                            <%--                                        <span></span>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="d-flex justify-content-center">--%>
                            <%--                                        <button type="submit"--%>
                            <%--                                                class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Đăng ký</button>--%>
                            <%--                                    </div>--%>
                            <%--                                    <p class="text-center text-muted mt-5 mb-0">Bạn đã có tài khoản? <a--%>
                            <%--                                            href="/home.jsp" class="fw-bold text-body"><u>Đăng nhập</u></a></p>--%>
                            <%--                                </div>--%>
                            <%--                            </form>--%>
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
                document.getElementById("check").innerText = "Mật khẩu không khớp";
            }
        }
    }

    function checkUser() {
        let name = document.getElementById("user").value;
        let regexName = /^[a-z]{5,}[0-9]*$/;
        if (regexName.test(name)) {
            document.getElementById("1").innerText = "";
        } else {
            document.getElementById("1").innerText = "Tên không hợp lệ";
        }
    }

    function checkEmail() {
        let name = document.getElementById("email").value;
        let regexName = /^[a-z]\w{5,}\@[a-z]{3,5}\.[a-z]{2,5}$/;
        if (regexName.test(name)) {
            document.getElementById("2").innerText = "";
        } else {
            document.getElementById("2").innerText = "Email không hợp lệ";
        }
    }

    function checkPhoneNumber() {
        let name = document.getElementById("form3Example3cg").value;
        let regexPhone = /^((\+84)|0)[0-9]{9}$/;
        if (regexPhone.test(name)) {
            document.getElementById("3").innerText = "";
        } else {
            document.getElementById("3").innerText = "Số điện thoại không hợp lệ";
        }
    }
</script>
</body>
<script src="/bootstrap-5.3.0-alpha3-dist/js/bootstrap.js"></script>
</html>