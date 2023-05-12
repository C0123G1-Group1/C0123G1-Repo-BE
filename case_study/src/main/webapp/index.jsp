<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="file.css">
</head>
<body>
<header class="sticky-top">
    <input type="checkbox" name="" id="chk1">
    <img src="coollogo_com-32663401.png">
    <div class="logo">
        <div class="search-box" style="margin-left: 2px">
            <input style="margin-top: 6px" type="text" id="search"
                   placeholder="Search by phone name: Iphone...">
            <button style="margin-top: 13px">
                <svg class="iconm" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path>
                </svg>
            </button>
        </div>
    </div>
    <ul>
        <li>
            <div class="dropdown" style="margin-top: 20px">
                <a class="nut_dropdown">Category</a>
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
        <li style="cursor: pointer; margin-top: 27px"><a>
            <svg class="iconm" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                <path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path>
            </svg>
            <span style="height: 15px; width: 15px;position: absolute;"
                  class="badge rounded-pill badge-notification bg-danger"></span>Cart</a></li>
        <li (click)="checkProfile()" style="margin-top: 27px"><a>
            <svg class="iconm" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                <path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"></path>
            </svg>
            Name</a></li>
        <li style="cursor: pointer; margin-top: 27px"><a>
            Log out</a></li>
    </ul>
    <div class="menu">
        <label for="chk1">
            <svg class="iconm" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                <path d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z"></path>
            </svg>
        </label>
    </div>
</header>
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="margin-top: -2vw">
    <div class="carousel-inner">
        <div class="carousel-item">
            <img style="height: 500px"
                 src="https://cdn.hoanghamobile.com/i/home/Uploads/2023/05/06/web-galaxy-z-fold4-z-flip4-03.jpg"
                 class="d-block w-100" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item active">
            <img style="height: 500px"
                 src="https://cdn.hoanghamobile.com/i/home/Uploads/2023/05/08/redmi-note-12-series-pc.png" alt="...">
        </div>
        <div class="carousel-item">
            <img style="height: 500px"
                 src="https://cdn.hoanghamobile.com/i/home/Uploads/2023/05/10/14prm-pc_638193094251696370.png"
                 class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<div class="product">
    <img width="100%" height="100" loading="lazy" class=" lazyloaded"
         src="https://images.fpt.shop/unsafe/fit-in/1200x100/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/5/10/638193055769462434_H7_1200x100.png">
    <div class="wrapper">
        <ul class="products">
            <div class="previous">
                <a class="previous">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </a>
            </div>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img style="margin-top: 1vw"
                                 src="https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_12.png">
                        </a>
                        <a class="buy-now" data-toggle="modal" data-target="#detail">Mua
                            ngay</a>
                    </div>
                </div>
                <div class="product-info">
                    <a href="" class="product-cart"></a>
                    <a href="" class="product-name">IP 14 </a>
                    <div class="product-price">15.000.000đ</div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://hoanghamobile.com/tin-tuc/wp-content/uploads/2021/07/ip-14-696x392.jpeg">
                        </a>
                        <a class="buy-now" data-toggle="modal" data-target="#detail">Mua
                            ngay</a>
                    </div>
                </div>
                <div class="product-info">
                    <a href="" class="product-cart"></a>
                    <a href="" class="product-name">IP 14 </a>
                    <div class="product-price">15.000.000đ</div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://hoanghamobile.com/tin-tuc/wp-content/uploads/2021/07/ip-14-696x392.jpeg">
                        </a>
                        <a class="buy-now" data-toggle="modal" data-target="#detail">Mua
                            ngay</a>
                    </div>
                </div>
                <div class="product-info">
                    <a href="" class="product-cart"></a>
                    <a href="" class="product-name">IP 14 </a>
                    <div class="product-price">15.000.000đ</div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://hoanghamobile.com/tin-tuc/wp-content/uploads/2021/07/ip-14-696x392.jpeg">
                        </a>
                        <a class="buy-now" data-toggle="modal" data-target="#detail">Mua
                            ngay</a>
                    </div>
                </div>
                <div class="product-info">
                    <a href="" class="product-cart"></a>
                    <a href="" class="product-name">IP 14 </a>
                    <div class="product-price">15.000.000đ</div>
                </div>
            </li>

            <div class="next">
                <a class="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </a>
            </div>
        </ul>
    </div>
