<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미션4</title>
  <script type="text/javascript" src="/struts/js/jquery-3.3.1.js"></script>
  <script type="text/javascript">
    $(function(){
      $.ajax({url:'/struts/mission4.do',//mission4.do == Mission4Action
    	      data:{
    	    	     delim:'sido'
    	      },
    	      success:function(result){
    	    	$('#sp1').html(result);  
    	      }
      });	
      $('#sp1').change(function(){//시도를 선택(변경)했을때
    	 //alert('시도선택?'+ $(this).val() +","+ $('#sp1 select').val())
    	  $.ajax({url:'/struts/mission4.do',
    		  data:{
 	    	     delim:'gugun',
 	    	     sido: $('#sp1>select').val()
 	          },
    	      success:function(result){
    	    	$('#sp2').html(result);  
    	    	$('#sp3').html("<select><option>==선택==</option></select>");  
    	      }
          });
      });//시도선택
      
      $('#sp2').change(function(){//구군를 선택(변경)했을때
    	  $.ajax({url:'/struts/mission4.do',
    		  data:{
 	    	     delim:'dong',
 	    	     sido: $('#sp1 select').val(),
 	    	     gugun: $('#sp2>select').val()
 	          },
    	      success:function(result){
    	    	$('#sp3').html(result);  
    	      }
          });
      });//구군선택
      
      
      
    });//document ready
  </script>
</head>
<!-- addr.jsp(브라우저 전체화면) -->
<body>
  <h3>jQuery시도구군동 테스트</h3>
  <hr>
  <span id="sp1"><select><option>==선택==</option></select></span>
  <span id="sp2"><select><option>==선택==</option></select></span>
  <span id="sp3"><select><option>==선택==</option></select></span>
  
</body>
</html>


