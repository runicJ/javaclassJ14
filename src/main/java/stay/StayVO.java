package stay;

public class StayVO {
    private int sIdx;
    private String sort;
    private String sName;
    private String sPhoto;
    private int star;
    private String address;
    private String sContent;
    private int guestMax;
    private int price;
    private String residence;
    private String sDate;
    private String sDel;
    
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsPhoto() {
		return sPhoto;
	}
	public void setsPhoto(String sPhoto) {
		this.sPhoto = sPhoto;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	public int getGuestMax() {
		return guestMax;
	}
	public void setGuestMax(int guestMax) {
		this.guestMax = guestMax;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getResidence() {
		return residence;
	}
	public void setResidence(String residence) {
		this.residence = residence;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String getsDel() {
		return sDel;
	}
	public void setsDel(String sDel) {
		this.sDel = sDel;
	}
	
	@Override
	public String toString() {
		return "StayVO [sIdx=" + sIdx + ", sort=" + sort + ", sName=" + sName + ", sPhoto=" + sPhoto + ", star=" + star
				+ ", address=" + address + ", sContent=" + sContent + ", guestMax=" + guestMax + ", price=" + price
				+ ", residence=" + residence + ", sDate=" + sDate + ", sDel=" + sDel + "]";
	}
}
