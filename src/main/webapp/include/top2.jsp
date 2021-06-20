<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.topbar-responsive {
  background: #2c3840;
  padding: 1rem 1.5rem;
}

.topbar-responsive .topbar-responsive-logo {
  color: #fefefe;
  vertical-align: middle;
}

.topbar-responsive .menu {
  background: #2c3840;
}

.topbar-responsive .menu li:last-of-type {
  margin-right: 0;
}

.topbar-responsive .menu a {
  color: #fefefe;
  transition: color 0.15s ease-in;
}

.topbar-responsive .menu a:hover {
  color: #c6d1d8;
}

@media screen and (max-width: 39.9375em) {
  .topbar-responsive .menu a {
    padding: 0.875rem 0;
  }
}

.topbar-responsive .menu .topbar-responsive-button {
  color: #fefefe;
  border-color: #fefefe;
  border-radius: 5000px;
  transition: color 0.15s ease-in, border-color 0.15s ease-in;
}

.topbar-responsive .menu .topbar-responsive-button:hover {
  color: #c6d1d8;
  border-color: #c6d1d8;
}

@media screen and (max-width: 39.9375em) {
  .topbar-responsive .menu .topbar-responsive-button {
    width: 100%;
    margin: 0.875rem 0;
  }
}

@media screen and (max-width: 39.9375em) {
  .topbar-responsive {
    padding: 0.75rem;
  }
  .topbar-responsive .top-bar-title {
    position: relative;
    width: 100%;
  }
  .topbar-responsive .top-bar-title span {
    position: absolute;
    right: 0;
    border: 1px solid #fefefe;
    border-radius: 5px;
    padding: 0.25rem 0.45rem;
    top: 50%;
    -webkit-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
            transform: translateY(-50%);
  }
  .topbar-responsive .top-bar-title span .menu-icon {
    margin-bottom: 4px;
  }
}

@-webkit-keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@-webkit-keyframes slideDown {
  0% {
    -webkit-transform: translateY(-100%);
            transform: translateY(-100%);
  }
  100% {
    -webkit-transform: translateY(0%);
            transform: translateY(0%);
  }
}

@keyframes slideDown {
  0% {
    -webkit-transform: translateY(-100%);
            transform: translateY(-100%);
  }
  100% {
    -webkit-transform: translateY(0%);
            transform: translateY(0%);
  }
}

@media screen and (max-width: 39.9375em) {
  .topbar-responsive-links {
    -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
    -webkit-animation-duration: 0.5s;
            animation-duration: 0.5s;
    width: 100%;
    -webkit-animation: fadeIn 1s ease-in;
            animation: fadeIn 1s ease-in;
  }
}


</style>
</head>
<body>
<nav class="top-bar topbar-responsive">
  <div class="top-bar-title">
    <span data-responsive-toggle="topbar-responsive" data-hide-for="medium">
      <button class="menu-icon" type="button" data-toggle></button>
    </span>
    <a class="topbar-responsive-logo" href="#"><strong>Site Title</strong></a>
  </div>
  <div id="topbar-responsive" class="topbar-responsive-links">
    <div class="top-bar-right">
      <ul class="menu simple vertical medium-horizontal">
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Works</a></li>
        <li><a href="#">News</a></li>
        <li><a href="#">Contact</a></li>
        <li>
          <button type="button" class="button hollow topbar-responsive-button">Categories</button>
        </li>
      </ul>
    </div>
  </div>
</nav>

</section>
<!-- END section -->
<section class="py-5 bg-light" id="section-about">