package member;

import java.util.Date;

public class MemberDto {
	
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String phone_no;
	private int member_auth;
	private Date reg_date;//import 단축키  : 컨트롤 + 쉬프트 + o
	
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public int getMember_auth() {
		return member_auth;
	}
	public void setMember_auth(int member_auth) {
		this.member_auth = member_auth;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
