package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MemberDTO;

public class MemberDAO extends JdbcDAO {
	private static MemberDAO _dao;

	public MemberDAO() {
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new MemberDAO();
	}

	public static MemberDAO getDAO() {
		return _dao;
	}

	public int insertMember(MemberDTO member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into Member(email, password, name, phone, grade, member_since)"
					+ " values(?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getGrade());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Member 테이블 insert 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// 회원이 관리할 수 있는 정보
	public int updateMember(MemberDTO member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update Member set password = ?, name = ?, address_id = ?"
					+ ", phone = ?" + " where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getAddress_id());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Member 테이블 update 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	// 관리자가 관리할 수 있는 정보
	public int updateAdmin(MemberDTO member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update Member set grade = ?, total_pay = ?, status = ? where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getGrade());
			pstmt.setInt(2, member.getTotal_pay());
			pstmt.setString(3, member.getStatus());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Member 테이블 updateAdmin 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int resetPassword(MemberDTO member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update Member set password = 'f95e7734ff99f7bd28dc7d36f533e23d828715e1418d6ddf663e02bb736c7' where email = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Member 테이블 resetPassword 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		
		return rows;
	}

	public int deleteMember(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update member set status = '0' where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Member 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// select email
	public MemberDTO selectMember(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;
		try {
			con = getConnection();

			String sql = "select * from Member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberDTO();
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setAddress_id(rs.getString("address_id"));
				member.setPhone(rs.getString("phone"));
				member.setGrade(rs.getString("grade"));
				member.setMember_since(rs.getString("member_since"));
				member.setTotal_pay(rs.getInt("total_pay"));
				member.setStatus(rs.getString("status"));
			}
		} catch (SQLException e) {
			System.out.println("Member 테이블 select 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	// return email
	public MemberDTO returnEmail(String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;
		try {
			con = getConnection();

			String sql = "select * from Member where phone = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberDTO();
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setAddress_id(rs.getString("address_id"));
				member.setPhone(rs.getString("phone"));
				member.setGrade(rs.getString("grade"));
				member.setMember_since(rs.getString("member_since"));
				member.setTotal_pay(rs.getInt("total_pay"));
				member.setStatus(rs.getString("status"));
			}
		} catch (SQLException e) {
			System.out.println("Member 테이블 returnEmail 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	// search	
	public List<MemberDTO> searchMemberList(String data, String type) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			con = getConnection();
			
			String sql = "select * from Member where ?";
			sql += " like '%'||?||'%' ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, data);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO member = new MemberDTO();
				member = new MemberDTO();
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("img_source"));
				member.setAddress_id(rs.getString("address_id"));
				member.setPhone(rs.getString("phone"));
				member.setGrade(rs.getString("grade"));
				member.setMember_since(rs.getString("member_since"));
				member.setTotal_pay(rs.getInt("total_pay"));
				member.setStatus(rs.getString("status"));
				list.add(member);
			}
		} catch (SQLException e) {
			System.out.println("Member 테이블 searchList 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}

	// select *
	public List<MemberDTO> selectAllMemberList(String orderBy) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			con = getConnection();

			String sql = "select * from Member order by ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderBy);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setAddress_id(rs.getString("address_id"));
				member.setPhone(rs.getString("phone"));
				member.setGrade(rs.getString("grade"));
				member.setMember_since(rs.getString("member_since"));
				member.setTotal_pay(rs.getInt("total_pay"));
				member.setStatus(rs.getString("status"));
				list.add(member);
			}
		} catch (SQLException e) {
			System.out.println("Member 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}
