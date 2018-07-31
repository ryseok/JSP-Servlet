var checkFirst = false;
var loopSendKeyword = false;

function startSuggest() {
	// 키보드 입력 할때 ===> checkFirst가 true
	// 연관 검색어 나옴
	if (!checkFirst) {
		setTimeout("sendKeyword()", 100);
		loopSendKeyword = true;
	}
	checkFirst = true;
}

function sendKeyword() {
	// (suggest.jsp)페이지 요청: 폼에 입력된 '키워드'를 서버에 전달, 순환구조
	if (!loopSendKeyword)
		return;

	var keyword = document.searchForm.keyword.value;
	var param = 'keyword=' + keyword;

	if (keyword != '') {
		// sendRequest('suggest.jsp', param, displayResult, 'POST');
		sendRequest('/struts/review/JSP/re_suggest2.jsp', param, displayResult,
				'POST');
	}// 입력된 문자가 최소 1개 이상일때
	else {
		hide('suggest');
	}

	setTimeout('sendKeyword()', 100);
}// sendKeywords

function displayResult() {// 콜백함수: 서버가 전달한 데이터 얻기
	if (xhr.readyState == 4) {// 서버가 전달한 데이터를 완전하게 얻었을때
		if (xhr.status == 200) {// 서버의 상태가 정상OK였을때
			var str = xhr.responseText;// "3|ajax,apple,apt"
			var result = str.split("|"); // ["3"|"ajax,apple,apt"]
			var count = parseInt(result[0]);// 3 <== parseInt("3");

			if (count > 0) {// 연관 제시어가 1개 이상일때
				var keywordList = result[1].split(',');// ["ajax","apple","apt"]

				// "ajax<br>apple<br>apt<br>"
				var htmlTxt = '';
				for (var i = 0; i < keywordList.length; i++) {
					htmlTxt += "<a href=\"javascript:select('" + keywordList[i]
							+ "')\">" + keywordList[i] + "</a><br>";
				}
				var suggestList = document.getElementById('suggestList');// 안쪽div
				suggestList.innerHTML = htmlTxt;
				show("suggest");
			}

		} else {
			alert('서버에러:' + xhr.status);
		}

	}
}// displayResult
function show(elementId) {
	var ele = document.getElementById(elementId);
	if (ele)// id에 해당하는 엘리먼트가 존재한다면
		ele.style.display = '';
}
function hide(elementId) {
	var ele = document.getElementById(elementId);
	if (ele)
		ele.style.display = 'none';
}

function select(selectedKeyword) {// 나열된 제시어 중 선택된 단어를 <input type="text"
									// name="keyword"> 전달
	document.searchForm.keyword.value = selectedKeyword;
	checkFirst = false;
	loopSendKeyword = false; // 제시어 기능이 일단락 되었음

	hide("suggest");
}

function searchInfo() {
	// 사원정보 검색
	var ename = document.searchForm.keyword.value;
	sendRequest("/struts/review/JSP/re_empInfo.jsp",
				"searchEname=" + ename,
				searchResult, "POST");
}

function searchResult() {
	// 사원정보 검색결과 출력
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;
		document.getElementById("employeeInfo");
		employeeInfo.innerHTML = str;
	}
}
