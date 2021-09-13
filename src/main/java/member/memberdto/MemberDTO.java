package member.memberdto;

public class MemberDTO {
	
	private int no;
	private String id;
	private String password;
	private String name;
	private String email;
	private String tel1;
	private String tel2;
	private String tel3;

	public MemberDTO() {
		
	}
	
	
	public MemberDTO(String id, String password, String name, String email, String tel1, String tel2, String tel3) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
	}





	public MemberDTO(int no, String id, String password, String name, String email, String tel1, String tel2,
			String tel3) {
		super();
		this.no = no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
	}




	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	
	
}
