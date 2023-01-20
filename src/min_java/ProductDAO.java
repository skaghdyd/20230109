package min_java;

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

import org.apache.coyote.http11.filters.SavedRequestInputFilter;

import com.mysql.cj.exceptions.RSAException;
import com.mysql.cj.protocol.ResultsetRows;

import nhy_java.dao.Dao;
import nhy_java.notice.NoticeDto;
import yhj_java.user.User;
import yhj_java.user.UserDAO;

public class ProductDAO {
	// 싱글턴 패턴
	private static ProductDAO dao = new ProductDAO();

	// private ProductDAO() {}
	public static ProductDAO getInstance() {
		return dao;
	}// 싱글턴 패턴 끝

	private Connection con = getConnect();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	List<Product> products = new ArrayList<Product>();

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

	public int productAdd(Product product) {
		String sql = "insert into product values (product_seq.nextval,?,?,?,?,?,?,?,?,?)";
		// ,sysdate
		try {
			System.out.println("여기까지 잘 들어옴!!");
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, product.getProductId());
			pstm.setString(2, product.getPname());
			pstm.setInt(3, product.getUnitPrice());
			pstm.setString(4, product.getDescription());
			pstm.setString(5, product.getManufacturer());
			pstm.setString(6, product.getCategory());
			pstm.setInt(7, product.getUnitsInSock());
			pstm.setString(8, product.getFileName());
			pstm.setString(9, product.getFileRealName());
			int result = pstm.executeUpdate();
			return result;
			// int res = pstm.executeUpdate();
			// pstm.close();
			// return res;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0; // 데이터베이스 오류
	}

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();
		String sql = "select * from product ORDER BY pro_no DESC";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) { // rs.next()는 다음값이 존재하는가를 묻는 것임. 값이 있으면 true를 반환하기에 없을때까지 돌 것임.
				// 고로 전체 멤버빈객체를 구성할 정보 긁어옴
				Product product = new Product(); // 반복문 돌때마다 새로운 멤버빈객체를 만들어서 추가해야 하기에 안에서 선언

				product.setNo(rs.getInt("pro_no"));
				product.setProductId(rs.getInt("productId"));
				product.setPname(rs.getString("pname"));
				product.setUnitPrice(rs.getInt("unitPrice"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInSock(rs.getInt("unitsInSock"));
				product.setFileRealName(rs.getString("fileRealName"));

				products.add(product); //
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products; // 모든 멤버빈 객체가 추가된 멤버빈리스트 리턴
	}
	
	public Product getProductById(int proNo) {
		Product proById = null;
		String sql = "select * from product where pro_no=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			rs = pstmt.executeQuery();
			System.out.println("여기까지 잘 들어옴!!");
			if(rs.next()) {
				proById = new Product();
				proById.setProductId(rs.getInt("productId"));
				proById.setPname(rs.getString("pname"));
				proById.setUnitPrice(rs.getInt("unitPrice"));
				proById.setDescription(rs.getString("description"));
				proById.setManufacturer(rs.getString("manufacturer"));
				proById.setCategory(rs.getString("category"));
				proById.setUnitsInSock(rs.getInt("unitsInSock"));
				proById.setFileRealName(rs.getString("fileRealName"));
				System.out.println("여기까지 잘 들어옴!!2");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return proById;
	}
	public int updateProduct(Product pd) {
		String sql = "update product set productid=?, pname=?, unitprice=?, description=?, manufacturer=?, category=?, fileName=?,filerealName=?"
				+ " where pro_no=?";
		try {
			pstmt = con.prepareStatement(sql);
            
            //바인드 변수에 인자로 받은 VO객체의 변수값 지정하기
			pstmt.setInt(1,  pd.getProductId());
			pstmt.setString(2,  pd.getPname());
			pstmt.setInt(3,  pd.getUnitPrice());
			pstmt.setString(4,  pd.getDescription());
			pstmt.setString(5, pd.getManufacturer());
			pstmt.setString(6, pd.getCategory());
			pstmt.setString(7, pd.getFileName());
			pstmt.setString(8, pd.getFileRealName());
			pstmt.setInt(9, pd.getNo());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	} 
	
	public int deleteProduct(int proNo) {
		String sql = "delete product where pro_no=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	
	}
}