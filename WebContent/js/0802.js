function addReply() {//등록 요청
	//★포인트:  new Request(요청URL, 전달Param);
	//params ==> name=홍길동&content=댓글내용

	var name = document.addForm.name.value;
	var content = document.addForm.content.value;

	var params = 'name=' + name + '&content=' + content;

	new ajax.xhr.Request('/struts/reply.do?action=insert', params, addResult,
			'POST');
	//reply.jsp   -----> request.getParameter("name");
	//reply.do == ReplyAction -----> request.getParameter("name");

}//addReply

function addResult(xhr) {//등록요청에 대한 콜백
	if (xhr.readyState == 4 && xhr.status == 200) {
		//★포인트: var str = xhr.responseText;
		var str = xhr.responseText;
		str = str.replace(/(^\s+)|(\s+$)/g, '')//앞뒤의 공백제거
		alert(str);
		loadReplyList();
	}
}//addResult

//댓글 목록 작업: loadReplyList, loadReplyResult
function loadReplyList() {//댓글 목록 요청
	new ajax.xhr.Request('/struts/reply.do?action=list', null, loadReplyResult);
}//loadReplyList

function loadReplyResult(xhr) {//콜백: 목록  출력
	if (xhr.readyState == 4 && xhr.status == 200) {
		//alert(xhr.responseText);
		var list = eval(xhr.responseText); //list자료형? Array[{},{},{}]

		//리스트가 출력될 부모div얻기
		var replyList = document.getElementById('replyList');

		//메모리로 부터 이전에 출력된 목록 삭제!!
		/* while(replyList.hasChildNodes()){//자식이 있다면 true리턴
		  replyList.removeChild(replyList.lastChild);
		} */

		hideUpdateForm();
		replyList.innerHTML = ''; //목록 초기화

		for (var i = 0; i < list.length; i++) {
			//한개의 JSON정보를 가지고 <div>태그를 생성
			replyList.appendChild(makeReplyView(list[i]));
		}
	}
}//loadReplyResult

function makeReplyView(reply) {//list에 출력될 새로운 div엘리먼트 생성
	//reply: {no:1, name:'홍길동', content:'Ajax재밌어요!!'}
	var replyDiv = document.createElement("div");//<div></div>
	replyDiv.className = 'reply';//<div class="reply"></div>
	replyDiv.setAttribute("id", "r" + reply.no);
	//<div class="reply" id="r1"></div> 

	replyDiv.reply = reply;//새로 생성된 <div>엘리먼트에 reply JSON객체 저장!!

	var htmlTxt = '<strong>' + reply.name + '</strong><br>' + reply.content
			+ '<br><input type="button" value="수정" onclick="viewUpdateForm('
			+ reply.no + ')"> '
			+ '<input type="button" value="삭제" onclick="removeReply('
			+ reply.no + ')">';

	replyDiv.innerHTML = htmlTxt;
	//<div><strong>길동</strong><br>첫댓글</div>

	return replyDiv;
}//makeReplyView

function viewUpdateForm(no) {//수정폼 보이기
	var upForm = document.getElementById('replyUpdate');//수정폼div
	var replyDiv = document.getElementById('r' + no);//댓글div(목록에 출력되는 div)
	var reply = replyDiv.reply;
	//reply: JSON

	document.upForm.name.value = reply.name;
	document.upForm.content.value = reply.content;
	document.upForm.no.value = reply.no;

	replyDiv.appendChild(upForm);//수정 또는 삭제하는 댓글 바로밑에 '수정폼'을 위치
	upForm.style.display = '';
}//viewUpdateForm

function hideUpdateForm() {//수정폼 숨기기
	//수정폼 이사
	var upForm = document.getElementById('replyUpdate');
	document.documentElement.appendChild(upForm);
	//<html><head/><body/><div id='replyUpdate'/></html>

	upForm.style.display = 'none';
}//hideUpdateForm

//댓글 수정작업: updateReply, updateResult
function updateReply() {//댓글 수정요청
	var name = document.upForm.name.value;
	var content = document.upForm.content.value;
	var no = document.upForm.no.value;

	var params = 'name=' + name + '&content=' + content + "&no=" + no;

	new ajax.xhr.Request('/struts/reply.do?action=update', params, addResult,
			'POST');
}//updateReply

function updateResult(xhr) {//수정요청 콜백
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = trim(xhr.responseText);
		alert(str);
		loadReplyList(); //수정 변경된 내용을 반영하는 목록 요청   
	}
}//updateResult

function trim(str) {
	return str.replace(/(^\s+)|(\s+$)/g, '');
}

function removeReply(no) {
	//var delNo = document.upForm.no.value;
	var params = "no=" + no;
	new ajax.xhr.Request('/struts/reply.do?action=remove', params,
			removeResult, 'POST');
}

function removeResult(xhr) {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText; //JSP 사용 안하고 바로 출력하기!!!
		//var str = trim(xhr.responseText);
		alert(str);
		loadReplyList();
	}
}

window.onload = function() { //HTML페이지를 브라우저에 전부 출력하고(로딩이 끝마쳐진 후)
	loadReplyList();
}