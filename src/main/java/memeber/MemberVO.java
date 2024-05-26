package memeber;

public class MemberVO {  // 2
	private int mIdx;
	private String mid;
	private String pwd;
	private String name;
	private String nickName;
	private String tel;
	private String email;
	private String photo;
	private String content;
	private String startDate;
	private String lastDate;
	private String userInfo;
	private String userDel;
	
	private int deleteDiff;

	int getmIdx() {
		return mIdx;
	}

	void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}

	String getMid() {
		return mid;
	}

	void setMid(String mid) {
		this.mid = mid;
	}

	String getPwd() {
		return pwd;
	}

	void setPwd(String pwd) {
		this.pwd = pwd;
	}

	String getName() {
		return name;
	}

	void setName(String name) {
		this.name = name;
	}

	String getNickName() {
		return nickName;
	}

	void setNickName(String nickName) {
		this.nickName = nickName;
	}

	String getTel() {
		return tel;
	}

	void setTel(String tel) {
		this.tel = tel;
	}

	String getEmail() {
		return email;
	}

	void setEmail(String email) {
		this.email = email;
	}

	String getPhoto() {
		return photo;
	}

	void setPhoto(String photo) {
		this.photo = photo;
	}

	String getContent() {
		return content;
	}

	void setContent(String content) {
		this.content = content;
	}

	String getStartDate() {
		return startDate;
	}

	void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	String getLastDate() {
		return lastDate;
	}

	void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	String getUserInfo() {
		return userInfo;
	}

	void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	String getUserDel() {
		return userDel;
	}

	void setUserDel(String userDel) {
		this.userDel = userDel;
	}

	int getDeleteDiff() {
		return deleteDiff;
	}

	void setDeleteDiff(int deleteDiff) {
		this.deleteDiff = deleteDiff;
	}

	@Override
	public String toString() {
		return "MemberVO [mIdx=" + mIdx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName
				+ ", tel=" + tel + ", email=" + email + ", photo=" + photo + ", content=" + content + ", startDate="
				+ startDate + ", lastDate=" + lastDate + ", userInfo=" + userInfo + ", userDel=" + userDel
				+ ", deleteDiff=" + deleteDiff + "]";
	}
	
}
