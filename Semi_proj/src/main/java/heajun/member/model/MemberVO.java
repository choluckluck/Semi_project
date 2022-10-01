	 package heajun.member.model;

      public class MemberVO {
	   private String userid;             // 회원아이디
	   private String pwd;                // 비밀번호 (SHA-256 암호화 대상)
	   private String name;               // 회원명
	   private String email;              // 이메일 (AES-256 암호화/복호화 대상)
	   private String mobile;             // 연락처 (AES-256 암호화/복호화 대상) 
	   private String postcode;           // 우편번호
	   private String address;            // 주소
	   private String detailaddress;      // 상세주소
	   private String extraaddress;       // 참고주소
	   private String birthday;           // 생년월일   
	   private String gender;             // 성별 
	   private String grade_code;				  
	   private String point;				  
	   private String account_name;				
	   private String bank_name;			 
	   private String account;		 
	   private String registerday;        // 가입일자 
	   private String last_pwd_change_date;  // 마지막으로 암호를 변경한 날짜  
	   private int status;                // 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
	   private int idle;                  // 휴면유무         0: 활동중  /  1 : 휴면중 
	                     
	   
   /////////////////////////////////////////////////////////////////////
	   
	   private boolean requirePwdChange = false;
	   // 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
	   // 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false
	   
	   /////////////////////////////////////////////////////////////////////

	   public MemberVO() {}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getExtraaddress() {
		return extraaddress;
	}

	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGrade_code() {
		return grade_code;
	}

	public void setGrade_code(String grade_code) {
		this.grade_code = grade_code;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public String getLast_pwd_change_date() {
		return last_pwd_change_date;
	}

	public void setLast_pwd_change_date(String last_pwd_change_date) {
		this.last_pwd_change_date = last_pwd_change_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getIdle() {
		return idle;
	}

	public void setIdle(int idle) {
		this.idle = idle;
	}

	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}

	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}
	   
	  
	   
}
