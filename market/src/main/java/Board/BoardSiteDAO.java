package Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardSiteDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BoardSiteDAO() {
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
	
	public String getDate() {
		String query = "SELECT NOW()";
		
		try {
			PreparedStatement pstat = conn.prepareStatement(query);
			rs = pstat.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String query = "select BoardId from board order by BoardId desc";
		
		try {
			PreparedStatement pstat = conn.prepareStatement(query);
			rs = pstat.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String BoardTitle, String UserId, String BoardContent, String Image) {
		String query = "insert into board values(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstat = conn.prepareStatement(query);
			
			pstat.setInt(1, getNext());
			pstat.setString(2, BoardTitle);
			pstat.setString(3, UserId);
			pstat.setString(4, getDate());
			pstat.setString(5, BoardContent);
			pstat.setString(6, Image);
			pstat.setInt(7, 1);
			
			return pstat.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//한 페이지에 10개의 게시글을 읽어옴
	public ArrayList<BoardSite> getList(int pageNumber) {
		String query = "select * from board where BoardId "
				+ "< ? and BoardAvailable = 1 order by BoardId desc limit 10";
		ArrayList<BoardSite> boardList = new ArrayList<BoardSite>();
		
		try {
			PreparedStatement pstat = conn.prepareStatement(query);
			pstat.setInt(1, getNext() - ((pageNumber-1)*10));
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				BoardSite board = new BoardSite();
				board.setBoardId(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserId(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setImage(rs.getString(6));
				board.setBoardAvailable(rs.getInt(7));
				boardList.add(board);
			}	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	//게시글 수에 따라 페이징 처리
	public boolean nextPage(int pageNumber) {
		String query = "select * from board where BoardId < ? and "
				+ "BoardAvailable = 1 order by BoardId desc limit 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getNext() - ((pageNumber-1)*10));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//선택한 1개의 글을 읽어옴
	public BoardSite getBoard(int BoardId) {
		String query = "select * from board where BoardId =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, BoardId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BoardSite board = new BoardSite();
				board.setBoardId(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserId(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setImage(rs.getString(6));
				board.setBoardAvailable(rs.getInt(7));
				return board;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//여기까지 1개의 글 읽어옴
	
	//글 수정
	public int modify(int BoardId, String BoardTitle, String BoardContent) {
		String query = "update board set BoardTitle = ?, BoardContent = ? where BoardId =?";
		
		try {
			PreparedStatement pstat = conn.prepareStatement(query);
			pstat.setString(1, BoardTitle);
			pstat.setString(2, BoardContent);
			pstat.setInt(3, BoardId);
			
			return pstat.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//글 삭제
	public int delete(int BoardId) {
		String query = "update board set BoardAvailable = 0 where BoardId = ?";
		
		try {
			PreparedStatement pstat = conn.prepareStatement(query);
			pstat.setInt(1, BoardId);
			
			return pstat.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}


