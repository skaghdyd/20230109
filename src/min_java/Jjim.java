package min_java;


public class Jjim {
    private int pro_no;
    private String userid;
    private String username;
    private String pname;
    private int unitprice;
	public Jjim(int pro_no, String userid, String username, String pname, int unitprice) {
		super();
		this.pro_no = pro_no;
		this.userid = userid;
		this.username = username;
		this.pname = pname;
		this.unitprice = unitprice;
	}
	public Jjim() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}
    
    
}
