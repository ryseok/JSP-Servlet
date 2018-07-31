function load() { //요청
	//텍스트 필드데이터와 라디오 체크 정보를 현재 HTML로 부터 얻기
	var search = document.getElementById("search").value;
	var keyword = search;
	var kinds = document.getElementsByName("kind"); //kinds의 자료형은 배열
	//console.log("라디오 kind의 갯수===>" + kinds.length);
	//console.log("kinds[0].value===>" + kinds[0].value);
	var kindName; //ename 또는 dname 또는 job
	for(var i=0; i<kinds.length; i++){
		if(kinds[i].checked){
			kindName = kinds[i].value;
			break;
		}
	}
	console.log("선택된 그룹 이름===>" + kindName);
	if(keyword==""){
		alert("입력하세요!!!");
		return;
	}else{
		var params = "keyword=" + keyword + "&kindName=" + kindName;
		sendRequest("search_emp.jsp",params,loadResult,"POST");
	}
	search="";
}

function loadResult() { //출력
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;
		var d1 = document.getElementById('d1');
		d1.innerHTML = str;
	}
}