package com.spring.project.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_zip;
	private String user_addr;
	private String user_addr2;
	private String user_phone;
	private String user_mail_id;
	private String user_mail_domain;
	private Timestamp user_regdate;
	private int user_state;
	private String user_delcont;
	private Date user_deldate;
	private char enabled;
}
