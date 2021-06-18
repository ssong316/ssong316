
<script type="text/javascript">
	$(function(){
			$('#bt_createAccount').click(function(){
				chk_void();
				confirm_pwd();
			});
			
			$('#address').click(function(){
				$('#staticBackdrop').modal('show');
			});
			
			var address;
			$('#bt_address').click(function(){
				address = $('#address1').val()+ $('#address2').val();
				$('#address').val(address);
				$('#staticBackdrop').modal('hide');
			});
	});
	
	function chk_void(){
		$('#info input').each(function(idx, item){
			var pwd = $('#pwd').val();
			var pwdc = $('#pwd_chk').val();
			if($(this).val().length<1){
				$(this).prev().show();
				event.preventDefault();
				$(item).focus();
				return false;
			}else{
				$(this).prev().hide();
			}
		});
	}
	
	function invalid_id(){
		
	}
	
	function confirm_pwd(){
		var pwd = $('#pwd').val();
		var pwdc = $('#pwd_chk').val();
		if(pwd!=pwdc){
			$('#pwd_chk').prev().text("비밀번호를 다시 확인하세요");
			$('#pwd_chk').prev().show();
			event.preventDefault();
			$('#pwd_chk').focus();
			return false;
		}
	}
	
	function invalid_pn(){
		
	}
</script>
				<form name="frmReg" action="register_ok.jsp">
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
               		<div class="row align-items-center" >
               			<input type="submit" class="btn btn-primary" id="bt_createAccount" value="<%=t_login?"Save Change":"Create Account"%>" style="font-weight:bold">
               		</div>
               	</form>
               	
               	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
		<form name="frmLogin" method="post" action="login/login_ok.jsp">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="id" class="font-weight-bold text-black">ID</label>
						<div class="field-icon-wrap">
							<input type="text" class="form-control" name="id" id="id">
							<span></span>
						</div>
						<div>
							&nbsp<span><input type="checkbox" class="text-black" name="rem_id" id="rem_id" value="remember me"></span>
							&nbsp<span>remember me</span>
						</div>
					</div>
					<br>
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="pwd" class="font-weight-bold text-black">PASSWORD</label>
						<div class="field-icon-wrap">
							<input type="password" class="form-control" name="pwd" id="pwd">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn" name="register" onclick="acc/register.jsp" value="Create Account">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<input type="submit" class="btn btn-primary" id="bt_login" value="Login">
				</div>
			</div>
			
		</form>
		</div>
		
	</div>
               	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true" >
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Address</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="zipcode" class="font-weight-bold text-black">우편번호 입력</label>
						<div class="field-icon-wrap">
							<span><input type="text" class="form-control" name="zipcode" id="zipcode"><input type="button" class="test" name="test" value="test"></span>
							
							<input type="button" class="btn btn-secondary" name="btSearch" value="search">
							<span></span>
						</div>
					</div>
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<div class="field-icon-wrap">
							<input type="text" class="form-control" name="address1" id="address1" readonly>
						</div>
					</div>
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="address2" class="font-weight-bold text-black">상세 주소 입력</label>
						<div class="field-icon-wrap">
							<input type="text" class="form-control" name="address2" id="address2">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-primary" id="bt_address" value="확인">
				</div>
			</div>
		</div>
	</div>