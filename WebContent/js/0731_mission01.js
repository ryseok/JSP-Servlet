function requestSido() { //시도 정보 요청
	sendRequest("addr_result.jsp", null, resultSido);
}

function resultSido() { //시도 정보 응답
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;
		var sido = document.getElementById('sido');
		sido.innerHTML = str;
	}
}

function requestGugun() {// 구군정보 요청
	// alert('requestGugun()'); //호출 되는지 Test
	var sido = document.getElementById("sido").value;
	if (sido == "0") {
		var noOption = '<option value="0">==선택==</option>';
		document.getElementById('gugun').innerHTML = noOption;
		document.getElementById('dong').innerHTML = noOption;
	} else {
		sendRequest("addr_result.jsp", "action=gugun&sido=" + sido,
				resultGugun, "POST");
	}
}

function resultGugun(){//구군정보 응답 콜백
	if(xhr.readyState==4 && xhr.status==200){
		var str = xhr.responseText;
		var gugun = document.getElementById("gugun");
		gugun.innerHTML = str;
	}
	
}

function requestDong(){//'동'정보 요청
    var sido=document.getElementById('sido').value;
    var gugun=document.getElementById('gugun').value;
    var param='action=dong&sido='+sido+'&gugun='+gugun;
    if (sido == "0") {
		var noOption = '<option value="0">==선택==</option>';
		document.getElementById('dong').innerHTML = noOption;
	} else {
		sendRequest('addr_result.jsp', param, resultDong, 'POST');	

	}
 }

function resultDong(){//동정보 응답 콜백
	if(xhr.readyState==4 && xhr.status==200){
		var str = xhr.responseText;
		var dong = document.getElementById("dong");
		dong.innerHTML = str;
	}
	
}


window.onload = function() {
	/*
	 ===Test===
	 var htmlStr="<option>${sido}</option><option>라임</option>";
	 var sido = document.getElementById("sido");
	 sido.innerHTML=htmlStr;
	 */

	requestSido();
}