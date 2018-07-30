//0727 복습
function load() {//요청
	sendRequest('/struts/review/JSP/review_response1.jsp', '', loaded, 'GET');
}
function loaded() {//콜백: 데이터얻기, 데이터요청후 할 일을 정의
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;//str: String ===>"Hello,Ajax~!!"

		var arr = str.split(',');//arr: String[]===> ["Hello","Ajax~!!"]

		var html = '<ul>'
		for (var i = 0; i < arr.length; i++) {
			html += '<li>' + arr[i] + '</li>';
		}
		html += '</ul>';

		var d1 = document.getElementById('d1');//d1: Element
		d1.innerHTML = str;//서버가 전달한 데이터를 그대로 출력
		d1.innerHTML = html;//서버가 전달한 데이터를 JS내에서 가공해서 출력
	}
}