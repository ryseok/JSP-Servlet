package com.encore.s0802.dao;

import java.sql.SQLException;
import java.util.List;

import com.encore.s0802.dto.Reply;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class ReplyDAO {
	SqlMapClient sqlMap;

	public ReplyDAO() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}// 생성자

	public boolean create(Reply reply) {// String name,String content) {//댓글입력
		// 리턴추천: boolean(입력성공,실패) 또는 String (성공,실패를 2가지 이상으로 표현)
		try {
			sqlMap.insert("reply.create", reply);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return false;
	}// create

	public boolean modify(Reply reply) {// 특정 댓글 수정
		try {
			int upCnt = sqlMap.update("reply.modify", reply);
			if (upCnt == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// modify

	public boolean remove(int no) {// 특정 댓글 삭제
		int delCnt;
		try {
			delCnt = sqlMap.delete("reply.remove", no);
			if (delCnt == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Reply find(int no) {// 수정폼에 사용될 조회
		return null;
	}

	public List<Reply> findAll() {// 전체 데이터 조회
		List<Reply> list = null;
		try {
			list = sqlMap.queryForList("reply.findAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// findAll

}// ReplyDAO
