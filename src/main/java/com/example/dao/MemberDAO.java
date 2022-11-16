package com.example.dao;

import com.example.bean.MemberVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String M_INSERT =  "insert into member (userid, username, password, email, blogurl, photo, detail)" + " values (?,?,sha1(?),?,?,?,?)";
	private final String M_UPDATE = "update member set userid=?, username=?, password=?, email=?, blogurl=?, photo=?, detail=?" + " where sid=?";
	private final String M_DELETE = "delete from member  where sid=?";
	private final String M_SELECT = "select * from member  where sid=?";
	private final String M_LIST = "select * from member order by regdate desc";

	public int insertMember(MemberVO vo) {
		int result = 0;
		conn = JDBCUtil.getConnection();
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			stmt = conn.prepareStatement(M_INSERT);
			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getUsername());
			stmt.setString(3, vo.getPassword());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getBlogurl());
			stmt.setString(6, vo.getPhoto());
			stmt.setString(7, vo.getDetail());
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 글 삭제
	public void deleteMember(MemberVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_DELETE);
			stmt.setInt(1, vo.getSid());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int updateMember(MemberVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_UPDATE);
			stmt.setString(1, vo.getUsername());
			stmt.setString(2, vo.getEmail());
			stmt.setString(3, vo.getPhoto());
			stmt.setString(4, vo.getDetail());

			System.out.println(vo.getUsername() + "-" + vo.getEmail() + "-" + vo.getPhoto() + "-" + vo.getDetail());
			stmt.executeUpdate();
			return 1;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public MemberVO getOne(int sid) {
		MemberVO one = new MemberVO();
		conn = JDBCUtil.getConnection();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			stmt = conn.prepareStatement(M_SELECT);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setPassword(rs.getString("password"));
				one.setEmail(rs.getString("email"));
				one.setBlogurl(rs.getString("blogurl"));
				one.setPhoto(rs.getString("photo"));
				one.setDetail(rs.getString("detail"));
				one.setRegdate((rs.getDate("regdate")));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return one;
	}

	public List<MemberVO> getList(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		conn = JDBCUtil.getConnection();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			stmt = conn.prepareStatement(M_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberVO one = new MemberVO();
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setPassword(rs.getString("password"));
				one.setEmail(rs.getString("email"));
				one.setBlogurl(rs.getString("blogurl"));
				one.setPhoto(rs.getString("photo"));
				one.setDetail(rs.getString("detail"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}