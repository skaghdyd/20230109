package min_java;


import java.io.FileReader;
import java.net.URLDecoder;
import java.nio.file.attribute.UserPrincipalLookupService;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class JjimDAO {

		// 싱글턴 패턴
		private static JjimDAO jjim_dao = new JjimDAO();
		private JjimDAO() {}
		public static JjimDAO getInstance() {
			return jjim_dao;
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
		
		
			public List<Jjim> selectAll(String userId) {
				List<Jjim> lst = new ArrayList<Jjim>();

				String sql ="select * from product where pro_no IN (select pro_no from jjim where userID = ?)";

				try {
					PreparedStatement pstm = con.prepareStatement(sql);
					pstm.setString(1, userId);
					ResultSet rs = pstm.executeQuery();
					while (rs.next()) {
						Jjim jjim = new Jjim();

						jjim.setPro_no(rs.getInt("pro_no"));
						jjim.setUserid(rs.getString("userid"));
						jjim.setUsername(rs.getString("username"));
						jjim.setPname(rs.getString("pname"));
						jjim.setUnitprice(rs.getInt("unitprice"));

						lst.add(jjim);
					}
					rs.close();
					pstm.close();
					return lst;

				} catch (SQLException e) {

					e.printStackTrace();
				}

				return null;

			}	
	
}

