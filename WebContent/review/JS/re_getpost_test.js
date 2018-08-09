$(function() {
	$('#bt3').click(function() {
		//$.ajax({name:value, name:value, ... })
		$.ajax({
			//-----------------[필수]----------------------------------
			url : '/struts/review/JSP/re_getData3.jsp',//요청URL(요청페이지)
			success : function(result) { //function success(result,status,xhr)
				$('div').html(result);
			},//성공시 콜백
			//-----------------[데이터전달]------------------------------

			data : {//서버에 전달할 데이터(전달파라미터)
				id : $('#idUser').val(),
				pass : $('#passUesr').val()
			},
			//-----------------[그밖의 옵션]------------------------------
			type : 'POST',//HTTP요청방식(GET,POST)
			dataType : 'html',//응답데이터 형식(text,html,xml,json)
			//※주의: json은 반드시 명시!!
			error : function(xhr, status, error) {
			}//에러 콜백
		//---------------------------------------------------------
		});//ajax

	});//bt3버튼 클릭

});//document ready