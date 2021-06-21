<%@page import="com.airbnb.amenity.model.AmenityVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>확인 및 결제</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/payment.css"/>

<script src="https://use.fontawesome.com/releases/v5.7.2/css/all.css"></script>
<script src="js/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="css/bootstrap-datepicker.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/bootstrap-datepicker.ko.js"></script>
<!-- Theme Style -->
<link rel="stylesheet" href="css/style.css">
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script type="text/javascript">
	

</script>
<style type="text/css">
	div#content {
    margin: 0 auto;
    width: 80%;
	}
	.modal-content{
	overflow-y: initial !important
	}
	.modal-body{
	height: 600px;
	overflow-y: auto;
	}
</style>
</head>
<jsp:useBean id="amenityService" class="com.airbnb.amenity.model.AmenityService" scope="page"></jsp:useBean>

<%
	AmenityVO vo =new AmenityVO();
	request.setCharacterEncoding("utf-8");
	DecimalFormat df = new DecimalFormat("#,###");
	String checkin=request.getParameter("checkin");
	String checkout=request.getParameter("checkout");
	int children= Integer.parseInt(request.getParameter("children"));
	int adults= Integer.parseInt(request.getParameter("adults"));
	int amenityNo=Integer.parseInt(request.getParameter("no"));
	if(!request.getParameter("no").isEmpty() && request.getParameter("no")!=null){
			
			try{
				vo = amenityService.selectByAmenityNo(amenityNo);
				
			}catch(SQLException e){
				e.printStackTrace();
			}
				
		}
	 String strStartDate = checkin;
     String strEndDate = checkout;
     String strFormat = "yyyy-MM-dd";  
     String userno=(String)session.getAttribute("no");
     
     //SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
     SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
     long diffDay=0;
     String price=df.format(vo.getPrice());
     
     try{
         Date startDate = sdf.parse(strStartDate);
         Date endDate = sdf.parse(strEndDate);

         //두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
         diffDay = (endDate.getTime() - startDate.getTime()) / (24*60*60*1000);
         
     }catch(ParseException e){
         e.printStackTrace();
     }
	String subtotal=df.format(vo.getPrice()*(diffDay));
	String totalprice=df.format(vo.getPrice()*(diffDay)+39900);
	long totalpayment=vo.getPrice()*diffDay+39900;
%>
<script type="text/javascript">
	$(function(){
		$('#goPayment').click(function(e){
			e.preventDefault();
			$('#paymentModal').modal("show");
		});
		
		$('#closebtn').click(function(){
			$('#paymentModal').modal("hide");
		});
		
		$('#finalPayment').click(function(){
			location.href="<%=request.getContextPath()%>/reservation_ok.jsp?checkin=<%=checkin%>&checkout=<%=checkout%>&children=<%=children%>&adults=<%=adults%>&userno=<%=userno%>&amenityno=<%=amenityNo%>&payment=<%=totalpayment%>";
		})
	})

