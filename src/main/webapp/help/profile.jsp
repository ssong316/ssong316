<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.divv {
	width: 80%;
	margin: 0 auto;
	display: flex;
}

.hh{
	width: 700px;
}

.hhh{
	width: 30%;
	margin-top: 70px;
	margin-left: 90px;
}

.large-4 columns{
	width:50%
}
.portfolio-resume-spacing {
	margin-bottom: 2rem;
}

.portfolio-resume-wrapper {
	padding: 10px 10px;
}

.portfolio-resume-headshot {
	margin-bottom: 2rem;
	border-radius: 50%;
}

.portfolio-resume-header {
	text-transform: uppercase;
	padding-bottom: 1rem;
	font-weight: bold;
	margin-bottom: 1rem;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  $(".more").click(function(){
	    $(".msg").slideToggle('slow');
	  });
	});
</script>
<div class="divv">
	<div class="large-4 columns hh">
		<div class="portfolio-resume-wrapper">
			<img alt="profile" src="images/kitsch29.png"> <label
				style="font-size: 2em;"><%=session.getAttribute("name") %> 님</label>
			<div class="portfolio-resume-spacing ">
				<h5>
					<strong>호스트의 한마디</strong>
				</h5>
				<p>
				안녕하세요. 게스트님! 저희 부부는 퇴직 후 자연을 좋아하여 이곳 영월 김삿갓 계곡에 집을 짓고 살게되었습니다. 
				다른 분들도 사계절이 아름다운 김삿갓 계곡을 즐겼으면 하는 마음에, 누구나 자연 속에서 편히 쉬고 재충전 할수 있는 스테이 하우스를 짓게 되었습니다.
				저희 집은 영월에서 쉽게 찾을 수 없는 커플 펜션으로 부부 또는 연인과 함께오시면 공간을 프라이빗하고 편하게 사용하실 수 있습니다.^^ 
				</p>
				<span class="more" >더보기</span>
				<div class="msg" style="display: none;">
				<p>	
				저희는 늘 정원의 예쁜 꽃들과 나무들을 가꾸며 일상을 분주하게 보내고 있어요. 
				아름다운 자연 속에서 편히 쉬기 위해 영월을 찾았다가, 지금은 오히려 일이 늘었지만 게스트분들과 소통하며 행복하게 지내고 있습니다~^^ 
				집을 처음 짓고 바로 에어비앤비를 통해 소개하게 되어 진심으로 기쁘고, 앞으로도 더욱 많은 분들께 행복한 시간을 선물해드리도록 언제나 노력하겠습니다! 
				저희는 다양한 게스트 분들과의 만남을 좋아합니다.
				어디에서 오시든 저희 집을 편안하게 이용하셨으면 좋겠어요! 
				문의사항 있으시면 언제든 연락주세요^^ 
				감사합니다.
				스테이하우스 호스트 올림
				</p>
				</div>
			</div>
		</div>
	</div>

	<div class="large-4 columns hhh">
		<div class="portfolio-resume-wrapper">
			<div class="portfolio-resume-spacing" >
				<h5>
					<strong>숙박 중 게스트와의 교류</strong>
				</h5>
				<p>저희 스테이 하우스를 찾아주시는 에어비앤비 게스트 분들이 편안한 시간을 보내실 수 있도록 하겠습니다.^^</p>
			</div>
			<div class="portfolio-resume-spacing" >
				<h5>
					<strong>(이름)님은 슈퍼호스트입니다.</strong>
				</h5>
				<p>슈퍼호스트는 풍부한 경험과 높은 평점을 자랑하며 게스트가 숙소에서 편안히 머무를 수 있도록 최선을 다하는
					호스트입니다.</p>
			</div>
			<button type="button" class="btn btn-info">메시지 보내기</button>
		</div>
	</div>
</div>


