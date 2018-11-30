package vo;

public class ImageVO {
	private int no;
	private String name;
	private String filePath;
	
	public ImageVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ImageVO(int no, String name, String filePath) {
		super();
		this.no = no;
		this.name = name;
		this.filePath = filePath;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
}
