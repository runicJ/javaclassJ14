package stay;

public class FacilityVO {
    private int fIdx;
    private int bed;
    private int toilet;
    private String wifi;
    private String ac;
    private String parking;
    private String pet;
    private String kitchen;
    private String washing;
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
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
	}
	public String getAc() {
		return ac;
	}
	public void setAc(String ac) {
		this.ac = ac;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
	public String getKitchen() {
		return kitchen;
	}
	public void setKitchen(String kitchen) {
		this.kitchen = kitchen;
	}
	public String getWashing() {
		return washing;
	}
	public void setWashing(String washing) {
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
		return "FacilityVO [fIdx=" + fIdx + ", bed=" + bed + ", toilet=" + toilet + ", wifi=" + wifi + ", ac=" + ac
				+ ", parking=" + parking + ", pet=" + pet + ", kitchen=" + kitchen + ", washing=" + washing + ", sIdx="
				+ sIdx + "]";
	}
}
