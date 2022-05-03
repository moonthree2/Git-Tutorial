package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.DBConnection;

public class MemberDao {
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","111");
			//DriverManager.getConnection(연결문자열, DB_ID, DB_PW) 으로 Connection 객체를 생성합니다.
			System.out.println("DB 연결 성공");
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DB 연결 실패");
		}
		return conn;
	}
	
	public int joinMember(MemberDto dto) {
		
		int result = 0; //0:회원정보 입력 실패
    	String sql ="insert into member_tb values(member_seq.nextval,?,?,?,?,0,sysdate)";
    	
    	try(Connection conn = getConnection();
    		PreparedStatement pstmt = conn.prepareStatement(sql)){;
	    	pstmt.setString(1,dto.getMember_id());//1:첫번째 ?를 의미함
	    	pstmt.setString(2,dto.getMember_pw());
	    	pstmt.setString(3,dto.getMember_name());
	    	pstmt.setString(4,dto.getPhone_no());
	    	
	    	pstmt.executeUpdate();
	    	result=1;// 1:회원정보 입력 성공
    	}catch(Exception e) {e.printStackTrace();}
    	
    	return result;
	}
	
	public int login(String id, String pw) {
		int result=0; //0: 로그인 실패
		String sql = "select count(*) from member_tb where member_id=? and member_pw=?";
		
		try(Connection conn = getConnection();
		   
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
			
			rs.close();
			   
		}catch(Exception e) {e.printStackTrace();}
		 return result;
	}
	
	public MemberDto getMemberInfo(String id, MemberDto dto) {
		String sql = "select member_id, member_pw, member_name, phone_no from member_tb where member_id=?";
	    
		try(Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
		    pstmt.setString(1, id);
		    ResultSet rs = pstmt.executeQuery();
		    rs.next();
		    
		    dto.setMember_id(rs.getString("member_id"));
		    dto.setMember_pw(rs.getString("member_pw"));
		    dto.setMember_name(rs.getString("member_name"));
		    dto.setPhone_no(rs.getString("phone_no"));
		    rs.close();
		}catch(Exception e) {e.printStackTrace();}		
		return dto;
	}
	
	
	public int updateMemberInfo(MemberDto dto) {

		int result = 0; //0:회원정보 수정 실패
		String sql ="update member_tb set member_id=?, member_pw=?, member_name=?, phone_no=? where member_id=?";
    	
    	try(Connection conn = getConnection();
    		PreparedStatement pstmt = conn.prepareStatement(sql)){
	    	pstmt.setString(1,dto.getMember_id());//1:첫번째 ?를 의미함
	    	pstmt.setString(2,dto.getMember_pw());
	    	pstmt.setString(3,dto.getMember_name());
	    	pstmt.setString(4,dto.getPhone_no());
	    	pstmt.setString(5,dto.getMember_id());
	    	
	    	pstmt.executeUpdate();
	    	result=1;// 1:회원정보 수정 성공
    	}catch(Exception e) {e.printStackTrace();}
    	
    	return result;
	}
	
	public MemberDto updateMember(String id, MemberDto dto) {
		
		String sql = "select member_id, member_pw, member_name, phone_no from member_tb where member_id=?";
		
		try(Connection conn = DBConnection.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql)){
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		dto.setMember_id(rs.getString("member_id"));
	    dto.setMember_pw(rs.getString("member_pw"));
	    dto.setMember_name(rs.getString("member_name"));
	    dto.setPhone_no(rs.getString("phone_no"));
	    rs.close();
    	
		
		}catch(Exception e) {e.printStackTrace();}
		return dto;
	}
}
