package com.spring.project.model;

import java.io.File;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ContVO {
	private int content_no;
	private String content_id;
	private String content_name;
	private String content_title;
	private String content_local;
	private String content_cont; //Clob , Blob
	private String content_file;
	private int content_hit;
	private int content_ref;
	private int content_step;
	private int content_level;
	private Timestamp content_regdate;
	
	private File thumbnail;
	
	private boolean newCont;
}
