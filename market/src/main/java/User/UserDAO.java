package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String url ="jdbc:mysql://localhost:3306/market";
			String id = "root";
			String pw = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String UserId, String UserPw) {  //로그인에서 사용
		String query = "select UserPw from user WHERE UserId =?";
		
		try {
			pstat = conn.prepareStatement(query);
			pstat.setString(1, UserId);
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(UserPw)) {
					return 1;	//로그인 성공
				} else {
					return 0;	//로그인 실패
				}
			}
			return -1;	//ID가 없음
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터 베이스 오류
	}
	
	public int join(User user) {
		String query = "INSERT INTO user VALUES (?,?,?,?)";
		
		try {
			pstat = conn.prepareStatement(query);
			pstat.setString(1, user.getUserId());
			pstat.setString(2, user.getUserPw());
			pstat.setString(3, user.getUserName());
			pstat.setString(4, user.getUserEmail());
			
			return pstat.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
}
