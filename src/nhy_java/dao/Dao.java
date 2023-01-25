package nhy_java.dao;

import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import nhy_java.notice.CommentDto;
import nhy_java.notice.NoticeDto;

public class Dao {
	private static Dao dao = new Dao();

	private Dao() {
	}

	public static Dao getInstance() {
		return dao;
	}

	private Connection conn = getConnect();
	private Connection getConnect() {
		try {
			Properties prop = new Properties();
			String path = Dao.class.getResource("db.properties").getPath();
			path = URLDecoder.decode(path, "utf-8");
			prop.load(new FileReader(path));
			String driver = prop.getProperty("driver");
			Class.forName(driver);
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String pw = prop.getProperty("pw");
			Connection conn = DriverManager.getConnection(url, user, pw);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<NoticeDto> notice_selectAll(int selectedPage, int postCount) {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		String sql = "select *\r\n" + "from(\r\n" + "    select rownum rn, a.*\r\n"
				+ "    from (select idx, author, title, content, saveFileName, realFileName, createDate, hit\r\n"
				+ "            from notice order by idx desc) a\r\n" + "    )\r\n" + "where rn > ? and rn <= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (selectedPage - 1) * postCount);
			pstmt.setInt(2, selectedPage * postCount);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String saveFileName = rs.getString("saveFileName");
				String realFileName = rs.getString("realFileName");
				String createDate = rs.getString("createDate");
				int hit = rs.getInt("hit");
				NoticeDto noticeDto = new NoticeDto(idx, author, title, content, saveFileName, realFileName, createDate, hit, "");
				list.add(noticeDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public NoticeDto notice_selectOne(int idx) {
		String sql = "select idx, author, title, content, saveFileName, realFileName, createDate, hit\r\n" + "from notice where idx = ?";
		NoticeDto noticeDto = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String saveFileName = rs.getString("saveFileName");
				String realFileName = rs.getString("realFileName");
				String createDate = rs.getString("createDate");
				int hit = rs.getInt("hit");
				noticeDto = new NoticeDto(idx, author, title, content, saveFileName, realFileName, createDate, hit, "");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return noticeDto;
	}

	public int notice_write(NoticeDto noticeDto) {
		String sql = "insert into notice (idx, author, title, content, saveFileName, realFileName, createDate, hit)\r\n"
				+ "values(?,?,?,?,?,?,?,?)";
		int rs = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_getMaxIdx());
			pstmt.setString(2, noticeDto.getAuthor());
			pstmt.setString(3, noticeDto.getTitle());
			pstmt.setString(4, noticeDto.getContent());
			pstmt.setString(5, noticeDto.getSaveFileName());
			pstmt.setString(6, noticeDto.getRealFileName());
			pstmt.setString(7, noticeDto.getCreateDate());
			pstmt.setInt(8, noticeDto.getHit());
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	private int notice_getMaxIdx() {
		String sql = "select case when max(idx) is null then 1 else max(idx)+1 end as idx_max\r\n" + "from notice";
		int idx_max = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				idx_max = rs.getInt("idx_max");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return idx_max;
	}

	public int notice_getTotalPost() {
		String sql = "select count(*) from notice";
		int postCount = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				postCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return postCount;
	}
	
	public int notice_update(NoticeDto noticeDto) {
		//파일 수정 안한 경우
		if(noticeDto.getSaveFileName()==null || noticeDto.getRealFileName()==null) {
			String sql = "update notice\r\n" + 
					"set title = ?,\r\n" + 
					"content = ?,\r\n" + 
					"modifydate = ?\r\n" + 
					"where idx = ?";
			int rs = 0;
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, noticeDto.getTitle());
				pstmt.setString(2, noticeDto.getContent());
				pstmt.setString(3, noticeDto.getModifyDate());
				pstmt.setInt(4, noticeDto.getIdx());
				rs = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return rs;
			
		//파일 수정을 한 경우
		} else {
			String sql = "update notice\r\n" + 
					"set title = ?,\r\n" + 
					"content = ?,\r\n" + 
					"saveFileName = ?,\r\n" + 
					"realFileName = ?,\r\n" + 
					"modifydate = ?\r\n" + 
					"where idx = ?";
			int rs = 0;
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, noticeDto.getTitle());
				pstmt.setString(2, noticeDto.getContent());
				pstmt.setString(3, noticeDto.getSaveFileName());
				pstmt.setString(4, noticeDto.getRealFileName());
				pstmt.setString(5, noticeDto.getModifyDate());
				pstmt.setInt(6, noticeDto.getIdx());
				rs = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return rs;
		}
	}
	
	public int notice_addHit(int idx) {
		String sql = "update notice\r\n" + 
				"set hit = hit+1\r\n" + 
				"where idx = ?";
		int rs = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public static void main(String[] args) {
		Dao.getInstance();
	}
	
	public List<CommentDto> notice_comment_select(int notice_idx) {
		String sql = "select comment_idx, author, content, createDate\r\n"
				+ "from noticeComment\r\n"
				+ "where notice_idx = ?\r\n"
				+ "order by comment_idx";
		
		List<CommentDto> list = new ArrayList<CommentDto>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_idx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int comment_idx = rs.getInt(1);
				String author = rs.getString(2);
				String content = rs.getString(3);
				String createDate = rs.getString(4);
				CommentDto commentDto = new CommentDto(0, comment_idx, author, content, createDate);
				list.add(commentDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int notice_comment_write(CommentDto commentDto) {
		String sql = "insert into noticecomment (notice_idx, comment_idx, author, content, createDate)\r\n" + 
				"values (?,?,?,?,?)";
		int rs = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentDto.getNotice_idx());
			pstmt.setInt(2, notice_comment_getMaxIdx(commentDto.getNotice_idx()));
			pstmt.setString(3, commentDto.getAuthor());
			pstmt.setString(4, commentDto.getContent());
			pstmt.setString(5, commentDto.getCreateDate());
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}
	
	private int notice_comment_getMaxIdx(int notice_idx) {
		String sql = "select case when max(comment_idx) is null then 1 else max(comment_idx)+1 end as comment_idx_max\r\n"
				+ "from noticecomment\r\n"
				+ "where notice_idx = ?";
		int comment_idx_max = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_idx);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				comment_idx_max = rs.getInt("comment_idx_max");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return comment_idx_max;
	}
	
	public int notice_comment_delete(int notice_idx, int comment_idx) {
		String sql = "delete from noticeComment\r\n" + 
				"where notice_idx = ?\r\n" + 
				"and comment_idx = ?";
		int rs = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_idx);
			pstmt.setInt(2, comment_idx);
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}
	
	public int notice_comment_modify(int notice_idx, int comment_idx, String modifyContent) {
		String sql = "update noticeComment\r\n" +
				"set content = ?\r\n" +
				"where notice_idx = ?\r\n" + 
				"and comment_idx = ?";
		int rs = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modifyContent);
			pstmt.setInt(2, notice_idx);
			pstmt.setInt(3, comment_idx);
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
}