</div>
<div class="product">
    <img width="100%" height="120"
         src="https://firebasestorage.googleapis.com/v0/b/c0822g1-mobile-shop-d949d.appspot.com/o/anh2.PNG?alt=media&amp;token=3bde8fb6-57a8-4c49-9d7d-e06f22a7a629">

    <div class="wrapper">
        <ul class="products">
            <div class="previous">
                <a class="previous">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </a>
            </div>
            <li *ngfor="let commodity of commodities">
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://hoanghamobile.com/tin-tuc/wp-content/uploads/2021/07/ip-14-696x392.jpeg">
                        </a>
                        <a class="buy-now" data-toggle="modal" data-target="#detail">Mua
                            ngay</a>
                    </div>
                </div>
                <div class="product-info">
                    <a href="" class="product-cat"></a>
                    <a href="" class="product-name">IP14<span
                            style="background-color: lightgray;color: #007bff;font-weight: 600"></span></a>
                    <div class="product-price">15.000.000VND</div>
                </div>
            </li>
            <div class="next">
                <a class="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </a>
            </div>
        </ul>
    </div>
</div>
<div class="modal fade" id="detail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">Details</h4>
                <button type="button" id="dissmis" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <img [src]="commodity.image" class="card-img-top" style="max-height: 200px; padding: 5px 5px">
                    <div class="card-body">
                        <h5 class="card-title" style="color: crimson ">{{commodity.name | titlecase }}</h5>
                        <p style="color: red; font-weight: bold" class="card-text">{{commodity.price | currency:
                            "VND"}}</p>
                    </div>
                </div>
                <div class="card-info">
                    <table class="table table-hover">
                        <tbody>
                        <tr>
                            <th>Camera</th>
                            <td>{{commodity.camera}} MP</td>
                        </tr>
                        <tr>
                            <th>Camera trước</th>
                            <td>{{commodity.selfie}} MP</td>
                        </tr>
                        <tr>
                            <th>Dung lượng</th>
                            <td>{{commodity.capacity}} MP</td>
                        </tr>
                        <tr>
                            <th>CPU</th>
                            <td>{{commodity.cpu}}</td>
                        </tr>
                        <tr>
                            <th>Bảo hành</th>
                            <td>{{commodity.guarantee}} tháng</td>
                        </tr>
                        <tr>
                            <th>Nơi sản xuất</th>
                            <td>{{commodity.origin}}</td>
                        </tr>
                        <tr>
                            <th>Chi tiết</th>
                            <td>{{commodity.description}}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Thêm vào giỏ hàng
                </button>
            </div>
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
                                    <li><a style="color:black">Introduce about the company</a></li>
                                    <li><a style="color:black">Privacy Policy</a></li>
                                    <li><a style="color:black">Operational Regulations</a></li>
                                    <li><a style="color:black">Check e-invoices</a></li>
                                    <li><a style="color:black">Look up warranty information</a></li>
                                    <li><a style="color:black">Purchase FAQ</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-12 mt-md-0 mt-3">
                                <ul class="list-unstyled text-muted">
                                    <li><a style="color:black">Recruitment</a></li>
                                    <li><a style="color:black">Promotion information</a></li>
                                    <li><a style="color:black">Guide to buying online</a></li>
                                    <li><a style="color:black">Installment purchase guide</a></li>
                                    <li><a style="color:black">Installment Policy</a></li>
                                </ul>
                            </div>
                            <div class="col-md-auto col-12">
                                <ul class="list-unstyled text-muted">
                                    <li style="color:black">Buying advice (Free)</li>
                                    <li><a><span style="color: red">1800 6601</span></a></li>
                                    <li style="color:black">Comments and complaints (8h00 - 22h00)</li>
                                    <li><a><span style="color: red;">1800 6616</span></a></li>
                                    <li style="color:black">Payment support:</li>
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

</body>
</html>