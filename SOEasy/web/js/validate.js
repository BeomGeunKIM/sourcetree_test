
			

				
				


//아이디 체크 함수
			//아이디 유효성 검사 변수
			var nowId= ""; //중복 체크 후 저장할 아이디	
			var canDuplicateIdCheck; //중복여부를 실행할 만한 조건이 되는지 체크
			var $userId // 유저 아이디
			var checkId = false; //유저아이디 중복 체크 여부
			var getUserId = RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{4,14}$/); // 유저 아이디 유효성 검사
			function checkingId(){
			    checkId = false;
				canDuplicateIdCheck = false;
				$userId = $("#userId").val();
				
				if(!getUserId.test($userId)){
					$('#id-zone p').text("아이디는 영문자로 시작하고, 5~15자 영문자 또는 숫자를 입력해주세요.").css("color","red");
				}
					
				else{
					if(checkId === false || nowId !== $userId){
					
				 	$('#id-zone p').text("중복 체크가 필요합니다").css("color","red");
				 	canDuplicateIdCheck = true;
					}
				}
			}
			//아이디 중복 체크 함수
			function checkSameId(){
				if(canDuplicateIdCheck==false){
					alert("사용 불가능 한 아이디입니다 조건을 다시 확인하세요");
				}else{
					var userId = $('#userId').val();
					$.ajax({
						url : "/login/checkId.me",
						data: {userId: userId},
						success :function(data){
							console.log(data);
							if(data=="success"){
								alert("사용 가능한 아이디입니다!");
								checkId = true;
								nowId = $userId;
								$('#id-zone p').text("중복 체크 완료").css("color","green");
							}else{
								alert("중복된 아이디 입니다");
								
							}
						},
						error : function(data){
							console.log(data);
						}
						
					})

				}
			}
		
//닉네임 유효성 검사 변수
		var nowNick= ""; //중복 체크 후 저장할 닉네임	
		var canDuplicateNickCheck; //중복여부를 실행할 만한 조건이 되는지 체크
		var $nickName; // 유저 닉네임
		var checkNickName = false;//닉네임 중복 체크 했는지 여부
		var getUserNickName = RegExp(/^[a-zA-Z가-힣0-9]{3,8}$/); // 유저 닉네임 유효성 검사
		
		//닉네임 적합도 검사
			function checkingNickName(){
				canDuplicateNickCheck = false;
				checkNickName = false;
				$nickName = $("#nickName").val();
				
				if(!getUserNickName.test($nickName)){
					$('#nickName-zone p').text("3~8자 길이의 영어,한국어,숫자로 입력해주세요.").css("color","red");
				}
					
				else{
					if(checkNickName === false || nowNick !== $nickName){
					
				 	$('#nickName-zone p').text("중복 체크가 필요합니다").css("color","red");
				 	canDuplicateNickCheck = true;
					}
				}
			}
		//닉네임 존재 여부 검사	
			function checkSameNickName(){
				if(canDuplicateNickCheck==false){
					alert("사용 불가능한 닉네임입니다 조건을 다시 확인하세요");
				}else{
					var nickName = $('#nickName').val();
					$.ajax({
						url : "/login/checkNick.me",
						data: {nickName: nickName},
						success :function(data){
							console.log(data);
							if(data=="success"){
								alert("사용 가능한 닉네임입니다!");
								checkNickName = true;
								nowNick = $nickName;
								$('#nickName-zone p').text("중복 체크 완료").css("color","green");
							}else{
								alert("중복된 닉네임 입니다");
								
							}
						},
						error : function(data){
							console.log(data);
						}
						
					})
				/*checkNickName = true;
				alert("사용가능한 닉네임 입니다!");
				nowNickName = $nickName;
				$('#nickName-zone p').text("중복 체크 완료").css("color","green");*/
				}
			
			}
		
