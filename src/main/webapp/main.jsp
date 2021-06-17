<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GoodHome</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" type="text/css"
   href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">
<link rel="stylesheet" href="css/fancybox.min.css">
<link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
footer.footer {
    width: 100%;
    background: #1b3042;
}

.link-column {
    display: inline-block;
    position: relative;
    left: 15%;
    width: 300px;
    margin-top: 20px;
}

.copy{
   text-align: center;
   height: 50px;
   color: white;
}    

</style>
</head>
<body>
   <!-- Theme Style -->
</head>
<body data-spy="scroll" data-target="#templateux-navbar"
   data-offset="200">

   <nav
      class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light"
      id="templateux-navbar">
      <div class="container">
         <a class="navbar-brand" href="index.html"><span
            class="text-danger">WHATNI</span></a>
         <div class="site-menu-toggle js-site-menu-toggle  ml-auto"
            data-aos="fade" data-toggle="collapse"
            data-target="#templateux-navbar-nav"
            aria-controls="templateux-navbar-nav" aria-expanded="false"
            aria-label="Toggle navigation">
            <span></span> <span></span> <span></span>
         </div>
         <!-- END menu-toggle -->

         <div class="collapse navbar-collapse" id="templateux-navbar-nav">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item"><a class="nav-link" href="#section-home">Home</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="#section-contact">Contact</a></li>
               <li class="nav-item cta-btn ml-xl-2 ml-lg-2 ml-md-0 ml-sm-0 ml-0"><a
                  class="nav-link" href="#" target="_blank"><span
                     class="pb_rounded-4 px-4 rounded">Login</span></a></li>
            </ul>
         </div>
      </div>
   </nav>
   <!-- END nav -->

   <section class="site-hero overlay"
      style="background-image: url(images/back.jpg)"
      data-stellar-background-ratio="0.5" id="section-home">
      <div class="container">
         <div
            class="row site-hero-inner justify-content-center align-items-center">
            <div class="col-md-10 text-center" data-aos="fade-up">
               <h1 class="heading">HAVE A GOOD TIME</h1>
            </div>
         </div>
      </div>

   </section>
   <!-- END section -->

   <section class="section bg-light pb-0">
      <div class="container">

         <div class="row check-availabilty" id="next">
            <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

               <form action="search.jsp" method="post">
                  <div class="row">
                     <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkin_date" class="font-weight-bold text-black">Check
                           In</label>
                        <div class="field-icon-wrap">
                           <div class="icon">
                              <span class="icon-calendar"></span>
                           </div>
                           <input type="text" id="checkin_date" class="form-control" name="checkin">
                        </div>
                     </div>
                     <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkout_date" class="font-weight-bold text-black">Check
                           Out</label>
                        <div class="field-icon-wrap">
                           <div class="icon">
                              <span class="icon-calendar"></span>
                           </div>
                           <input type="text" id="checkout_date" class="form-control" name="checkout">
                        </div>
                     </div>
                     <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                        <div class="row">
                           <div class="col-md-6 mb-3 mb-md-0">
                              <label for="adults" class="font-weight-bold text-black">Adults</label>
                              <div class="field-icon-wrap">
                                 <div class="icon">
                                    <span class="ion-ios-arrow-down"></span>
                                 </div>
                                 <select name="adults" id="adults" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4+</option>
                                 </select>
                              </div>
                           </div>
                           <div class="col-md-6 mb-3 mb-md-0">
                              <label for="children" class="font-weight-bold text-black">Children</label>
                              <div class="field-icon-wrap">
                                 <div class="icon">
                                    <span class="ion-ios-arrow-down"></span>
                                 </div>
                                 <select name="children" id="children" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4+</option>
                                 </select>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                        <div class="row">
                           <div class="col-md-6 mb-3 mb-md-0">
                              <label for="adults" class="font-weight-bold text-black">지역</label>
                              <div class="field-icon-wrap">
                                 <div class="icon">
                                    <span class="ion-ios-arrow-down"></span>
                                 </div>
                                 <select name="location" id="city" class="form-control">
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="제주">제주</option>
                                 </select> 
                              </div>
                           </div>
                           <div class="col-md-6 mb-3 mb-md-0">
                              <label for="children" class="font-weight-bold text-black"></label>
                              <div class="field-icon-wrap">
                              <input type="submit" class="btn btn-primary" value="검색"></input>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </section>

   <section class="py-5 bg-light" id="section-about">
      <div class="container">
         <div class="row align-items-center">
            <div
               class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5"
               data-aos="fade-up">
               <img src="images/154.jpg" alt="Image" class="img-fluid rounded">
            </div>
         </div>
      </div>
   </section>

   <footer class="footer">
      <div class="main">
         <div class="link-column">
            <ul class="menu vertical">
               <li class="one"><a href="#" >소개</a></li>
               <li><a href="#">이용방법</a></li>
               <li><a href="#">연락처</a></li>
               <li><a href="#">개인정보 보호정책</a></li>
            </ul>
         </div>
         <div class="link-column">
            <ul class="menu vertical">
               <li class="one"><a href="#" >커뮤니티</a></li>
               <li><a href="#">다양성 및 소속감</a></li>
               <li><a href="#">게스트 추천</a></li>
               <li><a href="#">접근성</a></li>
            </ul>
         </div>
         <div class="link-column">
            <ul class="menu vertical">
               <li class="one"><a href="#" >호스팅하기</a></li>
               <li><a href="#">자료 센터</a></li>
               <li><a href="#">호스트 추천</a></li>
               <li><a href="#">커뮤니티 센터</a></li>
            </ul>
         </div>
         <div class="link-column">
            <ul class="menu vertical">
               <li class="one"><a href="#" >지원</a></li>
               <li><a href="#">도움말 센터</a></li>
               <li><a href="#">예약 취소 옵션</a></li>
               <li><a href="#">신뢰와 안전</a></li>
            </ul>
         </div>
            <hr>
            <p class="copy">Copyright &copy; 2021 WHATNI All Rights Reserved.</p>
      </div>   
   </footer>

   <script src="js/jquery-3.3.1.min.js"></script>
   <script src="js/jquery-migrate-3.0.1.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/owl.carousel.min.js"></script>
   <script src="js/jquery.stellar.min.js"></script>
   <script src="js/jquery.fancybox.min.js"></script>
   <script src="js/jquery.easing.1.3.js"></script>
   <script src="js/aos.js"></script>
   <script src="js/bootstrap-datepicker.js"></script>
   <script src="js/jquery.timepicker.min.js"></script>
   <script src="js/main.js"></script>
</body>
</html>