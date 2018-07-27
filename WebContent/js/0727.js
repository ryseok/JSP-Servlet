function load() {//요청
	sendRequest('response1.jsp', '', loaded, 'GET');
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
//================================================================
function load2() {

	console.log('document.username=' + document.username);

	var username = document.getElementById('username');
	console.log('username.value=' + username.value);

	var param = 'username=' + username.value;//'username=홍길동';
	sendRequest('response2.jsp', param, loaded2, 'POST');
}
function loaded2() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;
		var d1 = document.getElementById('d1');
		d1.innerHTML = str;
	}
}
//================================================================	
function load3() {
	var username = document.getElementById('username');
	var param = 'username=' + username.value;
	sendRequest('response3.jsp', param, loaded3, 'POST');
}

function loaded3() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;
		var d1 = document.getElementById('d1');
		//d1.innerHTML = str;
		d1.innerText = str;
	}
}
//================================================================
function load4() {
	sendRequest('response4.jsp', null, loaded4);
}

function loaded4() {//XML데이터중 '책제목'데이터를 얻어서 번호순으로 출력!!
	if (xhr.readyState == 4 && xhr.status == 200) {
		var doc = xhr.responseXML;//doc자료형: Document

		//루트엘리먼트얻어오는 테스트
		var root = doc.documentElement; //root자료형: Element
		console.log('root태그명: ' + root.tagName);

		//Element doc.getElementById("아이디명");
		//NodeList doc.getElementsByTagName("태그명");

		//책제목 얻어오기
		var titleList = doc.getElementsByTagName('title');
		//titleList자료형: NodeList  ---> index, length, item(index)

		var htmlTxt = '<ol>';
		for (var i = 0; i < titleList.length; i++) {
			var title = titleList.item(i);//title자료형: ElementNode
			htmlTxt += '<li>' + title.textContent + '</li>'; //textContent: 엘리먼트안의 내용
		}
		htmlTxt += '</ol>';
		//<ol><li>AjaxProgramming</li><li>jQueryLibrary</li></ol>

		var d1 = document.getElementById('d1');
		d1.innerHTML = htmlTxt;

	}
}
//================================================================
function load5() {
	sendRequest('response5.jsp', null, loaded5);
}

function loaded5() { //이름,나이,직업 정보를 화면에 출력
	if(xhr.readyState == 4 && xhr.status == 200){
		var str = xhr.responseText; //str 자료형은 String ===>{name:'길동'}
		//console.log("str=" + str);
		//console.log("str.name=" + str.name); //str.name=undefined 이유는JSON이 아닌 String 이기 때문에
		
		var person = eval("("+xhr.responseText+")"); //eval()함수는 특정한 형식을 갖는 텍스트를 JS Object로 변환
		var htmlTxt = "이름 : " + person.name + "<br>나이 : "+person.age+"<br>직업 : "+person.job;
		
		var d1 = document.getElementById('d1');
		d1.innerHTML = htmlTxt;
	}
}
//================================================================
//제일 많이 사용한다 ~ 무한반복 각!!!
function load6() {
	sendRequest('response6.jsp', null, loaded6);
}

function loaded6() {
	if(xhr.readyState == 4 && xhr.status == 200){
		var books = eval(xhr.responseText); //books 자료형은 Array
		console.log('책 갯수: '+ books.length);
		
		var htmlTxt = '<ol>';
		for(var i=0; i<books.length; i++){
			htmlTxt += "<li>"+books[i].title+"</li>"
		}
		htmlTxt += '</ol>';
		
		var d1 = document.getElementById('d1');
		d1.innerHTML = htmlTxt;
	}
}
//================================================================
function load7Ver1() { //스스로 해결함
	sendRequest('response7_ver1.jsp', null, loaded7Ver1);
}

function loaded7Ver1() { //스스로 해결함
	if(xhr.readyState == 4 && xhr.status == 200){
		var str = xhr.responseText;
		var d1 = document.getElementById('d1');
		d1.innerHTML = str;
	}
}
//================================================================
function load7Ver2(){
	sendRequest('response7_ver2.jsp', '', loaded7Ver2, 'GET')
}
function loaded7Ver2(){
   if(xhr.readyState==4 && xhr.status==200){
	  var str = xhr.responseText;//"SMITH,ALLEN,WARD,JONES,MARTIN"
	  var arr = str.split(",");//["SMITH","ALLEN","WARD"]
	  
	  var htmlTxt="<font color=green><ul>";
	  for(var i=0; i<arr.length; i++){
		  htmlTxt += '<li>'+arr[i]+'</li>';
	  }
	  htmlTxt +="</ul></font>";
	  
	  var d1 = document.getElementById('d1');
	  d1.innerHTML = htmlTxt;
   }	
}
//================================================================
function load7Ver3(){
	sendRequest('response7_ver3.jsp', '', loaded7Ver3, 'GET')
}
function loaded7Ver3(){
   if(xhr.readyState==4 && xhr.status==200){
	  var arr = eval(xhr.responseText);//"['SMITH','ALLEN','WARD','JONES','MARTIN']"
	  
	  console.log('사원수:'+ arr.length);
	  
	  var htmlTxt="<font color=blue><ul>";
	  for(var i=0; i<arr.length; i++){
		  htmlTxt += '<li>'+arr[i]+'</li>';
	  }
	  htmlTxt +="</ul></font>";
	  
	  var d1 = document.getElementById('d1');
	  d1.innerHTML = htmlTxt;
   }
}
//================================================================
function load7Ver4(){
	sendRequest('response7_ver4.jsp', '', loaded7Ver4, 'GET')
}
function loaded7Ver4(){
   if(xhr.readyState==4 && xhr.status==200){
	  var str = xhr.responseText;
	  
	  var d1 = document.getElementById('d1');
	  d1.innerHTML = str;
   }	
}
//================================================================
function load8(){
	var deptno = document.getElementById('deptno').value;
	                      //  <input value="10">
	var param = 'deptno='+deptno ;//'deptno=10';
	sendRequest('response8.do',param, loaded8, 'POST')
}

function loaded8(){
   if(xhr.readyState==4 && xhr.status==200){
	  var str = xhr.responseText;
	  
	  var deptno = document.getElementById('deptno').value;

	  var d1 = document.getElementById('d1');
	  d1.innerHTML = str;
   }	
}