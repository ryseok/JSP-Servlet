package guest.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import guest.vo.Guest;
import iba.MySqlMapClient;

public class GuestDAO {

	SqlMapClient smc;

	public GuestDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	// no, writer, email, tel, pass, contents, wdate
	public boolean insert(Guest guest) {
		try {
			Object ob = smc.insert("guest.insert", guest);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// insert

	public List<Guest> selectAll() {
		List<Guest> list = null;
		try {
			list = smc.queryForList("guest.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// selectAll

	public Guest select(int no) {
		Guest guest = null;
		try {
			guest = (Guest) smc.queryForObject("guest.select", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return guest;
	}// select

	public boolean update(Guest guest) {
		try {
			int t = smc.update("guest.update", guest);
			// t: 수정된 행의 갯수
			System.out.println("수정된 행 갯수T: " + t);
			if (t == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// update

	public boolean delete(int no) {
		   try {
			int t=smc.delete("guest.delete",no);
			   if(t==1) {
				   return true;
			   }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   return false;
	}
//	public boolean 또는 String delete(프라이머리키) {}

	
	
   /*public boolean 또는 String insert(빈즈) {}
   public boolean 또는 String update(빈즈) {}
   public boolean 또는 String delete(프라이머리키) {}
   public 빈즈 select(프라이머리키) {}//수정폼
   public ArrayList<빈즈> selectAll() {}*/
}
