Member = function(name,id,securityNo) {
	//클래스 속성정의 : this.
	this.name = name;
	this.id = id;
	this.securityNo = securityNo;
}

//클래스에 메소드 정의 : prototype
Member.prototype.setValue = function(name,id,securityNo) {
	//클래스 속성정의
	this.name = name;
	this.id = id;
	this.securityNo = securityNo;
}

Member.prototype.getAge = function() {
	var birthYear; //1993
		birthYear = parseInt(this.securityNo.substr(0, 2)); //"93"===>93 변경
	
	var code; //1
		code = this.securityNo.charAt(7);
	
	birthYear = (code < "3") ? 1900+birthYear : 2000+birthYear;
	
	var year = new Date().getFullYear();
	
	return year-birthYear+1;
}

Member.prototype.toString=function(){ //toString 함수로 정의
	return "이름===>" + this.name + ", 아이디 ===>" + this.id;
}