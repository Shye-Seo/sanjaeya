package com.service.unix.memberVo;

public class MemberVo {
	private String user_id;
	private String user_name;
	private String user_pass;
	private String user_phone;
	private String user_mail;
	private String user_mail_id;
	private String user_mail_domain;
	private int authority;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_mail_id() {
		return user_mail_id;
	}
	public void setUser_mail_id(String user_mail_id) {
		this.user_mail_id = user_mail_id;
	}
	public String getUser_mail_domain() {
		return user_mail_domain;
	}
	public void setUser_mail_domain(String user_mail_domain) {
		this.user_mail_domain = user_mail_domain;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
}

/*

create table testmember1(
	user_id VARCHAR(100) primary key,
	user_name varchar(100) not null,
	user_pass varchar(100) not null,
	user_phone varchar(30) not null,
	user_mail varchar(200) not null,
	authority int default 0
);

*/