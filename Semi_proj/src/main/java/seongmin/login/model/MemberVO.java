package seongmin.login.model;

import java.util.Calendar;

public class MemberVO {
	private String userid; 
	private String name; 
	private String pwd;
	private String email; 
	private String mobile;  
	private String postcode;  
	private String address;  
	private String detailaddress;	 
	private String extraaddress; 
	private String gender; 
	private String birthday; 
	private String grade_code; 
	private int point; 
	private String account_name; 
	private String bank_name;
	private int account;

	
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}



	private String registerday; 
	private String laswpwdchangedate; 
	private int status; 
	private int idle; 
	
	/////////////////////////////////////////////////////////////////////////////
	
	private boolean requirePwdChange = false;
	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false
	
	/////////////////////////////////////////////////////////////////////////////

	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGrade_code() {
		return grade_code;
	}
	public void setGrade_code(String grade_code) {
		this.grade_code = grade_code;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
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
	public String getRegisterday() {
		return registerday;
	}
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	public String getlaswpwdchangedate() {
		return laswpwdchangedate;
	}
	public void setlaswpwdchangedate(String laswpwdchangedate) {
		this.laswpwdchangedate = laswpwdchangedate;
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
	
	
	
	public int getAge() {
		int age = 0;
		
		Calendar currentDate = Calendar.getInstance();
		// 현재날짜와 시간을 얻어온다.
		
		int currentYear = currentDate.get(Calendar.YEAR);
		
		age = currentYear - Integer.parseInt(birthday.substring(0, 4)) + 1;    
		
		return age;
	}
	
}
