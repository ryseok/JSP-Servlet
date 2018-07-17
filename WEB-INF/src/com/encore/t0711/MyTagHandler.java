package com.encore.t0711;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyTagHandler extends TagSupport{
	//태그를 만났을때 실행할 코드 기술
	
	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out =  pageContext.getOut();//브라우저 출력 객체
			for(int i=0; i<10; i++) {
				if(i%2==0) {
					out.print("<font color=blue>안녕 커스텀태그");
				}else {
					out.print("<font color=red>안녕 커스텀태그");
				}
				out.print("<br>");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SKIP_BODY; //엘리먼트의 본문이 없는 경우 ===> 내용없음 ===> 빈태그
	}
}
