package vo;

public class BoardVO {

	private int bno;
	   private String writer;
	   private String title;
	   private String contents;
	   private int hits;
	   private String regdate;
	   private int status;
	   
	   public BoardVO() {
		   
	   }
	   
	   
	   public BoardVO(int bno, String writer, String title, String contents, int hits, String regdate, int status) {
		   super();
		   this.bno = bno;
		   this.writer = writer;
		   this.title = title;
		   this.contents = contents;
		   this.hits = hits;
		   this.regdate = regdate;
		   this.status = status;
	   }
	   
	   
	  public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
