package guest.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import guest.vo.Guest;
import iba.MySqlMapClient;

public class GuestDAO {
	
	SqlMapClient smc;//XML���� sql�� ȣ���ϴ� ��ü�� �ʿ�!!
	
	public GuestDAO() {
	   smc = MySqlMapClient.getSqlMapInstance();
	}
	
	//no, writer, email, tel, pass, contents, wdate	
	public boolean insert(Guest guest) {
		try {
			Object ob = smc.insert("guest.insert",guest);
			//ob ---> null (ob��� �뵵 ����)
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
	
//	public boolean �Ǵ� String update(����) {}
//	public boolean �Ǵ� String delete(�����̸Ӹ�Ű) {}
//	public ���� select(�����̸Ӹ�Ű) {}
	
	
   /*public boolean �Ǵ� String insert(����) {}
   public boolean �Ǵ� String update(����) {}
   public boolean �Ǵ� String delete(�����̸Ӹ�Ű) {}
   public ���� select(�����̸Ӹ�Ű) {}//������
   public ArrayList<����> selectAll() {}*/
}
