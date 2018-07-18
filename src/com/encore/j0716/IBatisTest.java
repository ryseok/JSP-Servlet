package com.encore.j0716;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba2.MySqlMapClient;

public class IBatisTest {
	public static void main(String[] args) {
		try {
			//empcopy테이블 생성 (서브쿼리를 통해 )
			
			//1.사원추가
			SqlMapClient smc = MySqlMapClient.getSqlMapInstance();
			//(8000,"gildong",3000,20) 추가 ===> XML파일내에서 데이터 작성
			//smc.insert("insertEmp"); //추가 했으니 주석
			//System.out.println("사원추가 성공");
			
			//(8002,길라임,3000,10) 추가 ===> '길라임'데이터 XML에게 전달
			//smc.insert("insertEmp2","길라임"); //추가 했으니 주석
			
			//(8004,김주원,3000,10) 추가 ===> 모든 데이터를 XML에게 전달
//			Emp emp = new Emp();
//			emp.setEmpno(8004);
//			emp.setEname("김주원");
//			emp.setSal(3000);
//			emp.setDeptno(30);
			//smc.insert("insertEmp3",emp); //추가 했으니 주석
			
			//2.삭제
			//8000번 사번의 사원 삭제
			//int t= smc.delete("delete");
			//System.out.println("삭제된 행의수 : " + t);
			
			//MARTIN사원 삭제
			//문제) MARTIN사원을 삭제 성공하면 ===> #[MARTIN] 사원삭제 
			//문제) MARTIN사원을 삭제 실패하면 ===> #[MARTIN] 사원은 존재 하지 않습니다.
//			String delEname="MARTIN";
//			int t = smc.delete("delete_Emp_MARTIN",delEname);
//			if(t>0) {
//				System.out.println("#["+delEname+"] 사원삭제 ");
//			}else {
//				System.out.println("#["+delEname+"] 사원은 존재 하지 않습니다. ");
//			}
			
			//============미션
			//<insert> 태그 : smc.insert(id);			
			//<delete> 태그 : smc.delete(id);			
			//<update> 태그 : smc.update(id);
			//<select> 태그 : smc.queryForObject(id); 조회결과가 최대 1개행
			//<select> 태그 : smc.queryForList(id); 조회결과가 최대 2개행 이상
			
			//문제1) empcopy테이블에서 30번 부서에 근무하는 사원들을 삭제하는 
		    //    id='delete'를 만드시오
			//smc.delete("emp.delete"); ===> <sqlMap namespace="emp"> 선언 했으면 smc.delete("namespace.id");
//			smc.delete("emp.delete");
//			System.out.println("삭제성공");
			
			//문제2) 7788사번을 갖는 사원의 이름을 조회(emp테이블) 
//			String selectEname = (String) smc.queryForObject("emp.select");
//			System.out.println("조회성공===>"+ selectEname);		
			
			//문제3) 특정 사번을 전달하여 사원명 조회(emp테이블)
//			int searchEmpno=7654;
//			String selectEname2 = (String) smc.queryForObject("emp.select2",searchEmpno);
//			System.out.println("조회성공===>"+ selectEname2);
			
			//문제4) 30번 부서에 근무하는 사원명 조회(emp테이블)
			//queryForList 리턴값 : List
//			List<String> selectEname3 = smc.queryForList("emp.select3");
//			for(int i=0; i<selectEname3.size(); i++) {
//				System.out.println("조회성공===>"+ selectEname3.get(i));
//				
//			}
			
			//문제5) 특정부서에 근무하는 사원의 사원번호, 사원명, 급여, 부서번호를 출력.(emp테이블)
//			int searchDeptno=10;
//			List<Emp> list2 = smc.queryForList("emp.selectEmpInfo",searchDeptno);
//			System.out.println(searchDeptno+"번 부서");
//			for(int i=0; i<list2.size(); i++) {
//				System.out.println("사원명 : " + list2.get(i));
//			}
			
			//문제6)
			//전달데이터는 map으로 전달
			int deptno=30;
			int sal=1500;
			Map<String, Integer> map1 = new HashMap<>();
			map1.put("deptno", deptno);
			map1.put("sal", sal);
			List<Map> list3 = smc.queryForList("emp.selectEmpInfo2",map1);
			for(int i=0; i<list3.size(); i++) {
				Map map2 = list3.get(i);
				System.out.println("사원명 : "+map2.get("ENAME")+
						"\n급여 : "+map2.get("SAL") );
				System.out.println();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
