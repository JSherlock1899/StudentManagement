package poi;

public class ExcelInformation {

	
	private String id;
	private String username;
	private String nickname;
	private String password;
	private String Gender;
	private String phone;
	private String Nation;
	private String JiGuan; 
	private String ClassID;
	
	
	public ExcelInformation(String id, String username, String nickname, String password, String gender, String phone,
			String nation, String jiGuan, String classID) {
		super();
		this.id = id;
		this.username = username;
		this.nickname = nickname;
		this.password = password;
		Gender = gender;
		this.phone = phone;
		Nation = nation;
		JiGuan = jiGuan;
		ClassID = classID;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getGender() {
		return Gender;
	}


	public void setGender(String gender) {
		Gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getNation() {
		return Nation;
	}


	public void setNation(String nation) {
		Nation = nation;
	}


	public String getJiGuan() {
		return JiGuan;
	}


	public void setJiGuan(String jiGuan) {
		JiGuan = jiGuan;
	}


	public String getClassID() {
		return ClassID;
	}


	public void setClassID(String classID) {
		ClassID = classID;
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
