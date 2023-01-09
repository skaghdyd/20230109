package min_java.user;

import java.io.FileReader;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
 
public class UserDAO {

	private Connection conn= getConnect();   
	// DB에 접근하는 객체

	private PreparedStatement pstmt;

	private ResultSet rs;
	
	private static UserDAO userDao = new UserDAO();
	// single turn 목적으로 private으로 생성시킴
	
	public static UserDAO getInstance() {
		return userDao;
	}
	
	private UserDAO() {
	} // 근데 여러개 접속할 수 없게 private으로 선언
	
	private Connection getConnect() {
		try {
			Properties prop = new Properties();
			String path = 
					UserDAO.class.getResource("db.properties").getPath();//해당위치에 있는 걸..
			path = URLDecoder.decode(path,"utf-8"); // 한글안깨지게 
			prop.load(new FileReader(path)); // 파일을 읽어올 목적 
			String driver = prop.getProperty("driver"); //드라이버값을가져와라. 
			System.out.println(driver);
			
			Class.forName(driver);
			String url = prop.getProperty("url");
			System.out.println(url);
			String user = prop.getProperty("user");
			System.out.println(user);
			String pw = prop.getProperty("pw");
			System.out.println(pw);

			Connection conn = DriverManager.getConnection(url, user, pw);
			return conn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public User select(int num) {
		String sql = "select * from user1 where userID = ?";
		User user = null;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, num);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				String userID = rs.getString("userID");
				String userPassword = rs.getString("userPassword");
				String userName = rs.getString("userName");
				String userGender = rs.getString("userGender");
				String userEmail = rs.getString("userEmail");

				user = new User(userID,userPassword, userName, userGender,userEmail);

			}
			rs.close();
			pstm.close();
			return user;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}


    public int login(String userID, String userPassword) {
        String sql = "SELECT userPassword FROM USER1 WHERE userID = ?";
        try {
        	PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
            	        	
                if(rs.getString(1).equals(userPassword))
                    return 1;    // 로그인 성공
                else
                    return 0; // 비밀번호 불일치
            }
            return -1; // ID가 없음
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB 오류
        
    }
	
    public int join(User user) {
        String sql = "INSERT INTO USER1 (UserID,UserPassword,UserName,UserGender,UserEmail) VALUES (?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            return pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB 오류
        
    }
    public static void main(String[] args) {
//    	User user = new User("ckalswl11", "1234567", "차차민", "여자","minji@gmail.com");
//    	int result = UserDAO.getInstance().join(user);
//		System.out.println(result);
    	UserDAO.getInstance();
	}
    
    
}
