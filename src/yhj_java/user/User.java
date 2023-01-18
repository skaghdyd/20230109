package yhj_java.user;


public class User {
	private int no;
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userPostcode;
	private String userAdd;
	private String userDetailAdd;
	private String userGender;
	private String userBirth;
	private String joindate;
	private int userPoint;

	public User() {
	}

	public User(int no, String userId, String userPw, String userName, String userEmail, String userPhone,
			String userPostcode, String userAdd, String userDetailAdd, String userGender, String userBirth,
			String joindate, int userPoint) {
		super();
		this.no = no;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userPostcode = userPostcode;
		this.userAdd = userAdd;
		this.userDetailAdd = userDetailAdd;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.joindate = joindate;
		this.userPoint = userPoint;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserPostcode() {
		return userPostcode;
	}

	public void setUserPostcode(String userPostcode) {
		this.userPostcode = userPostcode;
	}

	public String getUserAdd() {
		return userAdd;
	}

	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}

	public String getUserDetailAdd() {
		return userDetailAdd;
	}

	public void setUserDetailAdd(String userDetailAdd) {
		this.userDetailAdd = userDetailAdd;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	@Override
	public String toString() {
		return "User [no=" + no + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", userPostcode=" + userPostcode
				+ ", userAdd=" + userAdd + ", userDetailAdd=" + userDetailAdd + ", userGender=" + userGender
				+ ", userBirth=" + userBirth + ", joindate=" + joindate + ", userPoint=" + userPoint + "]";
	};
	
	

}
