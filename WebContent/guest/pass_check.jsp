<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호</title>
<script type="text/javascript">
	function checkpass() {
		//DB 저장된 비번과 아래 폼에 입력된 비번을 비교
		//만약 비번이 일치하지 않는다면 "권한이 없습니다" 라고 알림창 제공
		//만약 비번이 일치 한다면 계속 수정 또는 삭제 작업 진행

		var pass = document.passForm.pass.value;
		var dpass = opener.document.editForm.dpass.value;
		if(dpass == pass){
/* 			alert("수정 완료 되었습니다.");
			window.close(); */
			opener.execUpDel();
		}else{
			alert("권한이 없습니다");
		}
			window.close();
		//alert("현재폼에 입력된 비번:" + pass + "\nDB에 입력된 비번:" + dpass);
	}
</script>
</head>
<body>
	<center>
		<form name="passForm">
			<table cellpadding="5">
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass"></td>
				</tr>

				<tr>
					<td colspan="2" align="center">
					<input type="button" value="확인" onclick="checkpass()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>