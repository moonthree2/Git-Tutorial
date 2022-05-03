package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ItemDao {
	
	public Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();//톰캣 자체의 Context정보를 얻어오는 부분
		Context envCtx = (Context)initCtx.lookup("java:comp/env");//java:comp/env: Resource정의 Context까지 접근하는 정해진 이름(JNDI)
		DataSource ds = (DataSource)envCtx.lookup("jdbc/OracleDB");//context.xml에 정의한 DataSource객체를 얻어오는 부분
		Connection conn = ds.getConnection();//ConnectionPool에서 Connection객체를 얻어오는 부분
		return conn;
    }
	
	public ItemDto getItem(int idtem_id, ItemDto dto) {
		String sql="select * from shoppingitems_tb where item_id=?";
		try(Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, idtem_id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			
			dto.setItem_id(rs.getInt("item_id"));
			dto.setItem_name(rs.getString("item_name"));
			dto.setItem_price(rs.getInt("item_price"));
			
			rs.close();
		}catch(Exception e) {e.printStackTrace();}
	
		return dto;
	}

}
