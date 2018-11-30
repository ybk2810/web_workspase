package vo;

public class ProductVO {
	
	private int pno;
	private String pname;
	private String prodesc;
	private int price;
	private int dcratio;
	private int qty;
	private String imgfile;
	private String bigfile;
	
	public ProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductVO(int pno, String pname, String prodesc, int price, int dcratio, int qty, String imgfile,
			String bigfile) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.prodesc = prodesc;
		this.price = price;
		this.dcratio = dcratio;
		this.qty = qty;
		this.imgfile = imgfile;
		this.bigfile = bigfile;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getProdesc() {
		return prodesc;
	}

	public void setProdesc(String prodesc) {
		this.prodesc = prodesc;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDcratio() {
		return dcratio;
	}

	public void setDcratio(int dcratio) {
		this.dcratio = dcratio;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getImgfile() {
		return imgfile;
	}

	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}

	public String getBigfile() {
		return bigfile;
	}

	public void setBigfile(String bigfile) {
		this.bigfile = bigfile;
	}


	
	
}
