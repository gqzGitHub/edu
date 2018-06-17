package cn.edu.hbpu.edu.bean;

import java.io.Serializable;

public class Subject implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int subjectid;
	
	private String subjectname;
	
	private  String status;

	public Subject() {
		super();
	}

	public int getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(int subjectid) {
		this.subjectid = subjectid;
	}

	public String getSubjectname() {
		return subjectname;
	}

	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
