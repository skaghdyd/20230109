package min_java;


public class CartDTO {
	 
    private int cart_id;
    private String userid;
    private String username;
    private int product_id;
    private String pname;
    private int unitprice;
    private int money;
    private int amount;
    
	public CartDTO(int cart_id, String userid, String username, int product_id, String pname, int unitprice, int money,
			int amount) {
		super();
		this.cart_id = cart_id;
		this.userid = userid;
		this.username = username;
		this.product_id = product_id;
		this.pname = pname;
		this.unitprice = unitprice;
		this.money = money;
		this.amount = amount;
	}

	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", userid=" + userid + ", username=" + username + ", product_id="
				+ product_id + ", pname=" + pname + ", unitprice=" + unitprice + ", money=" + money + ", amount="
				+ amount + "]";
	}
    
    
}
