package VO;

public class FoodVO {

	private int fno;
	private String mfno;
	private String fname;
	private String fimage;
	private String kind;
	private int pnum;
	private int ctime;
	private String recipeimg;

	public FoodVO() {

	}

	public FoodVO(int fno, String mfno, String fname, String fimage, String kind, int pnum, int ctime,
			String recipeimg) {
		super();
		this.fno = fno;
		this.mfno = mfno;
		this.fname = fname;
		this.fimage = fimage;
		this.kind = kind;
		this.pnum = pnum;
		this.ctime = ctime;
		this.recipeimg = recipeimg;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getMfno() {
		return mfno;
	}

	public void setMfno(String mfno) {
		this.mfno = mfno;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFimage() {
		return fimage;
	}

	public void setFimage(String fimage) {
		this.fimage = fimage;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public int getCtime() {
		return ctime;
	}

	public void setCtime(int ctime) {
		this.ctime = ctime;
	}

	public String getRecipeimg() {
		return recipeimg;
	}

	public void setRecipeimg(String recipeimg) {
		this.recipeimg = recipeimg;
	}

	
}