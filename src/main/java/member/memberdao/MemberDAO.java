package member.memberdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.memberdto.MemberDTO;

public class MemberDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private static DataSource ds;
	private static MemberDAO instance;
	
	
	//singleton 패턴
	// - 프로그램상에서 객체를 단 하나만 만들수 있도록 만드는 패턴.
	
	private MemberDAO() {
		
	}
	
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	
	static {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	public MemberDTO checkLogin(MemberDTO dto) {
		String sql = "select * from member where id = ? and password = ?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPassword());
			rs = ps.executeQuery();
			dto = makeDTO(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	private MemberDTO makeDTO(ResultSet rs) {
		MemberDTO dto = null;
		try {
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	public boolean insert(MemberDTO dto) {
		boolean check = false;
		
		String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPassword());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getTel1());
			ps.setString(6, dto.getTel2());
			ps.setString(7, dto.getTel3());
			if(ps.executeUpdate() != 0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return check;
	}
	
	public boolean updateMember(MemberDTO dto) {
		String sql = "update member set email = ?,tel1 = ?,tel2 = ?,tel3 = ? where no = ?";
		boolean check = false;
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getEmail());
			ps.setString(2, dto.getTel1());
			ps.setString(3, dto.getTel2());
			ps.setString(4, dto.getTel3());
			ps.setInt(5, dto.getNo());
			if(ps.executeUpdate() != 0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return check;
	}
	
	public boolean deleteMember(int no) {
		String sql = "delete member where no = ?";
		boolean check = false;
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			if(ps.executeUpdate() != 0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return check;
		
	}
}






















