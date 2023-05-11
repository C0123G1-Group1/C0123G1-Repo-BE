<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/11/2023
  Time: 01:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa thông tin khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<link rel="stylesheet" href="/style.css">
<body>
<header class="sticky-top">
    <input type="checkbox" name="" id="chk1">
    <img src="coollogo_com-32663401.png">
    <div class="logo">
        <div class="search-box">
            <input style="margin-top: 30px" type="text" id="search"
                   placeholder="Tìm kiếm theo tên điện thoại: Iphone...">
            <button style="margin-top: 30px">
                <svg class="iconm" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path>
                </svg>
            </button>
        </div>
    </div>
    <ul>
        <li>
            <div class="dropdown">
                <a class="nut_dropdown">Danh mục</a>
                <div class="noidung_dropdown">
                    <div class="dropdown-item">
                        <a class="dropdown-item" href="#">Action</a>
                    </div>
                    <div class="dropdown-item">
                        <a class="dropdown-item" href="#">Another action</a>
                    </div>
                    <div class="dropdown-item">
                        <a class="dropdown-item" href="#">Another action</a>
                    </div>
                </div>
            </div>
        </li>
        <li style="cursor: pointer"><a>
            <svg class="iconm" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                <path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path>
            </svg>
            <span style="height: 15px; width: 15px;position: absolute"
                  class="badge rounded-pill badge-notification bg-danger"></span>Giỏ hàng</a></li>
        <li (click)="checkProfile()"><a>
            <svg class="iconm" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                <path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"></path>
            </svg>
            name</a></li>
        <li style="cursor: pointer"><a>
            Đăng xuất</a></li>
    </ul>
    <div class="menu">
        <label for="chk1">
            <svg class="iconm" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                <path d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z"></path>
            </svg>
        </label>
    </div>
</header>
<div class="container-fluid">
    <div class="row justify-content-center" >
        <div class="col-auto">
           <h2>Chỉnh sửa thông tin</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
        </div>
        <div class="col-6">
            <h4 style="color: blue; font-weight: bold">${mess}</h4>
            <form method="post" action="/customer?action=edit">
                <label>Tên đăng nhập</label>
                <input disabled class="form-control" type="text" name="userNameDisable"
                       value="${customer.getAccount().getUserName()}"><br>
                <label>Mật khẩu</label>
                <input class="form-control" type="text" name="password"
                       value="${customer.getAccount().getPassword()}"><br>
                <label>Họ và Tên</label>
                <input class="form-control" type="text" name="fullName" value="${customer.getName()}"><br>
                <label>Email</label>
                <input class="form-control" type="email" name="email" value="${customer.getEmail()}"><br>
                <label>Số điện thoại</label>
                <input class="form-control" type="number" name="phoneNumber" value="${customer.getPhoneNumber()}"><br>
                <label>Địa chỉ</label>
                <input class="form-control" type="text" name="address" value="${customer.getAddress()}"><br>
                <button class="btn btn-success">Sửa</button>
            </form>
            <input hidden class="form-control" type="text" name="userNameHidden"
                   value="${customer.getAccount().getUserName()}"><br>
            <input hidden class="form-control" type="text" name="userId" value="${customer.getAccount().getId()}"><br>
        </div>
        <div class="col-3">
        </div>
    </div>
</div>
<div class="container-fluid mt-5 pt-5 " style="background-color: orange">
    <footer class="ml-xl-5 ml-md-4 ml-3 ">
        <div class="row justify-content-end">
            <div class=" col-12">
                <div class="row pt-2">
                    <div class="col-xl-4 col-12 mr-auto">
                        <div class="media flex-sm-row flex-column "><img class="align-self-center img-fluid mobile-img "
                                                                         src="https://i.imgur.com/unD7BGU.png">
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 my-auto ">
                        <div class="row justify-content-around">
                            <div class="col-md-3 col-12 mt-md-0 mt-3">
                                <ul class="list-unstyled text-muted">
                                    <li><a style="color:black">Giới thiệu về công ty</a></li>
                                    <li><a style="color:black">Chính sách bảo mật</a></li>
                                    <li><a style="color:black">Quy chế hoạt động</a></li>
                                    <li><a style="color:black">Kiểm tra hóa đơn điện tử</a></li>
                                    <li><a style="color:black">Tra cứu thông tin bảo hành</a></li>
                                    <li><a style="color:black">Câu hỏi thường gặp mua hàng</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-12 mt-md-0 mt-3">
                                <ul class="list-unstyled text-muted">
                                    <li><a style="color:black">Tin tuyển dụng</a></li>
                                    <li><a style="color:black">Tin khuyến mãi</a></li>
                                    <li><a style="color:black">Hướng dẫn mua online</a></li>
                                    <li><a style="color:black">Hướng dẫn mua trả góp</a></li>
                                    <li><a style="color:black">Chính sách trả góp</a></li>
                                </ul>
                            </div>
                            <div class="col-md-auto col-12">
                                <ul class="list-unstyled text-muted">
                                    <li style="color:black">Tư vấn mua hàng (Miễn phí)</li>
                                    <li><a><span style="color: red">1800 6601</span></a></li>
                                    <li style="color:black">Góp ý, khiếu nại (8h00 - 22h00)</li>
                                    <li><a><span style="color: red;">1800 6616</span></a></li>
                                    <li style="color:black">Hỗ trợ thanh toán:</li>
                                    <li><img
                                            src="https://firebasestorage.googleapis.com/v0/b/c0822g1-mobile-shop-d949d.appspot.com/o/ho%20tro%20thanh%20toan.PNG?alt=media&amp;token=c70032a8-c5f0-40a1-a67f-3a9011ee772d">
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4 bottom-row justify-content-between">
                    <div class="col-sm-auto mr-sm-4 my-auto pt-sm-0 pt-3 ">
                        <p><span><i class="fa fa-instagram" aria-hidden="true"></i></span> <span><i
                                class="fa fa-twitter" aria-hidden="true"></i></span> <span><i class="fa fa-facebook"
                                                                                              aria-hidden="true"></i></span>
                            <span><i class="fa fa-linkedin" aria-hidden="true"></i></span></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
