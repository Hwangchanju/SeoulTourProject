package com.spring.project.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminVO {
	private String admin_id;
	private String admin_pwd;
	private String admin_name;
	private String admin_zip;
	private String admin_addr;
	private String admin_addr2;
	private String admin_phone;
	private String admin_mail_id;
	private String admin_mail_domain;
	private Timestamp admin_regdate;
	private int admin_state;
	private String admin_delcont;
	private String admin_deldate;
	private char enabled;
}
