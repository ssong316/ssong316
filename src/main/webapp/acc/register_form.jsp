<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<section class="py-5 bg-light">
      <div class="container">
         <div class="row align-items-center" >
            <div
               class="col-md-12 col-lg-7 mx-auto order-lg-2 position-relative mb-5"
               data-aos="fade-up" style="padding-top:100px;">
               <form name="frmReg" action="<%=t_login?"edit_ok.jsp":"register_ok.jsp" %>">
               		<div id="info">
	               		<div class="row">
	               			<label for="id" class="font-weight-bold text-black">아이디&nbsp</label><span class="warn">아이디를 입력하세요</span>
	               			<input type="text" id="id" class="form-control" name="id" value="<%=t_login?t_id:""%>">
	               			<br>
	               			<br>
	               			<label for="pwd" class="font-weight-bold text-black">비밀번호&nbsp</label><span class="warn">비밀번호를 입력하세요</span>
	               			<input type="password" id="pwd" class="form-control" name="pwd">
	               			<br>
	               			<br>
	               			<label for="password_chk" class="font-weight-bold text-black">비밀번호 확인&nbsp</label><span class="warn">비밀번호를 한번 더 입력하세요</span>
	               			<input type="password" id="pwd_chk" class="form-control" name="pwd_chk">
	               			<br>
	               			<br>
	               			<label for="name" class="font-weight-bold text-black">이름&nbsp</label><span class="warn">이름을 입력하세요</span>
	               			<input type="text" id="name" class="form-control" name="name" value="<%=t_login?t_vo.getName():""%>">
		               		<br>
		               		<br>
		               		<label for="age" class="font-weight-bold text-black">나이&nbsp</label><span class="warn">나이를 입력하세요</span>
		               		<input type="text" id="age" class="form-control" name="age" value="어떻게 할지 고민중" value="<%=t_login?t_vo.getAge():""%>">
		               		<br>
		               		<br>
	               			<label for="address" class="font-weight-bold text-black">주소&nbsp</label><span class="warn">주소를 입력하세요</span>
	               			<input type="text" id="address" class="form-control" name="address" ReadOnly value="asdf" value="<%=t_login?t_vo.getAddress():""%>">
	               			<br>
	               			<br>
	               			<label for="email" class="font-weight-bold text-black">이메일&nbsp</label><span class="warn">이메일을 입력하세요</span>
	               			<input type="text" id="email" class="form-control" name="email" value="<%=t_login?t_vo.getEmail():""%>">
	               			<br>
	               			<br>
	               			<label for="pn" class="font-weight-bold text-black">전화번호&nbsp</label><span class="warn">전화번호를 입력하세요</span>
	               			<input type="text" id="pn" class="form-control" name="pn" value="<%=t_login?t_vo.getPn():""%>">
	               		</div>
               		</div>
               		<hr>
               		<div class="`">
               			<input type="submit" class="btn btn-primary" id="bt_createAccount" value="<%=t_login?"Save Change":"Create Account"%>" style="font-weight:bold">
               		</div>
               	</form>
            </div>
         </div>
      </div>
   </section>