</script>
<%@ include file="../inc/top.jsp"%>
<div id="content">
    <div class="container" id="scroll" style="width:100%;float:left;margin-top:20px">  
         <div class="row check-availabilty" id="next">
           <div class="block-32" data-aos="fade-up" data-aos-offset="-200">
           		<div class="wrapper" style="width:100%;float:left">
    <div class="h5 large">확인 및 결제</div>
    <div class="row">
        <div class="col-lg-6 col-md-8 col-sm-10 offset-lg-0 offset-md-2 offset-sm-1">
            <div class="mobile h5">확인 및 결제</div>
	           <label for="checkin_date" class="font-weight-bold text-black" style="font-size:20px">예약 정보</label>
	               <div class="row">
	                 <div class="col-md-6 mb-3 mb-lg-0 col-lg-6">
	                   <label for="checkin_date" class="font-weight-bold text-black">체크 인</label>
	                   <div class="field-icon-wrap">
	                     <div class="icon"><span class="icon-calendar"></span></div>
	                     <input type="text" id="checkin_date" class="form-control" style="width:300px" value="<%=checkin%>" disabled>
	                   </div>
	                 </div>
	               </div>
	               <div class="row">
	                 <div class="col-md-6 mb-3 mb-lg-0 col-lg-6">
	                   <label for="checkout_date" class="font-weight-bold text-black" >체크 아웃</label>
	                   <div class="field-icon-wrap">
	                     <div class="icon"><span class="icon-calendar"></span></div>
	                     <input type="text" id="checkout_date" class="form-control" style="width:300px" value="<%=checkout%>" disabled>
	                   </div>
	                 </div>
	               	</div>
	               	 <label for="checkout_date" class="font-weight-bold text-black" style="margin-top:20px">게스트 <div style="color:gray;margin-top:10px"><%=children+adults %>명</div></label>
	                 <br>
	                 <label for="checkout_date" class="font-weight-bold text-black" >날짜<div style="color:gray;margin-top:10px"><%=checkin %> ~ <%=checkout %> </div><div>총 <%=diffDay %>박 <%=diffDay+1 %>일</div></label>
	           
            
            <input type="checkbox" checked> <label>Shipping address is same as billing</label>
            <div id="address" class="bg-light rounded mt-3">
                <div class="h5 font-weight-bold text-primary"> 환불정책 </div>
                <div class="d-md-flex justify-content-md-start align-items-md-center pt-3">
                    <div>
                    	7월 25일 3:00 PM까지 무료로 취소할 수 있습니다. 그 후에는 7월 30일 3:00 PM 전에 예약을 취소하면 첫 1박 요금 및 서비스 수수료를 제외한 요금의 50%가 환불됩니다.<br>
						호스트가 제공하는 환불 정책이 내게 적합한지 확인하세요. 코로나19와 같이 이미 알려진 사건 또는 일반적인 악천후와 같이 예측 가능한 사건으로 인한 여행 장애는 에어비앤비의 정상참작이 가능한 상황 정책의 적용 대상이 아닐 수 있습니다<br>
						
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-8 col-sm-10 offset-lg-0 offset-md-2 offset-sm-1 pt-lg-0 pt-3">
            <div id="cart" class="bg-white rounded">
                <div class="d-flex justify-content-between align-items-center">
                    <label for="checkin_date" class="font-weight-bold text-black" style="font-size:20px">요금 세부 정보</label>
                    <div class="h6"> <a href="#">Edit</a> </div>
                </div>
                <div class="d-flex jusitfy-content-between align-items-center pt-3 pb-2 border-bottom">
                    <div class="item pr-2"> <img src="images/hotel.jpg" alt="" width="80" height="80">
                        <div class="number"><%=adults+children %></div>
                    </div>
                    <div class="d-flex flex-column px-3"> <b class="h5"><%=vo.getTitle() %></b></div>
                    <div class="ml-auto"> <b class="h5" style="text-decoration: underline;">₩ <%=price %></b> </div>
                </div>
                <div class="my-3"> <input type="text" class="w-100 form-control text-center" placeholder="Gift Card or Promo Card"> </div>
                <div class="d-flex align-items-center">
                    <div class="display-5" style="font-size:15px"><%=price %> x <%=diffDay %>박</div>
                    <div class="ml-auto font-weight-bold" style="text-decoration: underline;">₩ <%=subtotal %></div>
                </div>
                <div class="d-flex align-items-center py-2 border-bottom">
                    <div class="display-5" style="font-size:15px">청소비</div>
                    <div class="ml-auto font-weight-bold" style="text-decoration: underline;">₩ 39,900</div>
                </div>
                <div class="d-flex align-items-center py-2 border-bottom">
                    <div class="display-5" style="font-size:15px">서비스수수료</div>
                    <div class="ml-auto font-weight-bold" style="text-decoration: underline;">₩ 0</div>
                </div>
                <div class="d-flex align-items-center py-2">
                    <div class="display-5" style="font-size:15px">총합계 (KRW)</div>
                    <div class="ml-auto d-flex">
                        <div class="text-primary text-uppercase px-3">KRW</div>
                        <div class="font-weight-bold" style="text-decoration: underline;">₩ <%=totalprice %></div>
                    </div>
                </div>
            </div>
            <p class="text-muted">도움이 필요하세요 ?</p>
            <p class="text-muted"><a href="#" class="text-danger">문의 전화:</a>+314440160 (International)</p>
            <div class="h4 pt-3"> <span class="fas fa-shield-alt text-primary pr-2"></span> Security of your shopping</div>
            <div id="summary" class="bg-white rounded py-2 my-4">
                <div class="table-responsive">
                    <table class="table table-borderless w-75">
                        <tbody>
                            <tr class="text-muted">
                                <td>Battlecreek Coffee</td>
                                <td>:</td>
                                <td>$80.9</td>
                            </tr>
                            <tr class="text-muted">
                                <td>Code-770</td>
                                <td>:</td>
                                <td>770</td>
                            </tr>
                            <tr class="text-muted">
                                <td>Quantity</td>
                                <td>:</td>
                                <td>
                                    <div class="d-flex align-items-center"> <span class="fas fa-minus btn text-muted"></span> <span>2</span> <span class="fas fa-plus btn text-muted"></span> </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="border-top py-2 d-flex align-items-center ml-2 font-weight-bold">
                    <div>총 합계</div>
                    <div class="ml-auto text-primary">KRW</div>
                    <div class="px-2" style="text-decoration: underline;">₩ <%=totalprice %></div>
                </div>
            </div>
            <div class="row pt-lg-3 pt-2 buttons mb-sm-0 mb-2">
                <div class="col-md-6">
                    <div class="btn text-uppercase">상세페이지로 돌아가기</div>
                </div>
                <div class="col-md-6 pt-md-0 pt-3">
                    <div class="btn text-white ml-auto" id="goPayment"> <span class="fas fa-lock"></span> 확인 및 결제</div>
                </div>
            </div>
            <div class="text-muted pt-3" id="mobile"> <span class="fas fa-lock"></span> Your information is save </div>
        </div>
    </div>
    <div class="text-muted"> <span class="fas fa-lock"></span> Your information is save </div>
