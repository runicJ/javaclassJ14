package blog;

public class BlogVO {
	private int tIdx;
	private String mid;
	private String nickName;
	private String tPhoto;
	private String title;
	private String sort;
	private String tDate;
	private int viewCnt;
	private int likedCnt;
	private String openSw;
	private String hostIp;
	private String tContent;
	private String complaint;
	
	public int gettIdx() {
		return tIdx;
	}
	public void settIdx(int tIdx) {
		this.tIdx = tIdx;
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
	public String gettPhoto() {
		return tPhoto;
	}
	public void settPhoto(String tPhoto) {
		this.tPhoto = tPhoto;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String gettDate() {
		return tDate;
	}
	public void settDate(String tDate) {
		this.tDate = tDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getLikedCnt() {
		return likedCnt;
	}
	public void setLikedCnt(int likedCnt) {
		this.likedCnt = likedCnt;
	}
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String gettContent() {
		return tContent;
	}
	public void settContent(String tContent) {
		this.tContent = tContent;
	}
	public String getComplaint() {
		return complaint;
	}
	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}
	
	@Override
	public String toString() {
		return "BlogVO [tIdx=" + tIdx + ", mid=" + mid + ", nickName=" + nickName + ", tPhoto=" + tPhoto + ", title="
				+ title + ", sort=" + sort + ", tDate=" + tDate + ", viewCnt=" + viewCnt + ", likedCnt=" + likedCnt
				+ ", openSw=" + openSw + ", hostIp=" + hostIp + ", tContent=" + tContent + ", complaint=" + complaint
				+ "]";
	}
	
}
