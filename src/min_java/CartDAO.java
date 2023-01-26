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

public class CartDAO {
		// 싱글턴 패턴
		private static CartDAO c_dao = new CartDAO();
		private CartDAO() {}
		public static CartDAO getInstance() {
			return c_dao;
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

	//장바구니 table에 입력	
	public int insertCart(CartDTO cart){ 
			String sql = "select * from cart where userid=? and product_id=?";			
			try {
				PreparedStatement pstm = con.prepareStatement(sql);
				pstm.setString(1, cart.getUserid());
				pstm.setInt(2, cart.getProduct_id());
				rs = pstm.executeQuery();				
				if(!rs.next()) {
					String sql2 = "insert into cart values (?,?,?)";
					PreparedStatement pstm2 = con.prepareStatement(sql2);
					pstm2.setString(1, cart.getUserid());
					pstm2.setInt(2, cart.getProduct_id());
					pstm2.setInt(3, cart.getAmount());
					int result = pstm2.executeUpdate();
					return result;
				}
				return 0;
			} catch(SQLException e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		} 
	
	
	public int deleteCart(int product_id, String userid) {
		String sql = "delete from cart where product_id=? and userid= ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			pstmt.setString(2,userid);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	
	}
	
	//장바구니 목록
	public List<CartDTO> listCart(){
		List<CartDTO> c_list = new ArrayList<CartDTO>();
		String sql = "select m.username, p.pname,p.unitprice,c.amount,p.unitprice*c.amount as money\r\n" + 
				"				from member m, product p, cart c\r\n" + 
				"				where m.userid=c.userid and p.pro_no=c.product_id";
	
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				CartDTO cart = new CartDTO(); // 반복문 돌때마다 새로운 멤버빈객체를 만들어서 추가해야 하기에 안에서 선언
				
				cart.setUsername(rs.getString("username"));
				cart.setPname(rs.getString("pname"));
				cart.setUnitprice(rs.getInt("unitprice"));
				cart.setAmount(rs.getInt("amount"));
				cart.setMoney(rs.getInt("money"));

				c_list.add(cart); // 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} return c_list ; // 모든 멤버빈 객체가 추가된 멤버빈리스트 리턴
	}

}
