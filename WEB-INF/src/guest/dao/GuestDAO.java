package guest.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import guest.vo.Guest;
import iba.MySqlMapClient;

public class GuestDAO {
	
	SqlMapClient smc;//XML내의 sql문 호출하는 객체가 필요!!
	
	public GuestDAO() {
	   smc = MySqlMapClient.getSqlMapInstance();
	}
	
	//no, writer, email, tel, pass, contents, wdate	
	public boolean insert(Guest guest) {
		try {
			//Object ob = smc.insert("guest.insert",guest);
			//ob ---> null (ob사용 용도 없음)
//			String contents = guest.getContents();
//			if(contents==null || contents.length()==0) {
//				smc.insert("guest.insert2",guest);
//			}else {
//				smc.insert("guest.insert1",guest);
//			}
			smc.insert("guest.insert",guest);
		    return true;	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insert
	
	public List<Guest> selectAll() {
		List<Guest> list=null;
		 try {
			 long start = System.currentTimeMillis();
			list = smc.queryForList("guest.selectAll");
			long end = System.currentTimeMillis();
			System.out.println("조회시간: "+ (end - start));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll
	
	public List<Guest> selectPage(Map<String, Integer> map) {
		List<Guest> list=null;
		try {
			long start = System.currentTimeMillis();
			list = smc.queryForList("guest.selectPage",map);
			long end = System.currentTimeMillis();
			System.out.println("조회시간: "+ (end - start));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectPage
	
	public int selectCount() {//전체레코드 수
		Integer totalRecord=0;
		try {
			totalRecord = (Integer) smc.queryForObject("guest.selectCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return totalRecord;
	}//selectCount

	public Guest select(int no) {
	    Guest guest = null;	
		try {
			guest = (Guest) smc.queryForObject("guest.select",no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return guest;
	}//select 
	
	public boolean update(Guest guest) {
		try {
		  int t = smc.update("guest.update", guest);
		  //t: 수정된 행의 갯수
		  System.out.println("수정된 행 갯수T: "+ t);
		  if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  return false;	
	}//update
	
	public boolean delete(int no) {
	   try {
		int t=smc.delete("guest.delete",no);
		   if(t==1)return true;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	   return false;	
	}//delete

	public int selectRecordCount(int pageCount) throws SQLException {
		//pageCount : 한 페이지에 보여질 행의수
		return (Integer)smc.queryForObject("guest.selectRecordCount",pageCount);
	}
	
   /*public boolean 또는 String insert(빈즈) {}
   public boolean 또는 String update(빈즈) {}
   public boolean 또는 String delete(프라이머리키) {}
   public 빈즈 select(프라이머리키) {}//수정폼
   public ArrayList<빈즈> selectAll() {}*/
}
