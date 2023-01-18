package min_java;

import java.io.FileReader;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import nhy_java.dao.Dao;
import yhj_java.user.UserDAO;

public class ProductDAO {
	// 싱글턴 패턴
	private static ProductDAO dao = new ProductDAO();
//	private ProductDAO() {}
	public static ProductDAO getInstance() {
		return dao;
	}// 싱글턴 패턴 끝
	
	private Connection con = getConnect();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnect() {
		try {
			Properties prop = new Properties();
			String path = ProductDAO.class.getResource("db.properties").getPath();
			path = URLDecoder.decode(path, "utf-8");
			prop.load(new FileReader(path));
			String driver = prop.getProperty("driver");
			Class.forName(driver);
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String pw = prop.getProperty("pw");
			Connection con = DriverManager.getConnection(url, user, pw);
			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("DB연결 실패");
		return null;
	}


	
	public int productAdd(Product product){
		String sql = "insert into product values (product_seq.nextval,?,?,?,?,?,?,?)";
//		,sysdate
		try {
			System.out.println("여기까지 잘 들어옴!!");
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, product.getProductId());
			pstm.setString(2, product.getPname());
			pstm.setInt(3, product.getUnitPrice());
			pstm.setString(4, product.getDescription());
			pstm.setString(5, product.getManufacturer());
			pstm.setString(6,product.getCategory());
			pstm.setInt(7, product.getUnitsInSock());
			int result = pstm.executeUpdate();
			return result;
//			int res = pstm.executeUpdate();
//			pstm.close();
//			return res;
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return 0; // 데이터베이스 오류
	}
	
}
