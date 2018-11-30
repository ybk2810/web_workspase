package VO;

public class ReviewVO {

   int rno;
   int fno;
   String rwriter;
   String rcontents;
   String star;
   String regdate;

   public ReviewVO() {

   }

  

   public ReviewVO(int rno, int fno, String rwriter, String rcontents, String star, String regdate) {
	super();
	this.rno = rno;
	this.fno = fno;
	this.rwriter = rwriter;
	this.rcontents = rcontents;
	this.star = star;
	this.regdate = regdate;
}



public int getRno() {
      return rno;
   }

   public void setRno(int rno) {
      this.rno = rno;
   }

   public int getFno() {
      return fno;
   }

   public void setFno(int fno) {
      this.fno = fno;
   }

   public String getRwriter() {
      return rwriter;
   }

   public void setRwriter(String rwriter) {
      this.rwriter = rwriter;
   }

   public String getRcontents() {
      return rcontents;
   }

   public void setRcontents(String rcontents) {
      this.rcontents = rcontents;
   }

   public String getStar() {
      return star;
   }

   public void setStar(String star) {
      this.star = star;
   }

   public String getRegdate() {
      return regdate;
   }

   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }

}