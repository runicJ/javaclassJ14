package admin.review;

public class ReviewVO {
	private int rIdx;
	private String part;
	private int partIdx;
	private String mid;
	private String nickName;
	private int star;
	private String rContent;
	private String rDate;
	private String purpose;
	private int bIdx;

	private String userInfo;
	private String photo;
	
	public int getrIdx() {
		return rIdx;
	}
	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getPartIdx() {
		return partIdx;
	}
	public void setPartIdx(int partIdx) {
		this.partIdx = partIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public String getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "ReviewVO [rIdx=" + rIdx + ", part=" + part + ", partIdx=" + partIdx + ", mid=" + mid + ", nickName="
				+ nickName + ", star=" + star + ", rContent=" + rContent + ", rDate=" + rDate + ", purpose=" + purpose
				+ ", bIdx=" + bIdx + ", userInfo=" + userInfo + ", photo=" + photo + "]";
	}
}
