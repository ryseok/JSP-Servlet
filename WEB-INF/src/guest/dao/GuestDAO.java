package guest.dao;

import java.sql.SQLException;
import java.util.List;

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
			Object ob = smc.insert("guest.insert",guest);
			//ob ---> null (ob사용 용도 없음)
		    return true;	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insert
	
	public List<Guest> selectAll() {
		List<Guest> list=null;
		 try {
			list = smc.queryForList("guest.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll
	
//	public boolean 또는 String update(빈즈) {}
//	public boolean 또는 String delete(프라이머리키) {}
//	public 빈즈 select(프라이머리키) {}
	
	
   /*public boolean 또는 String insert(빈즈) {}
   public boolean 또는 String update(빈즈) {}
   public boolean 또는 String delete(프라이머리키) {}
   public 빈즈 select(프라이머리키) {}//수정폼
   public ArrayList<빈즈> selectAll() {}*/
}
