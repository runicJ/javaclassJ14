package stay;

public class FilterVO {
    private int fIdx;
    private int bed;
    private int toilet;
    private boolean wifi;
    private boolean ac;
    private boolean parking;
    private boolean pet;
    private boolean kitchen;
    private boolean washing;
    private int sIdx;
    
	public int getfIdx() {
		return fIdx;
	}
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}
	public int getBed() {
		return bed;
	}
	public void setBed(int bed) {
		this.bed = bed;
	}
	public int getToilet() {
		return toilet;
	}
	public void setToilet(int toilet) {
		this.toilet = toilet;
	}
	public boolean isWifi() {
		return wifi;
	}
	public void setWifi(boolean wifi) {
		this.wifi = wifi;
	}
	public boolean isAc() {
		return ac;
	}
	public void setAc(boolean ac) {
		this.ac = ac;
	}
	public boolean isParking() {
		return parking;
	}
	public void setParking(boolean parking) {
		this.parking = parking;
	}
	public boolean isPet() {
		return pet;
	}
	public void setPet(boolean pet) {
		this.pet = pet;
	}
	public boolean isKitchen() {
		return kitchen;
	}
	public void setKitchen(boolean kitchen) {
		this.kitchen = kitchen;
	}
	public boolean isWashing() {
		return washing;
	}
	public void setWashing(boolean washing) {
		this.washing = washing;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	
	@Override
	public String toString() {
		return "filterVO [fIdx=" + fIdx + ", bed=" + bed + ", toilet=" + toilet + ", wifi=" + wifi + ", ac=" + ac
				+ ", parking=" + parking + ", pet=" + pet + ", kitchen=" + kitchen + ", washing=" + washing + ", sIdx="
				+ sIdx + "]";
	}
}
