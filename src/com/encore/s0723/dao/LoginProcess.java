package com.encore.s0723.dao;

import java.util.HashMap;
import java.util.Map;

import com.encore.s0723.vo.UserInfo;

public class LoginProcess {
	//데이터 저장소 ===> Map
	private Map<String,UserInfo> userinfos;
	private Map<String,String> userpwds;
	
	public LoginProcess() {
		userinfos = new HashMap<>();
		userpwds = new HashMap<>();
		
		//데이터 저장
		userinfos.put("gildong", new UserInfo("나길동","gildong@gmail.com","010-1234-5678"));	
		userinfos.put("lime", new UserInfo("나라임","lime@gmail.com","010-1234-4321"));	
		userinfos.put("juwon", new UserInfo("너주원","juwon@naver.com","010-0987=1234"));	
		
		userpwds.put("gildong", "123");
		userpwds.put("lime", "1234");
		userpwds.put("juwon", "123");
	}
	
	public UserInfo login(String id, String pass) { //아이디와 비번을 비교
		//비번조회
		String dpass = userpwds.get(id);
		
		if(dpass == null) { //아이디가 존재하지 않는다면
			return null;
		}//if End
		
		if(!dpass.equals(pass)) { //비번이 일치 하지 않는다면
			return null;			
		}//if End
		
		//아이디 존재 하고 비번 일치 경우
		UserInfo user = userinfos.get(id);
		return user;
	}
	
	
	
	
}
