//member_json.js

//Member2클래스정의
Member2 = function(name,id,securityNo){
	//클래스의 속성정의  :this.속성
	this.name=name;
	this.id=id;
	this.securityNo=securityNo;
}

/*
    클래스명.prototype.a함수 = function(){}
    클래스명.prototype.b함수 = function(){}
    클래스명.prototype.c함수 = function(){}
 
  ===> JSON으로 변환
 
  클래스명.prototype={
                    a함수:function(){},
                    b함수:function(){},
                    c함수:function(){}
                   };
*/

//JSON으로 Member2객체 안에 정의될 여러 함수를 기술할 수 있음.
Member2.prototype={ //함수명:function객체
		          setValue:function(name,id,securityNo){
							this.name=name;
							this.id=id;
							this.securityNo=securityNo;
						   }
                    ,
	                getAge: function(){
	                	//securityNo='930206-1012345'
	                	var birthYear;//1993
	                	    birthYear = parseInt(this.securityNo.substr(0,2));
	                	                //"93" ---> 93
	                	var code;//1
	                	    code= this.securityNo.charAt(7);
	                	birthYear =  (code<'3') ? 1900+birthYear : 2000+birthYear;
	                	
	                	var year = new Date().getFullYear();
	                	
	                	return year-birthYear+1;
	                },
	                toString:function(){//toString()함수 정의
	                	  return "[이름:"+this.name+", 아이디:"+this.id+"]";	
	                }
	             };
