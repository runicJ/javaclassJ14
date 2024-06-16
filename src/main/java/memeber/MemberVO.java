package memeber;

public class MemberVO {  // 2
	private int mIdx;
	private String mid;
	private String pwd;
	private String name;
	private String nickName;
	private String tel;
	private String email;
	private String residence;
	private String photo;
	private String content;
	private String startDate;
	private String lastDate;
	private String userInfo;
	private String userDel;
	
	private int deleteDiff;

	public int getmIdx() {
		return mIdx;
	}

	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public String getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	public String getUserDel() {
		return userDel;
	}

	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}

	public int getDeleteDiff() {
		return deleteDiff;
	}

	public void setDeleteDiff(int deleteDiff) {
		this.deleteDiff = deleteDiff;
	}

	@Override
	public String toString() {
		return "MemberVO [mIdx=" + mIdx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName
				+ ", tel=" + tel + ", email=" + email + ", residence=" + residence + ", photo=" + photo + ", content="
				+ content + ", startDate=" + startDate + ", lastDate=" + lastDate + ", userInfo=" + userInfo
				+ ", userDel=" + userDel + ", deleteDiff=" + deleteDiff + "]";
	}
}
