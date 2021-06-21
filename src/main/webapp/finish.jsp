<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	@import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);

body {
    background-color: #eee;
    font-family: 'Calibri', sans-serif !important
}

.mt-100 {
    margin-top: 100px
}

.card {
    margin-bottom: 30px;
    border: 0;
    -webkit-transition: all .3s ease;
    transition: all .3s ease;
    letter-spacing: .5px;
    border-radius: 8px;
    -webkit-box-shadow: 1px 5px 24px 0 rgba(68, 102, 242, .05);
    box-shadow: 1px 5px 24px 0 rgba(68, 102, 242, .05)
}

.card .card-header {
    background-color: #fff;
    border-bottom: none;
    padding: 24px;
    border-bottom: 1px solid #f6f7fb;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px
}

.card-header:first-child {
    border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
}

.card .card-body {
    padding: 30px;
    background-color: transparent
}

.btn-primary,
.btn-primary.disabled,
.btn-primary:disabled {
    background-color: #4466f2 !important;
    border-color: #4466f2 !important
}
</style>
</head>
<%
	int amenityNo = Integer.parseInt(request.getParameter("no"));
	
	
%>
<%@ include file="../inc/top.jsp"%>
	<div class="container-fluid mt-100">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>결제 성공</h5>
                </div>
                <div class="card-body cart">
                    <div class="col-sm-12 empty-cart-cls text-center"> <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                        <h3><strong>결제가 성공적으로 완료되었습니다 !</strong></h3>
                        <h4>결제된 나의 여행정보를 조회하세요 !</h4> <a href="#" class="btn btn-primary cart-btn-transform m-3" data-abc="true">나의 예약보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>