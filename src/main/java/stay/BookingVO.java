package stay;

public class BookingVO {
	private int bIdx;
	private int sIdx;
	private String mid;
	private String bDate;
	private String checkIn;
	private String checkOut;
	private int guestNum;
	private int total;
	private String status;
	
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(int guestNum) {
		this.guestNum = guestNum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "BookingVO [bIdx=" + bIdx + ", sIdx=" + sIdx + ", mid=" + mid + ", bDate=" + bDate + ", checkIn="
				+ checkIn + ", checkOut=" + checkOut + ", guestNum=" + guestNum + ", total=" + total + ", status="
				+ status + "]";
	}
}
