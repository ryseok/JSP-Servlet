$(document).ready(function() {
	var object = {name:"나영석"};
	$.extend(object,{
		region : "서울시 서초구",
		part : "메인 기타"
		
	});
	
	var output="";
	$.each(object,function(key,item){
		output += key + ":" + item + "\n";
	});
	
	alert(output);
});