package cn.edu.hbpu.edu.bean;

public class Score {
	
	private String scoreid;
	
	private String studentid ;
	
	private String studentname;
	
	private String courseid;
	
	private String coursename;
	
	private double score;

	public Score() {
		super();
	}

	
	public Score(String studentid, String studentname, String courseid,
			String coursename) {
		super();
		this.studentid = studentid;
		this.studentname = studentname;
		this.courseid = courseid;
		this.coursename = coursename;
	}


	public String getScoreid() {
		return scoreid;
	}

	public void setScoreid(String scoreid) {
		this.scoreid = scoreid;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	
	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	
	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}


	@Override
	public String toString() {
		return "Score [scoreid=" + scoreid + ", studentid=" + studentid
				+ ", studentname=" + studentname + ", courseid=" + courseid
				+ ", coursename=" + coursename + ", score=" + score + "]";
	}
	
	

}
