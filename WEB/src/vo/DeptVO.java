package vo;

// Value Object
public class DeptVO {
	private int deptno;
	private String dname;
	private String loc;
	
	// �⺻������ (��Ŭ�� �ҽ� ������)
	public DeptVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// �Ű����� �ִ� ������ (��Ŭ�� �ҽ� ���������� �ι�°)
	public DeptVO(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}
	
	


	// setter
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	// getter
	public int getDeptno() {
		return deptno;
	}
	public String getDname() {
		return dname;
	}
	public String getLoc() {
		return loc;
	}
	
	
}
