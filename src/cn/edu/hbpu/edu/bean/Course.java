package cn.edu.hbpu.edu.bean;
/**
 * 
 * @author Mr.Jiang
 *  课程类
 */
public class Course {
	
	private int courseid;   //课程ID
	
	private String coursename;  //课程名称
	
	private int subjectid;    //所属学科ID
	
	private int schedule; // 课程学时
	
	private String status;  // 状态

	public Course() {
		super();
	}

	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public int getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(int subjectid) {
		this.subjectid = subjectid;
	}

	public int getSchedule() {
		return schedule;
	}

	public void setSchedule(int schedule) {
		this.schedule = schedule;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