</div>
           </div>
         </div>
    </div>
    
</div>

<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결제하기</h5>
					<button class="close" id="closebtn" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="payment-info">
				        <div class="d-flex justify-content-between align-items-center"><span>카드 세부정보</span><img class="rounded" src="https://i.imgur.com/WU501C8.jpg" width="30"></div><span class="type d-block mt-3 mb-1">카드타입 선택</span><label class="radio"> <input type="radio" name="card" value="payment" checked> <span><img width="30" src="https://img.icons8.com/color/48/000000/mastercard.png" /></span> </label>
				        <label class="radio"> <input type="radio" name="card" value="payment"> <span><img width="30" src="https://img.icons8.com/officel/48/000000/visa.png" /></span> </label>
				        <label class="radio"> <input type="radio" name="card" value="payment"> <span><img width="30" src="https://img.icons8.com/ultraviolet/48/000000/amex.png" /></span> </label>
				        <label class="radio"> <input type="radio" name="card" value="payment"> <span><img width="30" src="https://img.icons8.com/officel/48/000000/paypal.png" /></span> </label>
				        <div><label class="credit-card-label">소유자 명</label><input type="text" class="form-control credit-inputs" placeholder="Name"></div>
				        <div><label class="credit-card-label">카드번호</label><input type="text" class="form-control credit-inputs" placeholder="0000 0000 0000 0000"></div>
				        <div class="row">
				            <div class="col-md-6"><label class="credit-card-label">유효기한</label><input type="text" class="form-control credit-inputs" placeholder="12/24"></div>
				            <div class="col-md-6"><label class="credit-card-label">CVV번호 (카드뒷면 숫자3자리)</label><input type="text" class="form-control credit-inputs" placeholder="342"></div>
				        </div>
				        <hr class="line">
				        <div class="d-flex justify-content-between information"><span>중간합계</span><span>₩ <%=subtotal %></span></div>
				        <div class="d-flex justify-content-between information"><span>청소비</span><span>₩ 39,900</span></div>
				        <div class="d-flex justify-content-between information"><span>서비스 수수료</span><span>₩ 0</span></div>
				        <div class="d-flex justify-content-between information"><span>총 결제금액</span><span>₩ <%=totalprice %></span></div><button id="finalPayment" class="btn btn-primary btn-block d-flex justify-content-between mt-3" type="button"><span>₩ <%=totalprice %></span><span>결제<i class="fa fa-long-arrow-right ml-1"></i></span></button>
				    </div>
				</div>
				
			</div>
		</div>
	</div>










	
</body>
</html>