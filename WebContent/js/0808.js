function load() {//요청
	$.ajax({
		url : 'response1.jsp',
		success : function(result) {
			//$('li').each();  //li태그 수만큼
			//$.each(배열); //배열의 수만큼

			var ul = $('<ul></ul>');
			//var arr = result.split(',');
			$.each(result.split(','), function(index, value) {
				ul.append($('<li></li>').text(value));//<li>Hello</li>
				//<ul><li>Hello</li></ul>
			});
			$('#d1').html(ul);
		}//success
	});
}
//================================================================
function load2() { //혼자 해결
	$.ajax({
		url : "response2.jsp",
		success : function(result) {
			$('#d1').html(result)
		},
		data:{
			username:$("#username").val()
		}
	});
}
//================================================================	
function load3() { //혼자 해결
	$.ajax({
		url : "response3.jsp",
		success : function(result) {
			$('#d1').html(result)
		},
		data:{
			username:$("#username").val()
		},
	});
}
//================================================================
function load4(){
    $.ajax({
 	        url:'response4.jsp',
 	        success:function(doc){
               //doc: Document객체
               var ol = $('<ol></ol>');
               $(doc).find('title').each(function(idx,titleEle){
             	  //alert($(this).text());
             	  var li = $('<li></li>').text($(this).text());
             	  ol.append(li);
               });
               $('#d1').html(ol);
             }
    //<ol><li>AjaxProgramming</li><li>jQueryLibrary</li></ol>
 	  
             //,dataType:'xml'  생략가능
    });
 }//load4
//================================================================
function load5(){
    $.ajax({
 	        url:'response5.jsp',
 	        success:function(result){
 	        	//응답페이지에서  {"key":"value"}
 	        	//요청페이지에서 dataType:'json'을 하면 
 	        	//result == JSON객체가 자동!!    	        	
 	        	 var htmlTxt = '이름:'+ result.name
		     	            +'<br>나이:'+ result.age
		     	            +'<br>직업:'+result.job;
 	        	$('#d1').html(htmlTxt);
 	        },
 	        dataType:'json'//응답데이터를 {} Object로 받겠음!!
 	        ,
 	        error:function(xhr){
 	        	alert('에러:'+xhr.status);
 	        }
    });//ajax
 }//load5
//================================================================
//제일 많이 사용한다 ~ 무한반복 각!!!
function load6() {
	sendRequest('response6.jsp', null, loaded6);
}

function loaded6() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var books = eval(xhr.responseText); //books 자료형은 Array
		console.log('책 갯수: ' + books.length);

		var htmlTxt = '<ol>';
		for (var i = 0; i < books.length; i++) {
			htmlTxt += "<li>" + books[i].title + "</li>"
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
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;
		var d1 = document.getElementById('d1');
		d1.innerHTML = str;
	}
}
//================================================================
function load7Ver2() {
	sendRequest('response7_ver2.jsp', '', loaded7Ver2, 'GET')
}
function loaded7Ver2() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;//"SMITH,ALLEN,WARD,JONES,MARTIN"
		var arr = str.split(",");//["SMITH","ALLEN","WARD"]

		var htmlTxt = "<font color=green><ul>";
		for (var i = 0; i < arr.length; i++) {
			htmlTxt += '<li>' + arr[i] + '</li>';
		}
		htmlTxt += "</ul></font>";

		var d1 = document.getElementById('d1');
		d1.innerHTML = htmlTxt;
	}
}
//================================================================
function load7Ver3() {
	sendRequest('response7_ver3.jsp', '', loaded7Ver3, 'GET')
}
function loaded7Ver3() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var arr = eval(xhr.responseText);//"['SMITH','ALLEN','WARD','JONES','MARTIN']"

		console.log('사원수:' + arr.length);

		var htmlTxt = "<font color=blue><ul>";
		for (var i = 0; i < arr.length; i++) {
			htmlTxt += '<li>' + arr[i] + '</li>';
		}
		htmlTxt += "</ul></font>";

		var d1 = document.getElementById('d1');
		d1.innerHTML = htmlTxt;
	}
}
//================================================================
function load7Ver4() {
	sendRequest('response7_ver4.jsp', '', loaded7Ver4, 'GET')
}
function loaded7Ver4() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;

		var d1 = document.getElementById('d1');
		d1.innerHTML = str;
	}
}
//================================================================
function load8() {
	var deptno = document.getElementById('deptno').value;
	//  <input value="10">
	var param = 'deptno=' + deptno;//'deptno=10';
	sendRequest('response8.do', param, loaded8, 'POST')
}

function loaded8() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText;

		var deptno = document.getElementById('deptno').value;

		var d1 = document.getElementById('d1');
		d1.innerHTML = str;
	}
}