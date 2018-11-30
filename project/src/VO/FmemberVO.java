package VO;

public class FmemberVO {
	String id;
	String pw;
	String name;
	String nname;
	String addr1;
	String addr2;
	String addr3;
	String pnum1;
	String pnum2;
	String pnum3;

	public FmemberVO() {

	}

	public FmemberVO(String id, String pw, String name, String nname, String addr1, String addr2, String addr3,
			String pnum1, String pnum2, String pnum3) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nname = nname;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.pnum1 = pnum1;
		this.pnum2 = pnum2;
		this.pnum3 = pnum3;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getPnum1() {
		return pnum1;
	}

	public void setPnum1(String pnum1) {
		this.pnum1 = pnum1;
	}

	public String getPnum2() {
		return pnum2;
	}

	public void setPnum2(String pnum2) {
		this.pnum2 = pnum2;
	}

	public String getPnum3() {
		return pnum3;
	}

	public void setPnum3(String pnum3) {
		this.pnum3 = pnum3;
	}

}