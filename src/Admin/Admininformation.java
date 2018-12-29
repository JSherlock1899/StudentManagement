package Admin;

public class Admininformation {
	
	private String adminname;
	private String password;

	public Admininformation(String adminname, String password) {
		this.adminname = adminname;
		this.password = password;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