//비밀번호 유효성 검사
		var checkpw;
			function checkPwdLength(){
			//비밀번호 유효성 검사 변수들
				var pw = $('#password').val(); //현재 입력 값
				var maxLength = 16; //비밀번호로 가능한 최대 길이
				var length = pw.length; //현재 입력 값의 길이
				var num = pw.search(/[0-9]/g); //숫자 포함여부
				var eng = pw.search(/[a-z]/ig); //영어 포함여부
				var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?`]/gi); //특수문자 포함 여부
				checkpw = false; //비밀번호 유효성 통과 여부
		
				$('#validate1').text("                                               "+(length)+"/"+maxLength+"자");
				if(length<8){
					$('#password-zone p').text("비밀번호 길이가 짧습니다, 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.").css("color","red");
				
				}else if(length>=8 && length<17){
					if(pw.search(/\s/) != -1){
						$('#password-zone p').text("비밀번호에 공백은 포함될 수 없습니다.").css("color","red");
					}else{
						if(num < 0 || eng < 0 || spe < 0){
							$('#password-zone p').text(" 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.").css("color","red");
						}else{
							 	$('#password-zone p').text("유효한 비밀번호 길이입니다.").css("color","green");
							 	checkpw = true;
						}
					}
				
				}else if(length>=17){
					$('#password-zone p').text("길이를 초과했습니다, 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.").css("color","red");
				}
				console.log(checkpw);
			}
		
//비밀번호 확인과 비밀번호 가 일치한지 확인하는 함수
		var checkpw2;
			function checkPwdSame(){
				var pw = $('#password').val(); // 기존 입력한 비밀번호
				var pw2 = $("#password2").val(); //비밀번호 확인에 입력한 비밀번호
				checkpw2 = false //비밀번호 확인 통과 여부
				if(pw === pw2){
					$('#password2-zone p').text("비밀번호가 동일 합니다.").css("color","green");
					checkpw2 = true;
				}else{
					$('#password2-zone p').text("비밀번호가 다릅니다").css("color","red");
				}
			}
//사용자가 입력한 번호로 SMS 를 발송하는 함수		
			function certified(){
				var phoneNum = $('#phoneNum').val();
				var name = $('#name').val();
				console.log(phoneNum);
				console.log(name);
						
					 $.ajax({
							
						url:"/login/certification.me",
						data:{phoneNum:phoneNum,
							  name: name
							 },
						type:"post",
						success: function(data){
							console.log(data);
							if(data == "fail"){
								alert("이미 가입된 이름과 전화번호 입니다. 로그인 페이지로 이동합니다.");
								location.href= "/login/views/member/loginForm.jsp";
							}else if(data =="fail2"){
								alert("이름을 입력해 주세요");
							}
							
							else{
							alert("인증번호가 발송 되었습니다");
							$('#cert').val(data);
							}
						},
						error: function(data){
							console.log("실패!");
						}
					});
				}
	//인증번호와 사용자가 입력한 인증번호가 동일한지 판단하는 함수
			var checkCert = false;
			function certifyCorrect(){
				var userCode = $("#userCode").val();
				var certCode= $('#cert').val();
				//console.log(userCode);
				//console.log(certCode);
				if(userCode == certCode){
					alert("본인인증이 완료되었습니다");
					$('#inputCert p').text("본인인증 완료").css("color","green");
					$('#userCode').prop("readonly",true);
					checkCert = true;
						
				}else{
					alert("본인인증 실패 다시 입력해주세요");
					$('#inputCert p').text("본인인증을 다시 진행해주세요").css("color","red");
							
				}
						
						
			}			

		
//이메일 유효성 검사 변수
			
		var canCertifiedEamil; //이메일 인증을 실행할 만한 조건이 되는지 체크
		var $email; // 유저 이메일
		var checkEmail = false;//이메일 인증 체크 했는지 여부
		var getEmail = RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/); // 유저 이메일 유효성 검사
		//이메일 형식 적합성 검사	
			function checkingEmail(){
			    checkEmail = false;
				canCertifiedEmail = false
				$email = $("#email").val();
				
				if(!getEmail.test($email)){
					$('#email-zone p').text("이메일 형식에 맞게 입력해주세요.").css("color","red");
				}
					
				else{
					if(checkEmail === false){
					
				 	$('#email-zone p').text("이메일 인증이 필요합니다.").css("color","red");
				 	canCertifiedEmail = true;
					}
				}
			}
			//이메일 인증 검사
			function checkCertifiedEmail(){
				if(canCertifiedEmail==false){
					alert("이메일 형식에 맞게 입력해주세요.");
				}else{
					var email = $('#email').val();
					var name = $('#name').val();
					$.ajax({
						url: "/login/eCert.me",
						data: {email : email },
						type: "post",
						success: function(data){
							
							console.log(data);
							if(data != "fail"){
							$('#eCert').val(data);
							alert("인증 코드가 발송되었습니다.");
							}else{
								alert("이미 가입된 적이 있는 이메일 입니다 로그인으로 이동합니다.")
								location.href="/login/views/member/loginForm.jsp";
							}
						},
						error: function(data){
							console.log("이메일 인증 에러")
						}
						
					});
					
			
				}
			
			}
			
			function checkEcert(){
				var userECode = $("#emailCode").val();
				var certEcode= $('#eCert').val();
				//console.log(userCode);
				//console.log(certCode);
				if(userECode == certEcode){
					alert("이메일 인증이 완료되었습니다");
					$('#email-certificate p').text("이메일 인증 완료").css("color","green");
					$('#emailCode').prop("readonly",true);
					$('#email').prop("readonly",true);
					$('#email-zone p').text("이메일 인증 완료").css("color","green");
					checkEmail = true;
						
				}else{
					alert("본인인증 실패 다시 입력해주세요");
					$('#inputCert p').text("본인인증을 다시 진행해주세요").css("color","red");
							
				}
			}
		
//전체 한번 체크 여부
			function checkAll(){
				if(checkId === false){
					alert("아이디를 확인하세요!");
					return;
				}
				
				if(checkNickName === false){
					alert("닉네임을 확인하세요!");
					return;
				}
				
				if(checkpw=== false || checkpw2 === false){
					alert("비밀번호를 확인하세요!");
					return;
				}
				
				if(checkEmail === false){
					alert("이메일을 확인하세요!");
					return;
				}
				
				if(checkCert === false){
					alert("본인인증을 진행하세요!");
					return;
				}
				console.log($('#rule1').is(":checked"));
				if(($('#rule1').is(":checked")===false || $('#rule2').is(":checked")===false)){
					alert("필수 약관에 동의해주세요!");
					return;
				}
				
				$('#joinForm').submit();
					
			}
			
			function checkingInput(){
				console.log(checkpw);
				if(checkpw === true && checkpw2 === true){
					var password = $("#password").val();
					var memNo = $("#memNo").val();
					$.ajax({
						url:"/login/updatePwd.me",
						data: {password : password,
								memNo, memNo},
						type:"post",
						success: function(data){
							console.log(data);
							if(data==1){
								alert("비밀번호 변경에 성공하였습니다! 로그인을 진행해주세요");
								location.href="/login/views/member/loginForm.jsp";
							}else{
								alert("비밀번호 변경에 실패하였습니다 다시 진행해주세요!");
							}
						},
						error: function(data){
							console.log(data);
						}
						
					});
				}else if(typeof checkpw1=="undefined" || typeof checkpw2=="undefined"){
					alert("비밀번호를 입력을 확인하세요!");
					return;
				}
				
				else{
					alert("비밀번호 입력을 확인하세요!");
					return;
				}
				
			}
			function certified2(){
				var phoneNum = $('#phoneNum').val();
				var name = $('#name').val();
				console.log(phoneNum);
				console.log(name);
						
					 $.ajax({
							
						url:"/login/certification.me",
						data:{phoneNum:phoneNum,
							  name: name
							 },
						type:"post",
						success: function(data){
							console.log(data);
							if(data == "fail"){
								alert("등록된 전화번호 입니다 다시 입력해주세요");
								
							}else if(data =="fail2"){
								alert("이름을 입력해 주세요");
							}
							
							else{
							alert("인증번호가 발송 되었습니다");
							$('#cert').val(data);
							}
						},
						error: function(data){
							console.log("실패!");
						}
					});
				}
			
			
			function checkCertifiedEmail2(){
				if(canCertifiedEmail==false){
					alert("이메일 형식에 맞게 입력해주세요.");
				}else{
					var email = $('#email').val();
					var name = $('#name').val();
					$.ajax({
						url: "/login/eCert.me",
						data: {email : email },
						type: "post",
						success: function(data){
							
							console.log(data);
							if(data != "fail"){
							$('#eCert').val(data);
							alert("인증 코드가 발송되었습니다.");
							}else{
								alert("등록된 이메일 입니다 다시 입력해주세요.");
							
							}
						},
						error: function(data){
							console.log("이메일 인증 에러")
						}
						
					});
					
			
				}
			
			}
			
		
		
		
//모두 동의  클릭시 모두 동의 되는 함수
		$(function() { //전체선택 체크박스 클릭 
			$("#rule3").click(function() {
				//만약 전체 선택 체크박스가 체크된상태일경우
				if ($("#rule3").prop("checked")) {
					//해당화면에 전체 checkbox들을 체크해준다
					$("input[type=checkbox]").prop("checked", true);
					// 전체선택 체크박스가 해제된 경우 
				} else {
					//해당화면에 모든 checkbox들의 체크를해제시킨다.
					$("input[type=checkbox]").prop("checked", false);
				}
			})
		});