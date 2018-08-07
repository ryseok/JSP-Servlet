$(function() {//== $(document).ready(){function(){
	//$('input[type=button]')  	 
	//$('[type=button]')  	 
	$(':button').click(function() {
		printData();
	});
});

function printData() {
	var name = $('#uname').val();
	var pass = $('input[name=pass]').val();
	var hide = $("[name=hide]").val();

	//$('[name=fruit]')  ===> 사과,딸기,바나나
	//$('[name=fruit]:checked')  ===> 사과,바나나

	var fruitNames = '';
	//v체크된 체크박스 엘리먼트 얻기
	//each()함수: 얻어온 엘리먼트 수  만큼 반복
	$('[name=fruit]:checked').each(function() {
		//alert($(this).val());
		fruitNames += $(this).val() + ' ';
	});

	var roomName = $('[name=room]:checked').val();

	var menu = $('[name=menu]').val(); //$(':selected').val();
	var memo = $('[name=memo]').val();

	alert("이름▶" + name + "\n비번▶" + pass + "\n히든▶" + hide + "\n좋아하는 과일▶"
			+ fruitNames + "\n강의실▶" + roomName + "\n점심메뉴▶" + menu + "\n메모▶"
			+ memo);
}